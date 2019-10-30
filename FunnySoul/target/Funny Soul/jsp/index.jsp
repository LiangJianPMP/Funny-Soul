<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/17
  Time: 8:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/search.css">
</head>
<body>
    <div id="navigation">
        <div class="layui-row width_margin">
            <div class="layui-col-md2">
                <img src="${pageContext.request.contextPath}/resource/image/logo.jpg"/>
            </div>
            <div class="layui-col-md1 navigation_size by_color">
                <a href="#">首页</a>
            </div>
            <div class="layui-col-md1 navigation_size by_color">
                <a href="#">发帖子</a>
            </div>
            <div class="layui-col-md6">
                <div class="search" id="navigation_search">
                    <span class="s_con"><input type="text" class="content" placeholder="请输入搜索内容"><i
                            class="clear"></i></span>
                    <span class="s_btn"><i class="layui-icon">&#xe615;</i> 搜索</span>
                </div>
            </div>
            <div class="layui-col-md1 navigation_size">
                <a href="#">登录</a> | <a href="#">注册</a>
            </div>
            <div class="layui-col-md1 navigation_size show_user_settin">
                <a href="#">个人账户<i class="layui-icon" id="iocn"> &#xe61a;</i></a>
                <div id="user_settin">
                    <ul>
                        <li><a href="#"><i class="layui-icon">&#xe65c;</i> 注销</a></li>
                        <li><a href="#"><i class="layui-icon">&#xe673;</i> 修改密码</a></li>
                        <li><a href="#"><i class="layui-icon">&#xe607;</i> 帮助</a></li>
                        <li><a href="#"><i class="layui-icon">&#xe60b;</i> 关于我们</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="width_margin">123132</div>

    <script src="${pageContext.request.contextPath}/resource/js/jquery-3.1.1.min.js" type="text/javascript" ></script>
    <script src="${pageContext.request.contextPath}/resource/layui/layui.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resource/js/index.js"></script>

</body>
</html>
