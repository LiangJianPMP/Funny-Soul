<%--
  Created by IntelliJ IDEA.
  User: 29007
  Date: 2019/10/17
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/resource/layui/layui.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/resource/jquery-3.1.1.min.js"></script>
    <script src="https://ssl.captcha.qq.com/TCaptcha.js"></script>
    <title>用户注册</title>
    <script>
        var authcode;//用户注册验证码
        var authuser=false;//验证用户名是否存在
        layui.use(['form', 'layedit', 'laydate'], function () {
            var form = layui.form;
            var laydate=layui.laydate;
            laydate.render({
                elem: '#date'
            });
            form.verify({
                isCode:function (value) {
                    if(value!=authcode){
                        return "验证码错误";
                    }
                },
                isCodeUser:function (value) {
                    if(authuser){
                        return "该用户名已存在";
                    }
                },
                Secondarypassword:function (value) {
                    if(value!=$("#userPassword")){
                        return "二次密码不正确"
                    }
                }
            })
        })

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
            })

            $("#username").on("input  propertychange", function () {
                var usercode=$(this).val();
                verificationUserCode(usercode);
            })
        })

        //验证用户是否存在
        function verificationUserCode(code){
            $.ajax({
                url : '${pageContext.request.contextPath}/AuthenticationRequest/get_Usercode',
                type : 'post',
                data : {'userCode':code},
                dataType : 'json',
                success : function(result) {
                    if (result==1) {
                        console.log("该用户已存在")
                        authuser=true;
                    }else {
                        console.log("用户不存在")
                        authuser=false;
                    }
                },
                erorr : function() {
                    console.log("有异常！");
                }
            })
        }
        //验证邮箱是否存在
        function verification(){
            $.ajax({
                url : '${pageContext.request.contextPath}/AuthenticationRequest/get_code',
                type : 'post',
                data : {'email':$("#dynamicemail").val()},
                dataType : 'json',
                success : function(result) {
                    authcode=result;
                    if (authcode=="USERNULL") {
                        layer.confirm('该邮箱已经注册，是否前去登录？', {
                            btn: ['确定','取消'] //按钮
                        }, function(){
                            window.location.href="${pageContext.request.contextPath}/jsp/lkl/Login.jsp"
                        });
                        authcode=null;
                    }
                },
                erorr : function() {
                    console.log("有异常！");
                }
            })
        }


        //验证码特效
        window.callback = function (res) {
            console.log(res)
            // res（未通过验证）= {ret: 1, ticket: null}
            // res（验证成功） = {ret: 0, ticket: "String", randstr: "String"}
            if (res.ret === 0) {
                verification();
                // alert(res.ticket)   // 票据
                layer.msg('验证码已发送')
                var id = 120;
                interval = window.setInterval(function () {
                    console.log(id)
                    $('#TencentCaptcha').text(id+"重试")
                    $('#TencentCaptcha').addClass("layui-btn-disabled")
                    $('#TencentCaptcha').attr({ 'disabled': 'disabled' })

                    id -= 1;
                    if (id < 0) {
                        $('#TencentCaptcha').text("获取验证码")
                        $('#TencentCaptcha').removeClass("layui-btn-disabled")
                        $('#TencentCaptcha').removeAttr('disabled')

                        clearInterval(interval);
                    }
                }, 1000)
            }
        }
    </script>
    <style>
        #overall-div {
            width: 500px;
            margin-left: 20%;

            height: 400px;
            margin-top: 30px;
            float: left;

        }

        #title-div {
            font-family: Georgia, 'Times New Roman', Times, serif;
            font-size: 26px;
            color: green;
            width: 190px;
            margin-left: 20%;
            height: 100px;
            line-height: 100px;
        }

        form {
            width: 100%;

        }

        #div-buttom {
            height: 500px;
            width: 100%;
            background-color: #F5F5F5;
            border: 1px solid rgb(49, 49, 49);
        }

        #div-style {
            float: left;

            margin-top: 30px;
            height: 60px;
            margin-left: 300px;
            color: seagreen;
        }

        #div-top {
            height: 100px;

        }

        #over-div p{
            text-align: center;
        }
        #over-div{
            width: 100%;
        }
    </style>
    <title>Document</title>
</head>

<body>
<div id="div-top">

    <div id="title-div">
        Funny Soul 注册
    </div>
</div>

<div id="div-buttom">

    <div id="overall-div">
        <h2 style="line-height: 60px;">快速注册</h2>
        <form class="layui-form" action="${pageContext.request.contextPath}/AuthenticationRequest/register" method="post">
            <div class="layui-form-item">
                <div class="layui-inline" style="width: 100%;">
                    <label class="layui-form-label" style="width: 120px;">用户名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="userName" style="width:260px" id="username" lay-verify="required|isCodeUser"
                               autocomplete="off" placeholder="请输入用户名" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline" style="width: 100%;">
                    <label class="layui-form-label" style="width: 120px;">邮箱</label>
                    <div class="layui-input-inline">
                        <input type="text" name="email" style="width:260px" id="dynamicemail" lay-verify="email"
                               autocomplete="off" placeholder="请输入邮箱" class="layui-input">
                    </div>
                </div>
            </div>

            <div class="layui-form-item" >

                <div class="layui-inline" style="width: 100%;">
                    <label class="layui-form-label" style="width: 120px;">验证码</label>
                    <div class="layui-input-inline" style="width: 142px;">
                        <input type="text" name="password" lay-verify="required|isCode" autocomplete="off"
                               placeholder="请输入验证码" class="layui-input">
                    </div>

                    <button type="button" style="width:106px" class="layui-btn layui-btn-disabled"
                            id="TencentCaptcha" data-appid="2068666293" data-cbfn="callback" disabled>获取验证码</button>
                </div>

            </div>

            <div class="layui-form-item">
                <div class="layui-inline" style="width: 100%;">
                    <label class="layui-form-label" style="width: 120px;">请输入密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="userPassword" style="width:260px" lay-verify="required|password"
                               placeholder="请输入密码" id="userPassword" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label" style="width: 120px;">二次输入密码</label>
                    <div class="layui-input-inline">
                        <input type="password" style="width:260px" lay-verify="required|password|Secondarypassword"
                               placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label" style="width: 120px;">出生日期</label>
                    <div class="layui-input-inline">
                        <input type="text" name="bornth" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                    </div>
                </div>

            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="width: 120px;"></label>
                <div class="layui-input-block">
                    <button type="submit" class="layui-btn layui-btn-primary" style="width: 260px;" lay-submit=""
                            lay-filter="demo1">注册</button>
                </div>
            </div>

        </form>
    </div>

    <div id="div-style">
        已有账号？立即登录
        <button type="button" class="layui-btn layui-btn-primary" lay-filter="demo1">点击登录</button>

    </div>
</div>

<div id="over-div">
    <p class="link"><a href="http://www.guanfang123.com/website/" target="_blank">网站大全</a> |
        <a href="http://www.guanfang123.com/product/" target="_blank">产品信息</a> |
        <a href="http://www.guanfang123.com/foot/wzdt.html" target="_blank" rel="nofollow">网站地图</a> |
        <a href="http://www.guanfang123.com/foot/lxwm.html" target="_blank" rel="nofollow">联系我们</a> |
        <a href="http://www.guanfang123.com/foot/mzsm.html" target="_blank" rel="nofollow">免责声明</a>
    </p>
    <p>官方网 版权所有 免责声明:站内会员言论仅代表个人观点,并不代表本站同意其说法或描述,本站不承担由此引起的法律责任 ©2011-2013</p>

</div>
</body>
</html>
