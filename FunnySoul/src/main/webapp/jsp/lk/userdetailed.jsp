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
    <title>用户详细</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/search.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/lk/userdetailed.css">
</head>
<body>
    <div id="navigation">
        <div class="layui-row width_margin">
            <div class="layui-col-md2">
                <img src="${pageContext.request.contextPath}/resource/image/logo.jpg"/>
            </div>
            <div class="layui-col-md1 navigation_size by_color">
                <a href="${pageContext.request.contextPath}/sys/lk/home.html">首页</a>
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
    <div class="width_margin">
		<div class="layui-row show_userdetailed">
			<div class="layui-col-md8 user_left">
				<div class="layui-row user_post">
					<div class="layui-row">
						<div class="layui-col-md2 show_user_head" align="center"><img src="#"></div>
						<div class="layui-col-md10">
							<h2>勇者斗恶狼</h2>
							<p>10-23 13:46</p>
						</div>
					</div>
					<div class="layui-row">
						<p>动物解说系列--真正的爱狗人士为谁背了黑锅？本人并非动物学专家，本贴也非科普用，仅仅是因为喜欢做而做，部分观点可能有纰漏和错误，还望大家指正，本人不胜感激。因为篇幅问题，经过修正的完整版只能在公众号中展示，希望诸位朋友们谅解。（内含海量动图、文字修正、和相关视频等内容）</p>
					</div>
					<div class="layui-row">
						<video src="#" controls="controls" width="100%"></video>
						<!-- <img src="#" /> -->
					</div>
					<div class="layui-row">
						<div class="layui-row">
							<div class="layui-col-md2"><a class="post_operation_button"><i class="layui-icon">&#xe756;</i> <span>10</span></a></div>
							<div class="layui-col-md2"><a class="post_operation_button"><i class="layui-icon">&#xe6c6;</i> <span>10</span></a></div>
							<div class="layui-col-md2"><a class="post_operation_button"><i class="layui-icon">&#xe611;</i> <span>10</span></a></div>
						</div>
					</div>
				</div>
				<div class="layui-row user_post">
					<div class="layui-row">
						<div class="layui-col-md2 show_user_head" align="center"><img src="#"></div>
						<div class="layui-col-md10">
							<h2>勇者斗恶狼</h2>
							<p>10-23 13:46</p>
						</div>
					</div>
					<div class="layui-row">
						<p>动物解说系列--真正的爱狗人士为谁背了黑锅？本人并非动物学专家，本贴也非科普用，仅仅是因为喜欢做而做，部分观点可能有纰漏和错误，还望大家指正，本人不胜感激。因为篇幅问题，经过修正的完整版只能在公众号中展示，希望诸位朋友们谅解。（内含海量动图、文字修正、和相关视频等内容）</p>
					</div>
					<div class="layui-row">
						<video src="#" controls="controls" width="100%"></video>
						<!-- <img src="#" /> -->
					</div>
					<div class="layui-row">
						<div class="layui-row">
							<div class="layui-col-md2"><a class="post_operation_button"><i class="layui-icon">&#xe756;</i> <span>10</span></a></div>
							<div class="layui-col-md2"><a class="post_operation_button"><i class="layui-icon">&#xe6c6;</i> <span>10</span></a></div>
							<div class="layui-col-md2"><a class="post_operation_button"><i class="layui-icon">&#xe611;</i> <span>10</span></a></div>
						</div>
					</div>
				</div>
				<div class="layui-row user_post">
					<div class="layui-row">
						<div class="layui-col-md2 show_user_head" align="center"><img src="#"></div>
						<div class="layui-col-md10">
							<h2>勇者斗恶狼</h2>
							<p>10-23 13:46</p>
						</div>
					</div>
					<div class="layui-row">
						<p>动物解说系列--真正的爱狗人士为谁背了黑锅？本人并非动物学专家，本贴也非科普用，仅仅是因为喜欢做而做，部分观点可能有纰漏和错误，还望大家指正，本人不胜感激。因为篇幅问题，经过修正的完整版只能在公众号中展示，希望诸位朋友们谅解。（内含海量动图、文字修正、和相关视频等内容）</p>
					</div>
					<div class="layui-row">
						<video src="#" controls="controls" width="100%"></video>
						<!-- <img src="#" /> -->
					</div>
					<div class="layui-row">
						<div class="layui-row">
							<div class="layui-col-md2"><a class="post_operation_button"><i class="layui-icon">&#xe756;</i> <span>10</span></a></div>
							<div class="layui-col-md2"><a class="post_operation_button"><i class="layui-icon">&#xe6c6;</i> <span>10</span></a></div>
							<div class="layui-col-md2"><a class="post_operation_button"><i class="layui-icon">&#xe611;</i> <span>10</span></a></div>
						</div>
					</div>
				</div>
				<div class="layui-row user_post">
					<div id="demo1"></div>
				</div>
			</div>
			<div class="layui-col-md3 user_right">
				<div class="layui-row"><img src="#" align="center"></div>
				<div class="layui-row"><h2>勇者斗恶狼</h2></div>
			</div>
		</div>
	</div>

    <script src="${pageContext.request.contextPath}/resource/js/jquery-3.1.1.min.js" type="text/javascript" ></script>
	<script src="${pageContext.request.contextPath}/resource/js/index.js"></script>
    <script src="${pageContext.request.contextPath}/resource/layui/layui.js" type="text/javascript"></script>
    <script>
		layui.use(['laypage', 'layer'], function() {
			var laypage = layui.laypage,
				layer = layui.layer;
		
			//总页数大于页码总数
			laypage.render({
				elem: 'demo1',
				count: 70 //数据总数
					,
				jump: function(obj) {
					console.log(obj)
				}
			});
		})
	</script>

</body>
</html>
