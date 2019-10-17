<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/17
  Time: 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/layui/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/search.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/lk/home.css">
</head>
<body>
    <div id="navigation">
        <div class="layui-row width_margin">
            <div class="layui-col-md2">
                <img src="${pageContext.request.contextPath}/resource/image/logo.png" />
            </div>
            <div class="layui-col-md1 navigation_size by_color">
                <a href="#">首页</a>
            </div>
            <div class="layui-col-md1 navigation_size by_color">
                <a href="#">发帖子</a>
            </div>
            <div class="layui-col-md6">
                <div class="search"  id="navigation_search">
                    <span class="s_con"><input type="text" class="content" placeholder="请输入搜索内容"><i class="clear"></i></span>
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
                        <li><a href="#">注销</a></li>
                        <li><a href="#">修改密码</a></li>
                        <li><a href="#">帮助</a></li>
                        <li><a href="#">关于我们</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="width_margin">
        <!-- <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
              <legend>信息流 - 滚动加载</legend>
            </fieldset>

            <ul class="flow-default" id="LAY_demo1"></ul> -->
        <!-- <p><label for="wheelDelta">  滚动值:</label>(IE/Opera)<input type="text" id="wheelDelta" /></p>
         <p><label for="detail"> 滚动值:(Firefox)</label><input type="text" id="detail" /></p> -->
        <!-- <button onclick="load()">点我</button> -->
        <!-- <div></div> -->
        <ul id="cartoon-ul" onclick="loads()">
            <li class="cartoon-li">
                <div class="leift" onclick="load()">
                    <div class="leift_div">

                    </div>
                </div>
                <div class="rigth">
                </div>
            </li>
            <li class="cartoon-li" style="padding-top:20px">
                <div class="leift">
                    <div class="leift_div"></div>
                </div>
                <div class="rigth">
                </div>
            </li>
            <li class="cartoon-li" style="padding-top:20px">
                <div class="leift">
                    <div class="leift_div"></div>
                </div>
                <div class="rigth" style="height: 800px;">
                </div>
            </li>
            <li class="cartoon-li" style="padding-top:20px">
                <div class="leift">
                    <div class="leift_div"></div>
                </div>
                <div class="rigth">
                </div>
            </li>
            <li class="cartoon-li" style="padding-top:20px">
                <div class="leift">
                    <div class="leift_div"></div>
                </div>
                <div class="rigth" style="height: 800px;">
                </div>
            </li>
            <li class="cartoon-li" style="padding-top:20px">
                <div class="leift">
                    <div class="leift_div"></div>
                </div>
                <div class="rigth">
                </div>
            </li>
            <li class="cartoon-li" style="padding-top:20px">
                <div class="leift">
                    <div class="leift_div"></div>
                </div>
                <div class="rigth">
                </div>
            </li>
            <li class="cartoon-li" style="padding-top:20px">
                <div class="leift">
                    <div class="leift_div"></div>
                </div>
                <div class="rigth">
                </div>
            </li>
        </ul>
    </div>

    <script src="${pageContext.request.contextPath}/resource/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/lk/home.js"></script>

    <script src="${pageContext.request.contextPath}/resource/layui/layui.js"></script>
    <!-- <script type="text/javascript">
      var oTxt=document.getElementById("txt");

    var scrollFunc=function(e){
        var direct=0;
        e=e || window.event;

       var t1=document.getElementById("wheelDelta");
        var t2=document.getElementById("detail");
        if(e.wheelDelta){//IE/Opera/Chrome
            t1.value=e.wheelDelta;
        }else if(e.detail){//Firefox
           t2.value=e.detail;
        }
        ScrollText(direct);
        console.log(ScrollText(direct))
    }
    /*注册事件*/
    if(document.addEventListener){
        document.addEventListener('DOMMouseScroll',scrollFunc,false);
    }//W3C
    window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome/Safari
    </script> -->
</body>
</html>
