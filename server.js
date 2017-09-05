/**
 * Created by Administrator on 17-3-4.
 */
//加入路由的原因：目前代码太多，还有不方便整合，
//首先定义路由的路径，
var express=require("express");
//加载cookie
var cookieParser=require("cookie-parser");
//下载插件，并加载插件
var session=require("express-session");  //session模块
var mysql=require("mysql");
var bodyParser=require("body-parser");
//加载模块引擎
var swig=require("swig");



var app=express();
app.use(cookieParser());
//配置body-Parser
app.use(bodyParser.urlencoded({extended:true}));

//配置模板引擎
app.engine("html",swig.renderFile);   //后缀名    处理模板引擎渲染的方法
//设置模板引擎所放的目录
app.set("views","./view")   //不可改变   目录
//注册所使用的模板引擎
app.set("view engine","html");    //不可改变    为app.engine这个方法所定义的东西

//静态资源托管
app.use("/public",express.static(__dirname+"/public"));

app.use(session({
    secret:"keyboard cat",  //私密id，一个session
    resave:true,
    saveUninitialized:true,
    cookie:{secure:false},    //https协议 https比http更加安全
    cookie:{maxAge:1000*6000}
}));
var pool=mysql.createPool({    //数据连接池
    host:"127.0.0.1",
    port:3306,
    database:"blog",
    user:"root",
    password:"aaaa"
});

//定义路由的路径
app.use("/admin",require("./routers/admin"));
app.use("/api",require("./routers/api"));
app.use("/",require("./routers/main"));

//访问静态资源
/*app.get("/*",function (req,res) {
    res.sendFile(__dirname+req.url);
});*/
/* 法二： app.use(express.static("../public"));*/

app.listen(8070,"127.0.0.1",function(err){
    if(err){
        console.log(err);
    }else{
        console.log("服务器启动成功");
    }

})