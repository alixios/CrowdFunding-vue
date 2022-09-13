<!doctype html>
<html lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>项目列表</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <#include "../common/head-link.ftl"/>
    <link rel="stylesheet" href="/home/layui/css/layui.css">
    <script src="/home/layui/layui.all.js" type="text/javascript"></script>
    <style>
        .progress
        {
            display: block;
        }

        h4
        {
            font-size: 20px;
        }
    </style>
</head>

<body>

    <#include "../common/top-menu.ftl"/>
    <main>
        
        <!--page-title-area start-->
        <section class="page-title-area" style="background-image:url(assets/img/bg/page-title-bg.jpg);">
            <div class="container">
                <div class="row">
                    <div class="col-xl-10 offset-xl-1">
                        <div class="page-title-wrapper text-center">
                            <h1 class="page-title wow fadeInUp2 animated" data-wow-delay='.1s'>
                                项目列表
                            </h1>
                            <div class="breadcrumb">
                                <ul class="breadcrumb-list wow fadeInUp2 animated" data-wow-delay='.3s'>
                                    <li><a href="/home/index/index">首页 <i class="far fa-chevron-right"></i></a></li>
                                    <li><a class="active">项目列表</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--page-title-area area-->
        <!--project-area start-->
        <section class="project-01-area pt-125 pb-100">
            <div class="container">
                <div class="row mb-50 align-items-center">
                    <div class="col-xl-8 col-lg-8 col-md-8 col-sm-6">
                        <h5>众筹项目</h5>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                        <form class="select-area mb-50" method="get" action="project">
                            <div class="layui-form-item">
                                <div class="layui-input-inline">
                                    <input name="caption" id="caption" type="search" class="layui-input" placeholder="请输入项目标题" value="${caption!''}"/>
                                </div>
                                <button type="submit" class="layui-btn layui-btn-primary">
                                    <i class="layui-icon layui-icon-search"></i>
                                    搜索
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <#list pageBean.content as item>
                        <div class="col-xl-4 col-lg-4 col-md-6">
                            <div class="projects projects-02 white-bg mb-30 wow fadeInUp2 animated" data-wow-delay='.2s'>
                                <div class="projects__thumb pos-rel">
                                    <#if item.headPic??>
                                        <#if item.headPic?length gt 0>
                                             <img src="/photo/view?filename=${item.headPic}" alt="" height="268">
                                        <#else>
                                             <img src="/admin/images/default-head.jpg" alt="默认图片" height="268">
                                        </#if>
                                    <#else>
                                        <img src="/admin/images/default-head.jpg" alt="默认图片" height="268">
                                    </#if>
                                </div>
                                <div class="projects__content">
                                    <h4><a href="detail?id=${item.id}">
                                        <#if item.caption?length gt 10>
                                            ${item.caption?substring(0,10)} ...
                                        <#else>
                                            ${item.caption}
                                        </#if>
                                    </a></h4>
                                    <div class="skill mb-30">
                                        <p>目标金额 <span>$ ${item.targetPrice}</span></p>
                                        <div class="progress">
                                            <div class="layui-progress" lay-showPercent="yes">
                                                <div class="layui-progress-bar" lay-percent="${item.progress}%"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="projects__content--manager">
                                        <ul class="project-manager">
                                            <li>
                                                <a>
                                                    <#if item.homeUser.headPic??>
                                                        <#if item.homeUser.headPic?length gt 0>
                                                            <img class="layui-nav-img" src="/photo/view?filename=${item.homeUser.headPic}" alt="">
                                                        <#else>
                                                            <img class="layui-nav-img" src="/admin/images/default-head.jpg" alt="默认图片">
                                                        </#if>
                                                    <#else>
                                                        <img class="layui-nav-img" src="/admin/images/default-head.jpg" alt="默认图片">
                                                    </#if>
                                                    <span>${item.homeUser.name}</span>
                                                </a>
                                            </li>
                                            <li>
                                                <p class="time"><i class="far fa-clock"></i>${item.end?string("yyyy-MM-dd")}</p>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </#list>
                </div>
                <div id="page">

                </div>
            </div>
        </section>
        <!--project-area end-->
    </main>
    <#include "../common/foot.ftl"/>

    <!-- JS here -->
    <#include "../common/foot-js.ftl"/>
</body>
<script>
    var M = {};
    M.curr = ${pageBean.currentPage};
    M.count = ${pageBean.total};
    M.pageSize = ${pageBean.pageSize};

    layui.use(['element', 'laypage'], function(){
        var element = layui.element; //加载进度条
        var laypage = layui.laypage;

        //执行一个laypage实例
        laypage.render({
            elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: M.count //数据总数，从服务端得到
            ,limit:M.pageSize
            ,curr:M.curr
            ,jump: function(obj, first){
                //首次不执行
                if(!first){
                    M.curr = obj.curr;
                    location.href="project?currentPage="+obj.curr + "&caption=${caption!''}";
                }
            }
        });
        element.render();
    });
</script>
</html>