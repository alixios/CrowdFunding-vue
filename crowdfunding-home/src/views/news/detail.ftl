<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>新闻详情</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <#include "../common/head-link.ftl"/>
    <link rel="stylesheet" href="/home/layui/css/layui.css" media="all">
    <style>
        .editor-img {
            width: 100%;
            height: 500px;
            object-fit: cover;
            margin: 15px 0px;
        }

        #content-detail img
        {
            max-width: 100%;
            padding: 10px;
        }
    </style>
</head>
<body>
    <#include "../common/top-menu.ftl"/>
<main>
    <!--page-title-area start-->
    <section class="page-title-area" style="background-image:url(/home/images/bg/page-title-bg.jpg);">
        <div class="right-border-shape">
            <img src="/home/images/shape/02.png" alt="">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xl-10 offset-xl-1">
                    <div class="page-title-wrapper text-center">
                        <h1 class="page-title wow fadeInUp2 animated" data-wow-delay='.1s'>新闻列表</h1>
                        <div class="breadcrumb">
                            <ul class="breadcrumb-list wow fadeInUp2 animated" data-wow-delay='.3s'>
                                <li><a href="/home/index/index">首页<i class="far fa-chevron-right"></i></a></li>
                                <li><a class="active" href="/home/news/detail?id=${news.id}">新闻详情</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--page-title-area area-->
    <!--blog-area start-->
    <section class="blog-details-area grey-bg pt-130 pb-100">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 col-lg-8 col-md-12 mb-40">
                    <div class="blogs__thumb--img white-bg pb-25">
                        <img src="/photo/view?filename=${news.picture}" alt="">
                    </div>
                    <div class="blogs-details-content-area white-bg">
                        <div class="blogs blogs-03 white-bg wow fadeInUp2 animated" data-wow-delay='.1s'>
                            <div class="blogs__thumb pos-rel mb-35">
                                <a class="blog-tag" href="/home/news/detail?id=${news.id}">${news.newsType.name}</a>
                            </div>
                            <div class="blogs__content blogs-03__content">
                                <h3 class="mb-20">
                                    <a href="/home/news/detail?id=${news.id}">
                                    ${news.caption}
                                    </a>
                                </h3>
                                <div class="blogs__content--meta">
                                    <span><i class="far fa-user-circle"></i>${news.homeUser.name}</span>
                                    <span><i class="far fa-calendar-alt"></i> ${news.createTime}</span>
                                    <span><i class="far fa-comment"></i>评论(${commentCount})</span>
                                </div>
                                <div id="content-detail">
                                    <p>
                                    ${news.content}
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="post-comments mb-50 wow fadeInUp2 animated" data-wow-delay='.1s'>
                            <h4 class="comments-title mb-40">用户评论</h4>
                            <ul class="latest-comments">
                                <#list newsCommentList as newsComment>
                                    <li>
                                        <div class="comments-box">
                                            <div class="comments__avatar">
                                            <#if newsComment.homeUser.headPic??>
                                                <img src="/photo/view?filename=${newsComment.homeUser.headPic}" alt="" width="80px;" height="80px;">
                                            <#else>
                                                 <img src="/home/images/blog/08.png" alt="">
                                            </#if>
                                            </div>
                                            <div class="comments__content fix">
                                                <h5>${newsComment.homeUser.name}</h5>
                                                <p>${newsComment.content}</p>
                                             <#if ylrc_home_user??>
                                            <a class="com-btn" href="javaScript:void(0);"
                                               newsId="${newsComment.news.id}" ancestorId="${newsComment.id}"
                                               parentCommentId="${newsComment.id}"
                                               onclick="replyComment(this)">回复<i
                                                    class="far fa-arrow-right"></i>
                                            </a>
                                             </#if>
                                            </div>
                                        </div>
                                    </li>
                                    <#list newsComment.replyComments as replyComment>
                                        <#if replyComment??>
                                    <li class="children">
                                        <div class="comments-box">
                                            <div class="comments__avatar">
                                                 <#if replyComment.homeUser.headPic??>
                                                     <img src="/photo/view?filename=${replyComment.homeUser.headPic}"
                                                          alt="" width="80px;" height="80px;">
                                                 <#else>
                                                 <img src="/home/images/blog/08.png" alt="">
                                                 </#if>
                                            </div>

 <div class="comments__content fix">
     <h5>${replyComment.homeUser.name} @ ${replyComment.parentComment.homeUser.name}</h5>
     <p>${replyComment.content}</p>
                                                <#if ylrc_home_user??>
                                                  <a class="com-btn" href="javaScript:void(0);"
                                                     ancestorId="${newsComment.id}"
                                                     parentCommentId="${replyComment.id}" onclick="replyComment(this)">回复<i
                                                          class="far fa-arrow-right"></i></a>
                                                </#if>
 </div>
                                        </div>
                                    </li>
                                        </#if>
                                    </#list>

                                </#list>
                            </ul>
                        </div>
                        <div class="post-comments-form pb-40 wow fadeInUp2 animated" data-wow-delay='.1s'>
                            <h4 class="comments-title mb-40">评论新闻</h4>
                            <div class="post-form-area">
                                <div class="row">

                                    <div class="col-xl-12">
                                        <div class="input-text input-msg mb-30">
                                            <textarea name="content" id="content" cols="30" rows="10"
                                                      placeholder="评论新闻"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-xl-12">
                                        <div class="comment-btn">
                                            <#if ylrc_home_user??>
                                                <a class="theme_btn theme_btn_bg" news-id="${news.id}"
                                                   href="javaScript:void(0);" onclick="sendComments(this)">发送评论 <i
                                                        class="far fa-arrow-right"></i></a>
                                            <#else>
                                                <a class="theme_btn theme_btn_bg" news-id="${news.id}"
                                                   href="/home/homeUser/login">登录后评论<i
                                                        class="far fa-arrow-right"></i></a>
                                            </#if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-12">
                    <div class="blog-standard-right">
                        <div class="widget mb-40 wow fadeInUp2 animated" data-wow-delay='.1s'>
                            <ul class="widget-list">
                                <#list newsTypeList as newsType>
                                    <li>${newsType.name}
                                        <a href="/home/news/list?newsType.id=${newsType.id}">
                                           <span class="f-right">
                                           <i class="far fa-chevron-right"></i>
                                           </span>
                                        </a>
                                    </li>
                                </#list>
                            </ul>
                        </div>
                        <div class="widget white-bg mb-40 pb-10 wow fadeInUp2 animated" data-wow-delay='.1s'>
                            <h4 class="widget-title pt-40 mb-20 pl-35">最近的新闻</h4>
                            <ul class="instafeed">
                                <#list recentNewsList as recentNews>
                                    <li><a href="/home/news/detail?id=${recentNews.id}">
                                        <img src="/photo/view?filename=${recentNews.picture}" alt=""
                                             style="width: 140px;height: 140px;">
                                        <span class="insta-icon"><i class="fab fa-instagram"></i></span>
                                    </a></li>
                                </#list>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--blog-area end-->
    <!--cta-area start-->
    <section class="cta-area theme-bg pt-55 pb-25">
        <div class="container">
            <div class="row align-items-md-center">
                <div class="col-xl-9 col-lg-9 col-md-8">
                    <div class="cta-wrapper wow fadeInUp2 animated" data-wow-delay='.1s'>
                        <div class="section-title mb-30">
                            <h2>Become Our <b>Premium</b> Partner ?</h2>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4">
                    <div class="cta-wrapper wow fadeInUp2 animated" data-wow-delay='.1s'>
                        <div class="cta-btn text-md-right">
                            <a class="theme_btn theme_btn_bg" href="/home/contact/index">联系我们 <i
                                    class="far fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--cta-area end-->
