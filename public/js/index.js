$(function () {
    var $loginBox=$("#loginBox");
    var $resBox=$("#registerBox");
    var $userBox=$("#userInfo");  //<script src="../../public/js/md5.js"></script>
       // <script src="../../public/js/demo.js"></script>

    $loginBox.find("a.colMint").on("click",function () {
        $loginBox.hide();
        $resBox.show();
    });

    $resBox.find("a.colMint").on("click",function () {
        $resBox.hide();
        $loginBox.show();
    });

    $resBox.find("button").on("click",function () {
                                //属性列表
        var uname=$resBox.find("[name='username']").val();
        var pwd=$resBox.find("[name='password']").val();
        var repwd=$resBox.find("[name='repassword']").val();

        if(uname==""||uname==null||pwd==""||pwd==null||repwd==""||repwd==null){
            alert("用户名或密码不能为空");
            return;
        }
        if(pwd!==repwd){
            alert("两次密码不一致，请再一次输入");
            return;
        }
       // console.log(uname);
        $.ajax({
            type:"post",
            url:"/api/user/register",
            data:{
                uname:uname,
                pwd:pwd
            },
            dataType:"json",
            success:function (data) {
                console.log(data);
                if(data.code!=2){
                    alert(data.msg);
                }else{
                    //注册成功
                    setTimeout(function () {
                        $resBox.find("[name='username']").val("");
                        $resBox.find("[name='password']").val("");
                        $resBox.find("[name='repassword']").val("");
                        $resBox.hide();
                        $loginBox.show();
                    },2000);
                }
            }
        });
    });

    //登录
    $loginBox.find("button").on('click',function () {
        var uname=$loginBox.find('[name="username"]').val();
        var pwd=$loginBox.find('[name="password"]').val();
        if(uname==""||uname==null||pwd==""||pwd==null){
            alert("用户名或密码不能为空");
            return;
        }
        //通过ajax提交请求
        $.ajax({
            type:"post",
            url:"/api/user/login",
            data:{
                uname:uname,
                pwd:pwd
            },
            dataType:"json",
            success:function (result) {
                $loginBox.find('.colWarning').html(result.msg);
                //console.log(result.code);
                // if(result.code==2){
                //     //登录成功
                //     $loginBox.hide();
                //     $userBox.show();
                //     //判断管理员还是用户
                //     if(result.info.isAdmin==0){
                //         //普通用户
                //         $userBox.find("p.userName span").html(result.info.uname);
                //         $userBox.find("p.adminInfo").hide();
                //     }else if(result.info.isAdmin==1){
                //         //管理员
                //         $userBox.find("p.userName span").html(result.info.uname);
                //         $userBox.find("p.adminInfo").show();
                //     }
                // }
                window.location.reload();
            }


        });
    });

 //第二种登录
   /* var loginbut=document.getElementById("butlo");
    loginbut.onkeydown=function (event) {
        var e=event?event:window.event;
        var keycode=e.keyCode;
        if(keycode==13){
            var uname=$loginBox.find('[name="username"]').val();
            var pwd=$loginBox.find('[name="password"]').val();
            if(uname==""||uname==null||pwd==""||pwd==null){
                alert("用户名或密码不能为空");
                return;
            }
            //通过ajax提交请求
            $.ajax({
                type:"post",
                url:"/api/user/login",
                data:{
                    uname:uname,
                    pwd:pwd
                },
                dataType:"json",
                success:function (relt) {
                    $loginBox.find('.colWarning').html(relt.msg);
                    window.location.reload();
                }


            });
        }
    }*/

    //存session  swig


    //退出登录
    $("#logout").on("click",function(){
        $.ajax({

            url:"/api/user/logout",
            success:function (result) {
                if(!result.code){
                    // $loginBox.show();
                    // $userBox.hide();
                    // $loginBox.find("[name='username']").val("");
                    // $loginBox.find("[name='password']").val("");
                    // $loginBox.find(".colWarning").html("");
                    window.location.reload();
                }
            }
        });
    });


    $("#logout2").on("click",function(){
        $.ajax({
            url:"/api/user/logout2",
            success:function (resu) {
                if(!resu.code){
                    location.href="/";
                }
            }
        });
    });


});

