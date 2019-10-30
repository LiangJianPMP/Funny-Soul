<%--
  Created by IntelliJ IDEA.
  User: 29007
  Date: 2019/10/28
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- <script src="resource/layui/layui.js"></script>
    <link rel="stylesheet" href="resource/layui/css/layui.css"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/resource/layui/layui.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/resource/jquery-3.1.1.min.js"></script>
    <script>
        layui.use('form',function () {
            console.log("加载控件")
        })
    </script>
    <script>

        function check(i) {
            console.log("方法进入")
            i-=1;
            var value
            try {
              value =$('.textareamsg').eq(i).val();
              console.log(value.replace(/\s+/g,"")=="")
              if(value.replace(/\s+/g,"")==""){
                 layer.msg("内容不能为空")
                  return false;

              }
            }catch (e) {
                console.log("出现异常"+i+value)
            }
            return true;
        }
        function fileload() {
            layui.use('upload', function () {
                console.log("js已引入")
                var upload = layui.upload;
                var upl = upload.render({
                    elem: '#test10'
                    , url: '${pageContext.request.contextPath}/fileupload/file_up'
                    , ext: 'jpg|png|gif' //那么，就只会支持这三种格式的上传。注意是用|分割。
                    , multiple: true
                    , data: {
                        'msg': '图片'
                    }
                    , before: function (obj) {
                        //预读本地文件示例，不支持ie8
                        obj.preview(function (index, file, result) {
                            console.log(file + index + result)
                            var th = "<img height='200px' width='100%' src=" + result + ">";
                            // th="<input name='attachs' type='file' value="+file+">"
                            console.log(th)
                            $(".img-table").eq(0).children(":first").html(th)//图片链接（base64）
                        });
                    }
                    , error: function () {
                        console.log("上传失败")
                    }
                });

                var upl = upload.render({
                    elem: '#test9'
                    ,url: '${pageContext.request.contextPath}/fileupload/file_up'
                    // ,ext: 'qlv|mp4' //那么，就只会支持这三种格式的上传。注意是用|分割。
                    ,accept: 'video'
                    , exts: 'qlv|mpg|mp4|webm|swf'
                    ,size: 50000000000
                    ,data:{
                        'msg':'视频'
                    }
                    , before: function (obj) {
                        //预读本地文件示例，不支持ie8
                        obj.preview(function (index, file, result) {
                            console.log("视频进入")
                            var th="<video height='200px' width='100%' src="+result+" controls=\"controls\">\n" +
                                "您的浏览器不支持 video 标签。\n" +
                                "</video>"
                            $(".img-table").eq(1).children(":first").html(th)//图片链接（base64）
                        });
                    }
                    , error: function () {
                       console.log("上传失败")
                    }
                });

            })
        }


        var imgths = "  <tr>\n" +
            "                    <td>\n" +
            "                        <div class=\"layui-upload\">\n" +
            "                            <button type=\"button\" class=\"layui-btn\" id=\"test10\">上传图片</button>\n" +
            "                        </div>\n" +
            "                    </td>\n" +
            "                </tr>"

        var venths="  <tr>\n" +
            "                    <td>\n" +
            "                        <div class=\"layui-upload\">\n" +
            "                            <button type=\"button\" lay-type=\"video\" class=\"layui-btn\" id=\"test9\">上传视频</button>\n" +
            "                        </div>\n" +
            "                    </td>\n" +
            "                </tr>";


        $(function () {
            $("#msg-file").on('change', function () {
                console.log($(this).val())
                jqSubmit("图片")
            })
        })
        $(window).resize(function () {
            var h = document.documentElement.clientWidth;//获取页面可见高度
            $("#popups").css({"left": (h - 540) / 2})
            $("#Sending-pictures").css({"left": (h - 540) / 2})
            $("#Send-video").css({"left": (h - 540) / 2})
        });



        function cancelpost(texti) {
            console.log("隐藏事件进入" + texti)

            switch (texti) {
                case "文本":
                    $("#popups").css({'display': 'none'});//隐藏
                    $("#popups").animate({'top': "-300px"}, 100)
                    break;
                case "图片":
                    $("#Sending-pictures").css({'display': 'none'});//隐藏
                    $("#Sending-pictures").animate({'top': "-300px"}, 100)
                    break;
                case "视频":
                    $("#Send-video").animate({'top': "-300px"}, 100)
                    $("#Send-video").css({'display': 'none'});//隐藏

                    break;
            }

            $("#hidebg").css('display', 'none');//隐藏
        }
        // 发送文本
        function postcharacter() {
            var h = document.documentElement.clientWidth;//获取页面可见高度
            console.log("点击事件进入")

            $("#popups").css({'left': (h - 540) / 2, 'display': 'block'});//显示
            $("#popups").animate({'top': "20%"}, 100)
            $("#hidebg").css('display', 'block');//显示
        }

        // 发送图片
        function postimg() {
            var h = document.documentElement.clientWidth;//获取页面可见高度
            console.log("点击事件进入")
            $(".img-table").eq(0).html(imgths)
            $("#Sending-pictures").css({'left': (h - 540) / 2, 'display': 'block'});//显示
            $("#Sending-pictures").animate({'top': "20%"}, 100)
            $("#hidebg").css('display', 'block');//显示
            fileload()
        }

        // 发送视频
        function postvideo() {
            var h = document.documentElement.clientWidth;//获取页面可见高度
            $("#Send-video").css({'left': (h - 540) / 2, 'display': 'block'});//显示
            $("#Send-video").animate({'top': "20%"}, 100)
            $(".img-table").eq(1).html(venths)
            $("#hidebg").css('display', 'block');//显示
            fileload()
        }

        function overup_msgfile(s) {
            ths = $(s);
            console.log("方法以进入")
            //普通图片上传


        }

        //网址输入框
        function overup_msgurl(s) {
            layer.prompt('请输入图片路径', function (pass, index) {
                layer.close(index);
                // if(IsURL(pass)){
                var th = "<img  height='200px' width='100%' src=" + pass + ">";
                $(s).parent().html(th);

            });
        }

        function jqSubmit(name) {
            var file_obj = document.getElementById('msg-file').files[0];

            var fd = new FormData();
            fd.append('username', 'root')
            fd.append('files', file_obj);
            $.ajax({
                url: '${pageContext.request.contextPath}/upload_file/',
                type: 'POST',
                data: fd,
                processData: false,  //tell jQuery not to process the data
                contentType: false,  //tell jQuery not to set contentType
                //这儿的三个参数其实就是XMLHttpRequest里面带的信息。
                success: function (url) {
                    console.log(url)
                }

            })
        }

        function overup_veourl(s) {
            layer.prompt('请输入视频路径', function (pass, index) {
                layer.close(index);
                // if(IsURL(pass)){
                var th = "<video  height='200px'' width='100%' src=" + pass + " controls='controls'>您的浏览器不支持 video 标签。</video>";
                $(s).parent().html(th);
                // }else{
                // 	layer.msg("路径错误")
                // }

            });
        }


        // 验证路径是否正确
        function IsURL(str_url) {
            console.log("进入")
            var strRegex = '^((https|http|ftp|rtsp|mms)?://)'
                + '?(([0-9a-z_!~*\'().&=+$%-]+: )?[0-9a-z_!~*\'().&=+$%-]+@)?' //ftp的user@
                + '(([0-9]{1,3}.){3}[0-9]{1,3}' // IP形式的URL- 199.194.52.184
                + '|' // 允许IP和DOMAIN（域名）
                + '([0-9a-z_!~*\'()-]+.)*' // 域名- www.
                + '([0-9a-z][0-9a-z-]{0,61})?[0-9a-z].' // 二级域名
                + '[a-z]{2,6})' // first level domain- .com or .museum
                + '(:[0-9]{1,4})?' // 端口- :80
                + '((/?)|' // a slash isn't required if there is no file name
                + '(/[0-9a-z_!~*\'().;?:@&=+$,%#-]+)+/?)$';
            var re = new RegExp(strRegex);

            if (re.test(str_url)) {
                return true;
            } else {
                return false;
            }
        }

    </script>


    <style>
        .roundness_link {
            height: 80px;
            width: 80px;
            /* background-color: indianred; */
            border-radius: 40px;
            display: inline-block;
        }

        .layui-post {
            width: 540px;
            height: 290px;
        }

        .link_o {
            background-color: #fff;
            color: #000000;
            text-align: center;
            line-height: 80px;
            font-size: 28px;
            /* font-weight:bold; */


        }

        body {
            background-color: lightblue;

        }

        .link_t {
            background-color: #FF462A;
            line-height: 80px;
            text-align: center;
        }

        .link_s {
            background-color: #FF62CF;
            line-height: 80px;
            text-align: center;
        }

        .roundness_link:hover {
            cursor: pointer;
        }


        #hidebg {
            position: absolute;
            left: 0px;
            top: 0px;
            background-color: #000;
            width: 1920px;
            /*宽度设置为100%，这样才能使隐藏背景层覆盖原页面*/
            filter: alpha(opacity=60);
            /*设置透明度为60%*/
            opacity: 0.6;
            /*非IE浏览器下设置透明度为60%*/
            display: none;
            /* //www.jb51.net */
            z-Index: 2;
            height: 100%;
        }

        #popups {
            height: 290px;
            width: 540px;
            /* background-color: #fff;
            border: 1px solid red; */
            position: fixed;
            top: -300px;
            display: none;
            z-index: 3;
        }

        .popups-img {
            float: left;
            height: 65px;
            width: 65px;
            border-radius: 5px;
            background-color: mediumorchid;
            top: 0;
        }

        .popups-msg {
            /* display: inline-block; */
            float: left;
            width: 455px;
            height: 290px;
            background-color: #fff;
            margin-left: 10px;
            border-radius: 2px;
        }

        .msg-buttom {
            height: 50px;
            width: 100%;
            border-top: 1px solid #c4c4c4;
            margin-top: 88px;
            padding-top: 6px;
        }

        textarea {
            resize: none;
            width: 430px;
            height: 180px;
            margin-left: 10px;

        }

        #titlemsg {


            border: none;
            width：200px;
            box-radius: 25%;
            outline: medium;
            font-size: 26px;
            margin-top: 3px;
            margin-left: 8px;
            margin-bottom: 3px;
        }

        #Sending-pictures {
            height: 490px;
            width: 540px;
            /* background-color: #fff;
            border: 1px solid red; */
            position: fixed;
            top: -300px;
            display: none;
            z-index: 3;
        }

        #Send-video {
            height: 490px;
            width: 540px;
            /* background-color: #fff;
            border: 1px solid red; */
            position: fixed;
            top: -300px;
            display: none;
            z-index: 3;
        }

        td {
            /* text-align: center; */
            background-color: #f2f2f2;
            border: 1px solid #FF62CF;
            width: 100%;
            text-align: center;
        }
    </style>
    <title>Document</title>
