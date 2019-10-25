<%--
Created by IntelliJ IDEA.
User: ASUS
Date: 2019/10/17
Time: 8:38
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>帖子详细</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/layui/css/layui.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/search.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/lk/postdetailed.css" />
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
					<div class="search" id="navigation_search">
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
			<div class="layui-row show_postdetailed">
				<div class="layui-row">
					<div class="layui-col-md1" id="show_user_head" align="center"><img src="${post.fsUser.avatarPath}"></div>
					<div class="layui-col-md11">
						<input type="hidden" value="${post.id}" id="postId">
						<h2>${post.fsUser.userName}</h2>
						<p><fmt:formatDate value="${post.transmissionTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </p>
					</div>
				</div>
				<div class="layui-row">
					<p>${post.details}</p>
				</div>
				<div class="layui-row">
					<c:if test="${post.postTypeId==2}">
						<video src="${post.videoPath}" controls="controls" width="100%"></video>
					</c:if>
					<c:if test="${post.postTypeId==3}">
						<img src="${post.picturePath}" width="100%">
					</c:if>
					<!-- <img src="#" /> -->
				</div>
				<div class="layui-row">
					<div class="layui-row">
						<div class="layui-col-md2"><a class="post_operation_button"><i class="layui-icon">&#xe756;</i> <span>${post.heat}</span></a></div>
						<div class="layui-col-md2"><a class="post_operation_button" <c:if test="${praise!=0}">style="color: red;"</c:if> id="post_pcount_button"><i class="layui-icon">&#xe6c6;</i> <span>${post.pcount}</span></a></div>
						<div class="layui-col-md2"><a class="post_operation_button"><i class="layui-icon">&#xe611;</i> <span>${post.comment}</span></a></div>
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-md10"><input type="text" class="text_comment" id="text_comment" placeholder="请输入"></div>
					<div class="layui-col-md2"><button type="button" id="but_comment" class="layui-btn layui-btn-primary but_comment"><i class="layui-icon">&#xe609;</i>
							评论</button></div>
				</div>
				<div class="layui-row" id="comment">
					<div class="layui-col-md2">
						<h2>全部评论</h2>
					</div>
					<div style="padding-top: 8px;">
						<p>共有${post.comment}条评论</p>
					</div>
				</div>
				<div class="layui-row">
                    <c:if test="${comments=='[]'}"><h1 align="center">暂时没有评论，等待你的神评！</h1></c:if>
                    <c:forEach var="comment" items="${comments}">
                        <div class="layui-row comment_user">
                            <div class="layui-row">
                                <div class="layui-col-md1 show_comment_user_head" align="center"><img src="${comment.fsUser.avatarPath}"></div>
                                <div class="layui-col-md11">
                                    <h3>${comment.fsUser.userName}</h3>
                                </div>
                            </div>
                            <div class="layui-row comment_user_details">
                                <p>${comment.details}</p>
                            </div>
                        </div>
                    </c:forEach>
				</div>
				<div class="layui-row">
					<div id="demo1"></div>
				</div>
			</div>
		</div>

		<script src="${pageContext.request.contextPath}/resource/js/jquery-3.1.1.min.js" type="text/javascript"></script>
		<script>
			//评论
			$("#but_comment").click(function () {
				var postId = $("#postId").val();
				var details = $("#text_comment").val();
				if (details!=null && comment!=''){
					$.ajax({
						'url':'${pageContext.request.contextPath}/sys/lk/addComment.html',
						'type':'post',
						'data':'details='+details+'&postId='+postId,
						'dataType':'html',
						'success':function (res) {
							if (res == 'true'){
								alert('评论成功！');
							}
						},
						'error':function () {
							alert('有异常');
						}
					})
				}else {
					alert('请先输入您需要评论的信息！');
				}
			});

			//点赞
			$("#post_pcount_button").click(function () {
				if ($(this).css('color') == 'rgb(119, 119, 119)'){
					var postId = $("#postId").val();
					$.ajax({
						'url':'${pageContext.request.contextPath}/sys/lk/pcount.html',
						'type':'post',
						'data':'postId='+postId,
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
					$(this).children('span').text(pcount);
				}
			})
		</script>
		<script src="${pageContext.request.contextPath}/resource/js/index.js"></script>
		<script src="${pageContext.request.contextPath}/resource/layui/layui.js" type="text/javascript"></script>
		<script>
			layui.use(['laypage', 'layer', 'jquery'], function() {
				var laypage = layui.laypage,
					layer = layui.layer,
					$ = layer.jquery;

				//总页数大于页码总数
				laypage.render({
					elem: 'demo1',
					count: 70 //数据总数
						,
					jump: function(obj,first) {

					}
				});

			})
		</script>


	</body>
</html>