</main>
    <#include "../common/foot.ftl"/>
    <#include "../common/foot-js.ftl"/>
<script type="text/javascript" src="/home/layui/layui.all.js"></script>
<script type="text/javascript" src="/home/layui/layui.js"></script>
<script>
    var image = $("#content-detail img");
    for (var i = 0; i < image.length; i++) {
        var $item = $(image[i]);
        var src = $item.attr("src");
        if (src.indexOf("/photo/view") != -1)
            $item.addClass("editor-img");
    }

    //评论新闻
    function sendComments(t) {
        var $this = $(t);
        var newsId = $this.attr("news-id");
        var content = $("#content").val();
        var data = "news.id=" + ${news.id} + "&content=" + content;
        $.ajax({
            url: "sendComments",
            type: "POST",
            data: data,
            dataType: 'json',
            success: function (rst) {
                if (rst.code == 0) {
                    layer.msg("新闻评论成功!");
                    location.reload();
                } else {
                    layer.msg(rst.msg);
                }
            },
            error: function (data) {
                layer.msg('网络错误!');
            }
        });
    }

    //回复
    function replyComment(t) {
        //自定页
        layer.open({
            type: 1,
            title: '回复内容',
            skin: 'layui-layer-demo', //样式类名
            anim: 2,
            area: ['420px', '220px'], //宽高
            shadeClose: true, //开启遮罩关闭
            content: '<div class="layui-form-item layui-form-text">\n' +
            '                <label class="layui-form-label" style="width:100px;color:red;">回复内容:</label>\n' +
            '                <div class="layui-input-block">\n' +
            '                <textarea placeholder="请填写回复内容" id="replayContent" class="layui-textarea"></textarea>\n' +
            '                </div>\n' +
            '                </div>',
            btn: ['确定', '关闭'],
            yes: function (index, layero) {
                var $this = $(t);
                var ancestorId = $this.attr("ancestorId");
                var parentCommentId = $this.attr("parentCommentId");
                var option = "news.id=" + ${news.id} + "&content=" + $("#replayContent").val() + "&parentCommentId=" + parentCommentId + "&ancestorId=" + ancestorId;
                ajaxRequest('sendComments', 'POST', option, function (result) {
                    if (result.code == 0) {
                        layer.msg("评论回复成功!");
                        location.reload();
                    } else {
                        layer.msg(result.msg);
                    }
                });
            },
            no: function (index, layero) {
                layer.close(index);
            }
        });
    }
</script>
</body>

</html>