<%--
  Created by IntelliJ IDEA.
  User: 29007
  Date: 2019/9/21
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/resource/layui/layui.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/resource/jquery-3.1.1.min.js"></script>
    <script src="https://ssl.captcha.qq.com/TCaptcha.js"></script>
    <script>
        var div_width = 106//div宽度;
        var authcode;//验证码
        $(function () {
            $("#dynamicemail").on("input  propertychange", function () {
                var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
                console.log($(this).val());
                if (reg.test($(this).val())) {

                    $('#TencentCaptcha').removeClass("layui-btn-disabled")
                    $('#TencentCaptcha').removeAttr('disabled')
                } else {
                    $('#TencentCaptcha').addClass("layui-btn-disabled")
                    $('#TencentCaptcha').attr({ 'disabled': 'disabled' })
                }
            });

        })
        //验证用户是否存在
        function verification(){
            $.ajax({
                url : '${pageContext.request.contextPath}/AuthenticationRequest/get_authcode',
                type : 'post',
                data : {'email':$("#dynamicemail").val()},
                dataType : 'json',
                success : function(result) {
                    authcode=result;
                    if (authcode=="USERNULL") {
                        layer.msg("该账号还未注册")
                        authcode=null;
                    }
                },
                erorr : function() {
                    console.log("有异常！");
                }
            })
        }

        window.callback = function (res) {
            console.log(res)
            // res（未通过验证）= {ret: 1, ticket: null}
            // res（验证成功） = {ret: 0, ticket: "String", randstr: "String"}
            if (res.ret === 0) {
                verification();
                // alert(res.ticket)   // 票据
                layer.msg('验证码已发送')
                var id = 120;//等待时间
                interval = window.setInterval(function () {
                    console.log(id)
                    $('#TencentCaptcha').text(id)
                    $('#TencentCaptcha').addClass("layui-btn-disabled")
                    $('#TencentCaptcha').attr({ 'disabled': 'disabled' })
                    $('#TencentCaptcha').css({ 'width': div_width })
                    id -= 1;
                    if (id < 0) {
                        $('#TencentCaptcha').text("获取验证码")
                        $('#TencentCaptcha').removeClass("layui-btn-disabled")
                        $('#TencentCaptcha').removeAttr('disabled')
                        $('#TencentCaptcha').css({ 'width': div_width })
                        clearInterval(interval);
                    }
                }, 1000)
            }
        }
        var swibool = true;//判断当前是什么状态
        layui.use('form', function () {
            var form=layui.form;
            form.verify({
                isCode:function (value) {
                    if(value!=authcode){
                        return "验证码错误"
                    }
                }

            })
            console.log("方法进入")
        })

        function swipass(s) {
            var s = $(s);

            if (s.text() == '密码登录') {
                console.log("方法进入" + s.text())
                s.css({ 'border-bottom': '1px solid rgb(0, 0, 0)' })
                s.next().css({ 'border-bottom': '' })
                $('#div-1').css({ 'z-index': '2' });
                $('#div-2').css({ 'z-index': '1' });

            } else {
                s.css({ 'border-bottom': '1px solid rgb(0, 0, 0)' })
                s.prev().css({ 'border-bottom': '' })
                $('#div-1').css({ 'z-index': '1' });
                $('#div-2').css({ 'z-index': '2' });

            }
        }


    </script>
    <style>
        .title-span {
            font-size: 16px;
            color: green;
            padding-left: 38px;
            display: inline-block;
            height: 55px;
            width: 105px;
            line-height: 55px;

        }

        #title {
            margin-left: 5px;
        }

        .title-span:hover {
            cursor: pointer;
            border-bottom: 1px solid rgb(0, 0, 0);
        }

        #overall-div {
            /* width: 100%; */
            margin: 0 auto;
            width: 300px;
            margin-top: 50px;
        }

        #div-1,
        #div-2 {
            height: 300px;
            width: 300px;
            /* border: 1px solid red; */
            position: absolute;
            background-color: rgb(255, 255, 255);
            /* left: 20px; */
        }

        #div-1 {
            z-index: 5;
        }



        #div-list {
            width: 300px;
            margin: 0 auto;
        }
    </style>
    <title>用户登录</title>
</head>
<body>
<div id="overall-div">
    <div id="title">
        <span class="title-span" onclick="swipass(this)">密码登录</span>
        <span class="title-span" onclick="swipass(this)">短信登录</span>
    </div>
    <div id="div-list">
        <!-- 模块1 -->

        <div id="div-1">
                <form class="layui-form" action="${pageContext.request.contextPath}/AuthenticationRequest/Login" method="post">
                <div class="layui-form-item">

                    <div class="layui-inline">

                        <div class="layui-input-inline" style="width: 300px;">
                            <input type="text" name="email" lay-verify="email" autocomplete="off" placeholder="请输入邮箱"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">

                    <div class="layui-inline">

                        <div class="layui-input-inline" style="width: 300px;">
                            <input type="password" name="userPassword" lay-verify="password|required" autocomplete="off" placeholder="请输入密码"
                                   class="layui-input">
                        </div>
                    </div>
                </div>

                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1" style="width: 300px;">登录</button>

                <a>忘记密码</a> |
                <a>注册</a>
                </form>
        </div>


    <div id="div-2">
        <!-- 模块2 -->
        <form class="layui-form" action="${pageContext.request.contextPath}/AuthenticationRequest/Logins" method="post">
            <div class="layui-form-item">

                <div class="layui-inline">

                    <div class="layui-input-inline" style="width: 300px;">
                        <input type="text" name="email" lay-verify="email" id="dynamicemail" autocomplete="off"
                               placeholder="请输入邮箱" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">

                <div class="layui-inline">

                    <div class="layui-input-inline" style="width: 170px;">
                        <input type="text" name="password" lay-verify="required|isCode" autocomplete="off" placeholder="请输入验证码"
                               class="layui-input">
                    </div>
                </div>

                <button type="button" style="width:106px" class="layui-btn layui-btn-disabled"  id="TencentCaptcha" data-appid="2068666293" data-cbfn="callback" disabled>获取验证码</button>
            </div>

            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1" style="width: 300px;">登录</button>
            <a>忘记密码</a> |
            <a>注册</a>
        </form>
    </div>

</div>
</div>
</body>
</html>
