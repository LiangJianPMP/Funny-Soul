$('.content').on('keyup', function() {
    $('.clear').show();
});

$('.clear').click(function() {
    $('.content').val('');
});

$(function(){
    $(".by_color:eq(0)").css("background-color","#FEFCFD");
    $(".by_color:eq(0) a").css("color","#001834");
})

$(".show_user_settin").hover(function(){
    $("#user_settin").show();
},function(){
    setTimeout(function () {
        $("#user_settin").hide();
    },500)
})

$("#user_settin ul li").hover(function(){
    $(this).css("background-color","#000000");
},function(){
    $(this).css("background-color","#001834");
})

$(".by_color").click(function(){
    $(this).css("background-color","#FEFCFD");
    $(this).children('a').css("color","#001834");
    $(this).siblings().css("background-color","#001834");
    $(this).siblings().children('a').css("color","#FEFCFD");
})