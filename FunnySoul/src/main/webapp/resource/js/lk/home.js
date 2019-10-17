$('.content').on('keyup', function() {
    $('.clear').show();
});
$('.clear').click(function() {
    $('.content').val('');
});

$(function(){
    $(".by_color:eq(0)").css("background-color","#FFF300");
})

$(".show_user_settin").hover(function(){
    $("#user_settin").show(100);
},function(){
    $("#user_settin").hide(100);
})


$("#user_settin ul li").hover(function(){
    $(this).css("background-color","#FFF300");

},function(){
    $(this).css("background-color","#FFDC00");
})

$(".by_color").click(function(){
    $(this).css("background-color","#FFF300");
    $(this).siblings().css("background-color","#FFDC00");
})

var divheight;//第一个div长度
var divtheight;//第二个div长度
var divwidth;//第一个div宽度
var both;//两者之差 最大允许移动长度
var jqul;//li对象
var rigth;//第二个div对象
var leift;//第一个div对象
var tops;//第一个li距离顶部的边距
var topst;//UL距离顶部距离
var judge = true;
var ju;
var topht;
var mag;
$(function () {


    console.log(document.body.clientWidth + '    ' + document.body.clientHeight)
    jqul = $("#cartoon-ul").children(":first");
    mag = $(".cartoon-li")[1].style.paddingTop;
    mag = parseInt(mag, 10);
    console.log($(jqul).children(".leift").offset())
    tops = $(jqul).children(".leift").offset().top;
    topst = tops;
    divheight = $(jqul).children(".leift").height()
    divwidth = $(jqul).children(".leift").width();
    divtheight = $(jqul).children(".rigth").height();
    rigth = $(jqul).children(".rigth");
    leift = $(jqul).children(".leift");
    console.log(divheight + '   ' + divtheight + "   " + tops + '--' + mag)
    both = divtheight - divheight + tops;//允许移动距离 两者差等于大div长度-小div长度+最开始顶部距离


    var topht = $(this).scrollTop();
    var Valuetransfer = divtheight + tops - topht
    console.log(Valuetransfer + '   允许移动距离' + topst + '-' + both)
})

// window.onmousewheel = function(){  //触发滚轮事件
//     console.log("时间触发1")
//     var top = $(this).scrollTop();
//     console.log(top)
// }
//鼠标移动时间
window.onmousemove = function () {
    //     console.log("事件2")
    //     var top = $(this).scrollTop();
    //     console.log(top)
}
window.onscroll = function () {  //滚动条事件
    //console.log($(jqul).children(".leift").offset())
    $(rigth).css("margin-left", divwidth + 10 + "px");
    $(leift).css({ position: "absolute" });
    //,"margin-top":"16px"
    //console.log("事件3")
    topht = $(this).scrollTop();//当前滑轮位置
    judge = ju - topht > 0 ? false : true;   //大于0向上滑动false 小于0向下滑动true
    console.log(judge)
    ju = topht;
    // var heights=topht-divtheight;
    //    var  i=$("#leift").offset().top;
    //    console.log(i)
    //console.log(topht+'滑轮位置')
    var Valuetransfer = divtheight + tops - topht//变量转移判断条件
    //console.log(Valuetransfer+'------------')
    console.log('滑轮--' + topht + '----顶部距离一' + topst + '距离二' + tops + '切换标签判断' + Valuetransfer)
    if (topht < both - topst && topht + topst > tops) {
        $(leift).css("top", topht + topst);
    } else if (topht > both - topst - mag) {


        $(leift).css("top", both);


    } else if (topht - topst < tops) {
        //  if(judge){
        console.log('进入判断')
        //      $(leift).css("top", tops+topht);
        //  }else{
        // var he=divtheight;
        // $(leift).css("top", tops);
        if (judge) {
            $(leift).css("top", topst + topht);
        } else {
            $(leift).css("top", tops);
        }

        //console.log('进入判断'+$(jqul).children('.leift').offset().top+'   '+$(jqul).children('.rigth').offset().top)

        // }

    }
    if (Valuetransfer < topst) {
        jqul = $(jqul).next();
        console.log(Valuetransfer + '   允许移动距离' + topht + '-' + both)
        console.log('向上转移值' + $(jqul).children(".leift").height())
        //jqul=jquls;
        console.log($(jqul).children(".leift").height())
        tops = $(jqul).children(".rigth").offset().top;
        divheight = $(jqul).children(".leift").height()
        divtheight = $(jqul).children(".rigth").height();
        rigth = $(jqul).children(".rigth");
        leift = $(jqul).children(".leift");
        both = divtheight - divheight + tops;
        console.log("变量想下转移" + tops + '  ' + both + "  " + divtheight + "  " + divheight + "可移动距离" + tops + "-" + both)
    } else if (Valuetransfer > divtheight + mag + topst) {
        jqul = $(jqul).prev();
        console.log("进入向上判断")

        console.log($(jqul).children(".leift").height())
        tops = $(jqul).children(".rigth").offset().top;
        divheight = $(jqul).children(".leift").height()
        divtheight = $(jqul).children(".rigth").height();
        rigth = $(jqul).children(".rigth");
        leift = $(jqul).children(".leift");

        both = divtheight - divheight + tops;
        console.log('第二个div长度' + divtheight + "第一个div长度" + divheight + "允许移动距离" + tops + '-' + both + '滑轮位置' + topht)
        console.log("变量向上转移" + both)

    }

    // console.log(top)
}

// var selindetail = false;
// function loads() {
//     if (selindetail) {
//         $("#cartoon-ul").animate({
//             width: '100%',
//             paddingLeft: '25%',
//         }, 200)
//     }
//     selindetail = false;
//     console.log('鼠标点击')
// }
// layui.use('',function(){
//     console.log('开始执行')
// })
function del(s) {
    $(s).parent().parent().remove()
    layer.msg('老天爷，怎么能让您看这种东西')
}
$(function () {
    $('.leift_div').mouseleave(function () {
        console.log('离开事件进入')
        $('.leift_div').css({ 'z-index': 0 })
    })
})
function changecss(s) {
    console.log('方法执行')
}
/* function load() {
    // $("#cartoon-ul")
    if (!selindetail) {
        $("#cartoon-ul").animate({
            width: '1000px',
            paddingLeft: '20%',


        }, 200)

        setTimeout(function () {
            selindetail = true;
            console.log('定时器执行')
        }, 230);


    }


} */