</head>

<body>
<!-- 发送文本 -->
<div id="popups">
    <!-- 头像 -->
    <div class="popups-img"></div>
    <form class="layui-form"  onsubmit="return check(1)" method="post" action="${pageContext.request.contextPath}/fileupload/post_msg">
        <div class="popups-msg">
            <div style="height:240px">
                <p>用户名</p>
                <input name="postTitile" id="titlemsg" lay-verify="required" placeholder="标题">
                <div class="expandingArea " id="textarea">
                    <textarea class="textareamsg" name="details" lay-verify="required"></textarea>
                </div>
            </div>
            <div class="msg-buttom" style="margin-top: 0px">
                <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="cancelpost('文本')"
                        style="margin-left: 10px;">取消
                </button>
                <button type="submit" class="layui-btn layui-btn-sm layui-btn-normal"
                        style="margin-left: 335px;">发送
                </button>
            </div>
        </div>
    </form>
</div>


<!-- 发送图片 -->
<div id="Sending-pictures">
    <!-- 头像 -->
    <div class="popups-img"></div>
    <form class="layui-form" onsubmit="return check(2)" method="post" action="${pageContext.request.contextPath}/fileupload/post_msg">
        <div class="popups-msg" style="height: 480px">
            <div style="height:240px">
                <p>用户名</p>
                <table class="img-table" style="width: 100%;border: 1px solid red;height: 200px;">
                    <tr>

                        <td>
                            <div class="layui-upload">
                                <button type="button" class="layui-btn" id="test10">上传图片</button>
                            </div>
                        </td>

                    </tr>
                </table>
            </div>
            <div class="msg_center" style="width: 200px;height: 100px">
                <textarea class="textareamsg" name="details" lay-verify="required"></textarea>
            </div>
            <div class="msg-buttom">
                <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="cancelpost('图片')"
                        style="margin-left: 10px;">取消
                </button>
                <button type="submit" class="layui-btn layui-btn-sm layui-btn-normal"
                        style="margin-left: 335px;">发送
                </button>
            </div>
        </div>
    </form>

