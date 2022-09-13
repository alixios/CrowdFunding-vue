<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>常见问题汇总</title>
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
    </style>
</head>
<body>
    <#include "../common/top-menu.ftl"/>
<main>
    <!--page-title-area start-->
    <section class="page-title-area" style="background-image:url(/home/images/faq/faq.jpg);">
        <div class="right-border-shape">
            <img src="/home/images/shape/02.png" alt="">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xl-10 offset-xl-1">
                    <div class="page-title-wrapper text-center">
                        <h1 class="page-title wow fadeInUp2 animated" data-wow-delay='.1s'>常见问答</h1>
                        <div class="breadcrumb">
                            <ul class="breadcrumb-list wow fadeInUp2 animated" data-wow-delay='.3s'>
                                <li><a href="/home/index/index">首页<i class="far fa-chevron-right"></i></a></li>
                                <li><a class="active">常见问答</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--page-title-area area-->
    <!--page-title-area area-->
    <section class="faq-area-02 grey-bg pt-130 pb-100">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 col-lg-8">
                    <div class="faq-content mb-30">
                        <div id="accordion">
                            <#list problemList as problem>
                                <div class="card card-bg card-02 mb-15 wow fadeInUp2 animated" data-wow-delay='.1s' style="background-image:url(/home/images/bg/06.jpg)">
                                    <div class="card-header" id="heading${problem_index}">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapse${problem_index}"aria-expanded="false" aria-controls="collapseOne">
                                                ${problem.name}
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapse${problem_index}" class="collapse" aria-labelledby="heading${problem_index}" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>${problem.answer}</p>
                                        </div>
                                    </div>
                                </div>
                            </#list>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-12">
                    <div class="faq-right">
                        <div class="widget white-bg mb-40 wow fadeInUp2 animated" data-wow-delay='.1s'>
                            <div class="widget-contact-box pos-rel">
                                <h4>联系我们</h4>
                                <p>上海市浦东新区上海猿礼科技</p>
                                <ul class="fot-list address-list mb-20">
                                    <li><a href="https://www.yuanlrc.com"><i class="far fa-map-marker-alt"></i> 上海市浦东新区上海猿礼科技</a></li>
                                    <li><a href="https://www.yuanlrc.com"><i class="far fa-envelope"></i> 115432031@qq.com</a></li>
                                    <li><a href="https://www.yuanlrc.com"><i class="far fa-phone-volume"></i> 888 (0123) 456 79</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--feature-project-area start-->
    <section class="feature-project-area pt-125 pb-100">
        <div class="container">
            <div class="row">
                <div class="col-xl-10 offset-xl-1">
                    <div class="section-title text-center mb-85 wow fadeInUp2 animated" data-wow-delay='.1s'>
                        <h6 class="left-line pl-75 pr-75">特色项目</h6>
                        <h2>我们 <br>
                            <span>承担了解决项目的任务</span></h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <#list projectList as project>
                    <div class="col-xl-6 col-lg-6 col-md-12">
                        <div class="projects grey-bg d-sm-flex mb-30 wow fadeInUp2 animated" data-wow-delay='.1s'>
                            <div class="projects__thumb">
                                <img src="/photo/view?filename=${project.headPic}" alt=""  width="251px" height="268px">
                            </div>
                            <div class="projects__content">
                                <h4><a href="/home/project/detail?id=${project.id}">${project.caption}</a></h4>
                                <div class="skill mb-30">
                                    <p>募集<span>$${project.targetPrice}</span></p>
                                    <div class="progress">
                                        <div class="progress-bar" style="width: ${project.progress}%" role="progressbar" aria-valuenow="85"
                                             aria-valuemin="0" aria-valuemax="85">
                                            <h5>${project.progress}%</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="projects__content--manager">
                                    <ul class="project-manager">
                                        <li><a>
                                            <#if project.homeUser.headPic??>
                                                <#if project.homeUser.headPic?length gt 0>
                                                    <img src="/photo/view?filename=${project.homeUser.headPic}" alt="" width="35px" height="35px">
                                                <#else>
                                                    <img src="/admin/images/default-head.jpg" alt="默认头像" width="35px" height="35px">
                                                </#if>
                                            <#else>
                                                <img src="/admin/images/default-head.jpg" alt="默认头像" width="35px" height="35px">
                                            </#if>
                                            <span>${project.homeUser.name}</span></a></li>
                                        <li>
                                            <p class="time"><i class="far fa-clock"></i> ${project.end?string("yyyy-MM-dd")}</p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </#list>
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

</script>
</body>

</html>