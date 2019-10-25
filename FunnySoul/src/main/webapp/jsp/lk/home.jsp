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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/search.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/lk/home.css">
</head>
<body>
<div id="navigation">
    <div class="layui-row width_margin">
        <div class="layui-col-md2">
            <img src="${pageContext.request.contextPath}/resource/image/logo.jpg" />
        </div>
        <div class="layui-col-md1 navigation_size by_color">
            <a href="${pageContext.request.contextPath}/sys/lk/home.html">首页</a>
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
                    <li><a href="#"><i class="layui-icon">&#xe65c;</i> 注销</a></li>
                    <li><a href="#"><i class="layui-icon">&#xe673;</i> 修改密码</a></li>
                    <li><a href="#"><i class="layui-icon">&#xe607;</i> 帮助</a></li>
                    <li><a href="#"><i class="layui-icon">&#xe60b;</i> 关于我们</a></li>
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
    <ul id="cartoon-ul" class="flow-default"></ul>
</div>

<script src="${pageContext.request.contextPath}/resource/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/index.js" type="text/javascript"></script>

<script src="${pageContext.request.contextPath}/resource/layui/layui.js"></script>
<script type="text/javascript">
    layui.use('flow', function(){
        var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
        var flow = layui.flow;

        var likes;
        $.ajax({
            'url':'${pageContext.request.contextPath}/sys/lk/showLike.json',
            'type':'post',
            'data':null,
            'dataType':'json',
            'success':function (result) {
                likes=result;
            },
            'error':function () {
                alert('有异常')
            }
        });

        flow.load({
            elem: '#cartoon-ul' //指定列表容器
            ,isAuto: true
            ,done: function(page, next){ //到达临界点（默认滚动触发），触发下一页

                //模拟数据插入
                setTimeout(function(){
                    var lis = [];
                    //以jQuery的Ajax请求为例，请求下一页数据
                    $.ajax({
                        url:'${pageContext.request.contextPath}/sys/lk/showHome.json/'+page,
                        method:'get',
                        data:null,
                        dataType:'JSON',
                        success:function(res){
                            //假设你的列表返回在data集合中
                            layui.each(res.data, function(index, item){
                                var s = '';
                                var x = '';
                                var str = '';
                                if (item.postTypeId==2) {
                                    s='<div><video controls="controls" preload="preload" src="'+item.videoPath+'"></video></div>';
                                } else if (item.postTypeId==3) {
                                    s='<div><img src="'+item.picturePath+'"></div>';
                                }

                                for (var i = 0;i < likes.length;i++){
                                    if (item.id==likes[i]){
                                        x = '<a class="pcount_button" style="color: red;"><i class="layui-icon">&#xe6c6;</i> <span>'+item.pcount+'</span></a>';
                                        break;
                                    }else{
                                        x = '<a class="pcount_button"><i class="layui-icon">&#xe6c6;</i> <span>'+item.pcount+'</span></a>';
                                    }
                                }

                                str = '<li class="cartoon-li" style="padding-top:20px">' +
                                    '                <div class="leift">' +
                                    '                    <div class="leift_div"><a href="${pageContext.request.contextPath}/sys/lk/userdetailed.html/'+item.fsUser.id+'"><img src="'+item.fsUser.avatarPath+'"></a></div>' +
                                    '                </div>' +
                                    '                <div class="rigth">' +
                                    '                   <h2>'+item.fsUser.userName+'</h2>' +
                                    '                   <div style="padding: 20px 0px;"><a href="${pageContext.request.contextPath}/sys/lk/postdetailed.html/'+item.id+'">'+item.details+'</a></div>' +
                                    s +
                                    '                   <div class="layui-row post_operation">' +
                                    '                        <input type="hidden" value="'+item.id+'">' +
                                    '                        <div class="layui-col-md2"><a><i class="layui-icon">&#xe756;</i> '+item.heat+'</a></div>' +
                                    '                        <div class="layui-col-md2">' + x + '</div>' +
                                    '                        <div class="layui-col-md2"><a class="comment_button"><i class="layui-icon">&#xe611;</i> <span>'+item.comment+'</span></a></div>' +
                                    '                   </div>' +
                                    '                   <div class="comment"></div>' +
                                    '             </li>';
                                lis.push(str);


                            });
                            //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                            //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                            next(lis.join(''), page < res.pages);
                        },
                        error:function (data) {
                            alert('有异常！');
                        }
                    });
                }, 0);

            }
        });

        //按屏加载图片
        flow.lazyimg({
            elem: '.rigth img'
        });


        //点赞
        $(document).on('click',".pcount_button",function(){
            var id = $(this).parent().prev().prev().val();
            if ($(this).css('color') == 'rgb(119, 119, 119)'){
                $.ajax({
                    'url':'${pageContext.request.contextPath}/sys/lk/pcount.html',
                    'type':'post',
                    'data':'postId='+id,
                    'dataType':'html',
                    'success':function (result) {
                        if (result=='true'){
                            alert('点赞成功！');
                        }else{
                            alert('您已经点赞过了！');
                        }
                    },
                    'error':function () {
                        alert('有异常')
                    }
                });
                $(this).css('color','#ff0000');
                var pcount = parseInt($(this).children('span').text())+1;
                $(this).html('<i class="layui-icon">&#xe6c6;</i> <span>'+pcount+"</span>");
            }
        });

    });
</script>
</body>
</html>