</div>

<!-- 发送视频 -->
<div id="Send-video">
    <!-- 头像 -->
    <div class="popups-img"></div>
    <form method="post" onsubmit="return check(3)" action="${pageContext.request.contextPath}/fileupload/post_msg">
        <div class="popups-msg" style="height: 480px">
            <div style="height:240px">
                <p>用户名</p>
                <table class="img-table" style="width: 100%;border: 1px solid red;height: 200px;">
                    <tr>

                        <td>
                            <div class="layui-upload">
                                <button type="button" class="layui-btn" id="test9">上传视频</button>
                            </div>
                        </td>

                    </tr>
                </table>
            </div>
            <div class="msg_center" style="width: 200px;height: 100px">
                <textarea class="textareamsg" name="details" lay-verify="required"></textarea>
            </div>
            <div class="msg-buttom">
                <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="cancelpost('视频')"
                        style="margin-left: 10px;">取消
                </button>
                <button type="submit"   onsubmit="return check(3)" class="layui-btn layui-btn-sm layui-btn-normal"
                        style="margin-left: 335px;">发送
                </button>
            </div>
        </div>
        <%--        <div class="popups-msg" style="height: 480px">--%>
        <%--            <div style="height:240px">--%>
        <%--                <p>用户名</p>--%>
        <%--                <!-- <input name="title" id="titlemsg" placeholder="标题"> -->--%>
        <%--                <table class="img-table" style="width: 100%;border: 1px solid red;height: 200px;">--%>
        <%--                    <tr>--%>
        <%--                        <td>--%>
        <%--                            <div class="layui-upload">--%>
        <%--                                <button type="button" lay-type="video" class="layui-btn" id="test9">上传视频</button>--%>
        <%--                            </div>--%>
        <%--                        </td>--%>
        <%--                    </tr>--%>
        <%--                </table>--%>
        <%--            </div>--%>
        <%--            <div class="msg_center" style="width: 200px;height: 100px">--%>
        <%--                <textarea class="textareamsg" name="details" lay-verify="required"></textarea>--%>
        <%--            </div>--%>
        <%--            <div id="msg-buttom">--%>
        <%--                <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="cancelpost('视频')"--%>
        <%--                        style="margin-left: 10px;">取消--%>
        <%--                </button>--%>
        <%--                <button type="button" class="layui-btn layui-btn-sm layui-btn-normal"--%>
        <%--                        style="margin-left: 335px;">发送--%>
        <%--                </button>--%>
        <%--            </div>--%>
        <%--        </div>--%>
    </form>

</div>


<div id="hidebg"></div>

<div class="roundness_link link_o" onclick="postcharacter()">Aa</div>
<div class="roundness_link link_t" onclick="postimg()"><i class="layui-icon layui-icon-picture"
                                                          style="font-size: 36px; color: #000;"></i></div>
<div class="roundness_link link_s" onclick="postvideo()"><i class="layui-icon layui-icon-video"
                                                            style="font-size: 36px; color: #000;"></i>
</div>
<%--                        <td onclick="overup_msgurl(this)"><i class="layui-icon layui-icon-link"--%>
<%--                                                             style="font-size: 50px; color:#acacac;"></i>--%>
<%--                            <br>--%>
<%--                            <span style="color: #acacac;">网页图片</span>--%>
<%--                        </td>--%>
</body>

</html>