<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>项目进度编辑</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <#include "../common/head-link.ftl"/>
    <link rel="stylesheet" href="/home/layui/css/layui.css">
    <script src="/home/layui/layui.all.js" type="text/javascript"></script>
    <script src="/home/js/msg.js" type="text/javascript"></script>
    <style>
        .progress
        {
            display: block;
        }

        h4
        {
            font-size: 20px;
        }

        p, a, span
        {
            color: black;
        }
    </style>
</head>

<body>

    <#include "../common/top-menu.ftl"/>
    <main>
        
        <!--page-title-area start-->
        <section class="page-title-area" style="background-image:url(assets/img/bg/page-title-bg.jpg);">
            <div class="right-border-shape">
                <img src="/home/images/shape/02.png" alt="">
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-xl-10 offset-xl-1">
                        <div class="page-title-wrapper text-center">
                            <h1 class="page-title wow fadeInUp2 animated" data-wow-delay='.1s'>项目进度</h1>
                            <div class="breadcrumb">
                                <ul class="breadcrumb-list wow fadeInUp2 animated" data-wow-delay='.3s'>
                                    <li><a href="/home/index/index">首页 <i class="far fa-chevron-right"></i></a></li>
                                    <li><a class="active">项目进度</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--page-title-area area-->
        <!--project-area start-->
        <section class="project-image-area grey-bg pt-130 pb-100" style="background-image:url(/home/images/shape/09.png);">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-xl-7">
                        <div class="project-img mb-30 wow fadeInUp2 animated" data-wow-delay='.1s'>
                             <#if item.project.headPic??>
                                <#if item.project.headPic?length gt 0>
                                     <img src="/photo/view?filename=${item.project.headPic}" alt="" height="537"/>
                                <#else>
                                     <img src="/admin/images/default-head.jpg" alt="默认图片" height="537"/>
                                </#if>
                             <#else>
                                 <img src="/admin/images/default-head.jpg" alt="默认图片" height="537"/>
                             </#if>
                        </div>
                    </div>
                    <div class="col-xl-5  wow fadeInUp2 animated" data-wow-delay='.1s'>
                        <div class="projects project-cart white-bg mb-30">
                            <div class="projects__content" style="height: 537px;">
                                <a class="new-tag" style="color: white">${item.project.projectCategory.name}</a>
                                <h3><a>${item.project.caption}</a></h3>
                                    <div class="projects__manager d-sm-flex align-items-center mb-40">
                                        <div class="manager-img mr-20">
                                             <#if item.project.homeUser.headPic??>
                                                <#if item.project.homeUser.headPic?length gt 0>
                                                    <img style="height: 55px; width: 55px;" class="layui-nav-img" src="/photo/view?filename=${item.project.homeUser.headPic}" alt="">
                                                <#else>
                                                    <img style="height: 55px; width: 55px;" class="layui-nav-img" src="/admin/images/default-head.jpg" alt="默认图片">
                                                </#if>
                                             <#else>
                                                 <img style="height: 55px; width: 55px;" class="layui-nav-img" src="/admin/images/default-head.jpg" alt="默认图片">
                                             </#if>
                                        </div>
                                        <div class="name">
                                            <h5>${item.project.homeUser.name}</h5>
                                            <address>
                                                <a>
                                                    <#if item.project.homeUser.sex == 0>
                                                        未知
                                                    <#elseif item.project.homeUser.sex ==1>
                                                        男
                                                    <#else>
                                                        女
                                                    </#if>
                                                </a>
                                            </address>
                                        </div>
                                    </div>
                                <div class="skill mb-20">
                                    <p class="skill-para">目标金额 <span>￥ ${item.project.targetPrice}</span></p>
                                    <div class="progress">
                                        <div class="layui-progress" lay-showPercent="yes">
                                            <div class="layui-progress-bar" lay-percent="${item.project.progress}%"></div>
                                        </div>
                                    </div>
                                </div>
                                <p>温馨提示:您的支持，犹如爱已经起航，新阳光承诺为您撑起抵达彼岸的风帆，让这份爱快速前行，并且行的更远。</p>
                                <ul class="cart-list d-sm-flex align-items-center">
                                    <li><a class="theme_btn theme_btn_bg" href="/home/project/detail?id=${item.project.id}"
                                        data-animation="fadeInLeft" data-delay=".5s">现在捐赠<i class="far fa-arrow-right"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--project-area end-->
        <!--our-overview-area start-->
        <section class="pos-rel  wow fadeInUp2 animated" data-wow-delay='.1s' style="padding: 20px;">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <blockquote class="layui-elem-quote" style="margin-bottom: 15px;">
                            <div class="layui-row">
                                <span class="span-margin">${item.createTime?string("yyyy/MM/dd")}</span>
                                <span class="span-margin">信息来源:${item.project.caption}</span>
                            </div>
                            <div class="layui-row">
                                <span>编辑:${item.project.homeUser.name}</span>
                            </div>
                        </blockquote>
                        <div class="caption" style="padding: 10px 4px">
                            <h4 style="display: inline-block; width: 100%; text-align: center;">
                                《${item.caption}》
                            </h4>
                        </div>
                        <div class="content">
                            ${item.content}
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--our-overview-area end-->
    </main>

    <#include "../common/foot.ftl"/>

    <!-- JS here -->
    <#include "../common/foot-js.ftl"/>
</body>
<script>
    var M = {};
    layui.use('element', function()
    {
        var element = layui.element;
        element.render();

    });

</script>
</html>