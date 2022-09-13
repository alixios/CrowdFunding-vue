<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>新闻列表</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <#include "../common/head-link.ftl"/>
    <link rel="stylesheet" href="/home/layui/css/layui.css" media="all">
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
                                <li><a class="active">新闻列表</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--page-title-area area-->
    <!--blog-area start-->
    <section class="blog-area pt-130 pb-100">
        <div class="container">
            <div class="row">
                <#list pageBean.content as news>
                <div class="col-xl-4 col-lg-4 col-md-6 wow fadeInUp2 animated" data-wow-delay='.1s'>
                    <div class="blogs mb-30">
                        <div class="blogs__thumb pos-rel mb-45">
                            <div class="blogs__thumb--img">
                                <img src="/photo/view?filename=${news.picture}" alt="" style="width: 366px;height: 247px;">
                            </div>
                            <a class="blog-tag" href="/home/news/detail?id=${news.id}">${news.newsType.name}</a>
                        </div>
                        <div class="blogs__content">
                            <div class="blogs__content--meta mb-15">
                                <span><i class="far fa-calendar-alt"></i>${news.createTime}</span>
                                <span><i class="far fa-comment"></i> 评论 (${news.comments})</span>
                            </div>
                            <h4 class="mb-20"><a href="/home/news/detail?id=${news.id}">${news.caption}</a></h4>
                            <ul class="project-manager">
                                <li>
                                    <a href="#">
                                        <#if news.homeUser.headPic??>
                                              <img src="/photo/view?filename=${news.homeUser.headPic}" alt="" style="width: 40px;height: 40px;">
                                        <#else>
                                         <img src="/admin/images/default-head.jpg" alt="" style="width: 40px;height: 40px;">
                                        </#if>
                                    <span>${news.homeUser.name}</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="more_btn_02" href="/home/news/detail?id=${news.id}">阅读更多<i class="far fa-arrow-right"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                </#list>
            </div>
            <div id="page" style="text-align: center">

            </div>
        </div>
    </section>
    <!--blog-area end-->
</main>
    <#include "../common/foot.ftl"/>
    <#include "../common/foot-js.ftl"/>
<script type="text/javascript" src="/home/layui/layui.all.js"></script>
<script type="text/javascript" src="/home/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['laypage', 'layer'], function() {
        var laypage = layui.laypage
                , layer = layui.layer;
        //只显示上一页、下一页
        var M={};
        M.count = ${pageBean.total};
        M.curr = ${pageBean.currentPage};
        M.pageSize = ${pageBean.pageSize}
        laypage.render({
            elem: 'page'
            ,count: M.count
            ,limit:M.pageSize
            ,curr:M.curr
            ,jump: function(obj, first){
                //首次不执行
                if(!first){
                    M.curr = obj.curr;
                    location.href = "list?currentPage=" + M.curr+"&newsType.id=${newsType}";
                }
            }
        });
    });

</script>
</body>

</html>