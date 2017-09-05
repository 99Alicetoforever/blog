/**
 * Created by Administrator on 2017/3/4.
 */
//路由操作
    //先加载express
var express=require("express");
//再加载路由
var mysql=require("mysql");
var router=express.Router();

var pool=mysql.createPool({    //数据连接池
    host:"127.0.0.1",
    port:3306,
    database:"blog",
    user:"root",
    password:"aaaa"
});

var data={};
//每一次查询都要用导航栏，因此，我们干脆查一次，然后保存到全局变量
router.use(function(req,res,next){
    pool.getConnection(function(err,conn){
        conn.query("select * from type order by tid",function (err,result) {
            conn.release();
            data.type=result;
            next();
        });
    })
})

// router.get("/",function (req,res) {
//     //使用模板引擎去渲染页面，两个参数
//     //1,第一个参数路径    第二个参数：分配给模板所使用的引擎
//
//     res.render("main/index",{
//         userInfo:req.session.user
//     });
// });

router.get("/",function (req,res,next) {
    //第一个参数模板的路径   第二个参数：分配给模板使用的数据
    var page=Number(req.query.page||1);
    var size=3;
     pool.getConnection(function (err,conn) {
         conn.query("select * from type",function(err,result){
             conn.query("select c.*,t.tname from contents c,type t where c.tid=t.tid",function (err,resu) {
                 var count=resu.length;
                 var pages=Math.ceil(count/size);
                 //控制页数
                 page=Math.min(page,page);
                 page=Math.max(page,1);
                 conn.query("select c.*,u.uname,t.tname from contents c,user u,type t where c.tid=t.tid and c.uid=u.uid order by cid limit ?,?",[size*(page-1),size],function (err,rs) {
                     conn.release();
                     if(err||rs.length<=0){
                         console.log(err);
                     }else{
                         //处理一下评论条数
                         for(var i=0;i<rs.length;i++){
                             var length=rs[i].comments.split(";").length;
                             if(length==0){
                                 rs[i].comments=0;
                             }else{
                                 rs[i].comments=length-1;
                             }
                         }

                         res.render('main/index',{
                             userInfo:req.session.user,
                             cate:result,
                             allContent:rs,
                             tag:"content",
                             page:page,
                             pages:pages,
                             count:count,
                             size:size
                         });
                     }
                 })
             })
         })
     });
});

router.get("/view",function(req,res){
    var cid=req.query.contentid;
    //console.log(cid);
    pool.getConnection(function (err,conn) {
        conn.query("select c.*,u.uname from contents c,user u where c.uid=u.uid and c.cid=? ",[cid],function(err,result){
            conn.release();
            //处理一下你的评论信息
            var mycomments=result[0].comments.split(";");
            var comments=[];
            var mydata={};
            //注意
            for(var i=0;i<mycomments.length-1;i++){
                mydata.uname=mycomments[i].split(",")[0];
                mydata.ttime=mycomments[i].split(",")[1];
                mydata.content=mycomments[i].split(",")[2];
                comments.push(mydata);
                mydata={};
            };
            comments.reverse();    //数组倒序
            result[0].comments=comments.length;

            res.render("main/view",{
                userInfo:req.session.user,
                content:result[0],
                categories:data.type,
                comments:comments,
                tid:result[0].tid
            })
        })

    })
})

//2.把这个路由的文件和主模块连接起来
module.exports=router;