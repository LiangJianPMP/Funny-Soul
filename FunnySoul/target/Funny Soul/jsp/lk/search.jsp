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
		<title>搜索</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/layui/css/layui.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/search.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/lk/search.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/lk/userdetailed.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/lk/about.css">
		<style>
			.user_post{
				box-shadow: 0 0 20px rgba(0,0,0,.0);
				border-bottom: #F2F2F2 3px solid;
			}
		</style>
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
						<span class="s_con"><input type="text" id="keywords" value="${keywords}" class="content" placeholder="请输入搜索内容"><i class="clear"></i></span>
						<span class="s_btn" id="search"><i class="layui-icon">&#xe615;</i> 搜索</span>
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
							<li><a href="#" id="abouts"><i class="layui-icon">&#xe60b;</i> 关于我们</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="width_margin">
			<div id="show_user_post">
				<div class="layui-tab layui-tab-card">
				  <ul class="layui-tab-title">
					<li class="layui-this">帖子</li>
					<li>用户</li>
				  </ul>
				  <div class="layui-tab-content">
					<div class="layui-tab-item layui-show">
						<div id="show_post"></div>
						<div class="layui-row">
							<div id="demo2"></div>
						</div>
					</div>
					<div class="layui-tab-item">
						<div id="show_user"></div>
						<div class="layui-row">
							<div id="demo1"></div>
						</div>
					</div>
				  </div>
				</div>
			</div>
		</div>

		<input type="hidden" value="${userCount}" id="userCount">
		<input type="hidden" value="${postsCount}" id="postsCount">

		<div id="about">
			<div class="layui-row">
				<div id="exit" align="right"><i class="layui-icon" id="exitI">&#x1006;</i></div>
				<div id="logo_funnySoul"><img src="${pageContext.request.contextPath}/resource/image/logo.jpg"></div>
				<div id="show_funnySoul">
					<h1 align="center">${about.softwareName} ${about.softwareVersion}</h1>
				</div>
				<div id="show_url">
					<p align="center">${about.contactEmail}</p>
				</div>
				<div id="show_agreement" align="center">
					<a>&lt;&lt;用户协议&gt;&gt;</a>
					<a>&lt;&lt;隐私政策&gt;&gt;</a>
				</div>
				<div id="show_news">
					<p align="center">&copy; ${about.companyName} ${about.companyIntroduction} ${about.contactNumber}</p>
				</div>
			</div>
		</div>

		<script src="${pageContext.request.contextPath}/resource/js/jquery-3.1.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/js/index.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resource/layui/layui.js" type="text/javascript"></script>
		<script>

			var likes;
			$(function () {
				$.ajax({
					'url':'${pageContext.request.contextPath}/sys/lk/showLike.json',
					'type':'post',
					'data':null,
					'dataType':'json',
					'success':function (result) {
						likes=result;
					},
					'error':function () {
						alert('有异常');
					}
				});

			});

			//搜索
			$('#search').click(function () {
				var keywords = $('#keywords').val();
				if (keywords!=null && keywords!='') {
					location.href='${pageContext.request.contextPath}/sys/lk/search.html?keywords='+keywords;
				}
			});

			function pages1(curr){
				$.ajax({
					url: '${pageContext.request.contextPath}/sys/lk/searchPost.json',
					type: 'post',
					data: 'keywords='+$('#keywords').val()+'&page='+curr,
					dataType: 'json',
					success: function (res) {
						var str = '';
						$(res).each(function () {
							var postTypeIdStr = '';
							if (this.postTypeId==2) {
								postTypeIdStr = '<video src="${pageContext.request.contextPath}'+this.videoPath+'" controls="controls" width="100%"></video>';
							}else if (this.postTypeId==3){
								postTypeIdStr = '<img width="100%" src="${pageContext.request.contextPath}'+this.picturePath+'">';
							}

							var praiseStr = '<div class="layui-col-md2"><a class="post_operation_button post_pcount_button"><i class="layui-icon">&#xe6c6;</i> <span>'+this.pcount+'</span></a></div>';
							for (var i = 0;i < likes.length;i++){
								if (this.id==likes[i]){
									praiseStr = '<div class="layui-col-md2"><a class="post_operation_button post_pcount_button" style="color: red;"><i class="layui-icon">&#xe6c6;</i> <span>'+this.pcount+'</span></a></div>';
									break;
								}
							}

							str += '<div class="layui-row user_post">' +
									'      <div class="layui-row">' +
									'       <div class="layui-col-md2 show_user_head" align="center"><a href="${pageContext.request.contextPath}/sys/lk/userdetailed.html/'+this.fsUser.id+'"> <img src="${pageContext.request.contextPath}'+this.fsUser.avatarPath+'"/> </a></div>' +
									'       <div class="layui-col-md10">' +
									'        <h2><a href="${pageContext.request.contextPath}/sys/lk/userdetailed.html/'+this.fsUser.id+'">'+this.fsUser.userName+'</a></h2>' +
									'        <p>'+this.transmissionTime+'</p>' +
									'       </div>' +
									'      </div>' +
									'      <div class="layui-row">' +
									'       <p><a href="${pageContext.request.contextPath}/sys/lk/postdetailed.html/'+this.id+'">'+this.details+'</a></p>' +
									'      </div>' +
									'      <div class="layui-row">' +
									postTypeIdStr +
									'      </div>' +
									'      <div class="layui-row">' +
									'       <div class="layui-row">' +
									'        <input type="hidden" value="'+this.id+'">' +
									'        <div class="layui-col-md2"><a class="post_operation_button"><i class="layui-icon">&#xe756;</i> <span>'+this.heat+'</span></a></div>' +
									praiseStr +
									'        <div class="layui-col-md2"><a class="post_operation_button"><i class="layui-icon">&#xe611;</i> <span>'+this.comment+'</span></a></div>' +
									'       </div>' +
									'      </div>' +
									'     </div>';
						})
						if (str != ''){
							$('#show_post').html(str);
						}else{
							$('#show_post').html('<h1 align="center">没有您搜索的关键词!</h1>');
						}
					},
					error: function () {
						alert('有异常')
					}
				});
			}
			function pages2(curr){
				$.ajax({
					url: '${pageContext.request.contextPath}/sys/lk/searchUser.json',
					type: 'post',
					data: 'keywords='+$('#keywords').val()+'&page='+curr,
					dataType: 'json',
					success: function (res) {
						var str = '';
						for (var i = 0;i < res.length;i++){
							str += '<div class="layui-row user_post">  ' +
									'       <div class="layui-row">  ' +
									'        <div class="layui-col-md1 show_user_head" align="center"><a href="${pageContext.request.contextPath}/sys/lk/userdetailed.html/'+res[i].id+'"> <img src="${pageContext.request.contextPath}'+res[i].avatarPath+'"></a> </div>  ' +
									'        <div class="layui-col-md11">  ' +
									'         <h2 style="line-height: 50px;"><a href="${pageContext.request.contextPath}/sys/lk/userdetailed.html/'+res[i].id+'">'+res[i].userName+'</a></h2>  ' +
									'        </div>  ' +
									'       </div>  ' +
									'      </div>'
						}
						if (str != ''){
							$('#show_user').html(str);
						}else{
							$('#show_user').html('<h1 align="center">没有您搜索的关键词!</h1>');
						}
					},
					error: function () {
						alert('有异常')
					}
				});
			}

			layui.use(['laypage', 'layer', 'jquery', 'element'], function() {
				var laypage = layui.laypage,
					layer = layui.layer,
					$ = layui.jquery,
					element = layui.element;

				//点赞
				$(document).on('click',".post_pcount_button",function(){
					if ($(this).css('color') == 'rgb(119, 119, 119)'){
						var postId = $(this).parent().prev().prev().val();
						$.ajax({
							'url':'${pageContext.request.contextPath}/sys/lk/pcount.html',
							'type':'post',
							'data':'postId='+postId,
							'dataType':'html',
							'success':function (result) {
								if (result=='true'){
									layer.msg('点赞成功');
								}else{
									layer.msg('您已经点赞过了');
								}
							},
							'error':function () {
								layer.msg('有异常');
							}
						});
						$(this).css('color','#ff0000');
						var pcount = parseInt($(this).children('span').text())+1;
						$(this).html('<i class="layui-icon">&#xe6c6;</i> <span>'+pcount+"</span>");
					}
				});

				//总页数大于页码总数
				laypage.render({
					elem: 'demo1',
					limit: 5,
					count: $('#userCount').val() //数据总数
						,
					jump: function(obj) {
						pages1(obj.curr);
					}
				});

				//总页数大于页码总数
				laypage.render({
					elem: 'demo2',
					limit: 5,
					count: $('#postsCount').val() //数据总数
					,
					jump: function(obj) {
						pages2(obj.curr);
					}
				});
				
			})
		</script>

	</body>
</html>
