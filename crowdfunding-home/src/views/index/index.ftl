<!doctype html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>首页</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <#include "../common/head-link.ftl"/>
    <link rel="stylesheet" href="/home/layui/css/layui.css">
    <script src="/home/layui/layui.all.js" type="text/javascript"></script>
    <style>
        .progress
        {
            display: block;
        }

        h4{
            font-size: 20px;
        }
    </style>
</head>

<body>

    <#include "../common/top-menu.ftl"/>

    <main>
        <!--slider-area start-->
        <div class="slider-area slider-area-02 pos-rel">
            <div class="right-border-shape">
                <img src="/home/images/shape/02.png" alt="">
            </div>
            <div class="slider-active">
                <div class="single-slider slider-height-02 pos-rel d-flex align-items-center"
                    style="background-image: url(/home/images/slider/slider1.jpg);">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-8">
                                <div class="slider__content slider__content__02 text-left">
                                    <h1 class="main-title mb-25" data-animation="fadeInUp2" data-delay=".2s">
                                        我们准备推广你的众筹项目
                                    </h1>
                                    <h4>感谢你来到众筹网</h4>
                                    <ul class="btn-list btn-list-02">
                                        <li><a class="theme_btn theme_btn2 theme_btn_bg_02" href="/home/news/list"
                                                data-animation="fadeInLeft" data-delay=".5s">探索更多 <i
                                                    class="far fa-arrow-right"></i></a>
                                        </li>
                                        <li><a class="theme_btn theme-border-btn theme_btn_bg_02" href="/home/project/project"
                                                data-animation="fadeInLeft" data-delay=".5s">捐赠更多<i
                                                    class="far fa-arrow-right"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="single-slider slider-height-02 pos-rel d-flex align-items-center"
                    style="background-image: url(/home/images/slider/slider2.jpg);">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-8">
                                <div class="slider__content slider__content__02 text-left">
                                    <h1 class="main-title mb-25" data-animation="fadeInUp2" data-delay=".2s">
                                        我们准备推广你的众筹项目
                                    </h1>
                                    <h4>感谢你来到众筹网</h4>
                                    <ul class="btn-list">
                                        <li><a class="theme_btn theme_btn2 theme_btn_bg_02" href="/home/news/index"
                                                data-animation="fadeInLeft" data-delay=".7s">探索更多 <i
                                                    class="far fa-arrow-right"></i></a>
                                        </li>
                                        <li><a class="theme_btn theme-border-btn theme_btn_bg_02" href="/home/project/project"
                                                data-animation="fadeInLeft" data-delay=".7s">捐赠更多 <i
                                                    class="far fa-arrow-right"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--slider-area end-->
        <!--about-us-area start-->
        <section class="about-us-area about-area-02 pt-130 pb-100">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-6 col-md-12">
                        <div class="about-img mb-30 wow fadeInUp2 animated" data-wow-delay='.1s'>
                            <div class="about-img__thumb">
                                <img src="/home/images/about/02.jpg" alt="">
                            </div>
                            <div class="about-img__style-text">
                                <img src="/home/images/about/02.png" alt="">
                            </div>
                            <div class="about-img__style-dot d-none d-lg-inline-block">
                                <img src="/home/images/shape/03.png" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-7 col-lg-6 col-md-12">
                        <div class="about__wrapper about-wrapper-02 pl-70">
                            <div class="section-title text-left mb-50 wow fadeInUp2 animated" data-wow-delay='.1s'>
                                <h6 class="left-line pl-75">我们是谁</h6>
                                <h2>给你的手<br>
                                    <span>在正确的地方</span></h2>
                                <p>
                                    - 云养计划，持续支持你喜爱的创作者。<br>
                                    - 产品众筹，把新奇的创意变成现实。<br>
                                    - 参与改变，每一次支持都在改变世界。<br>
                                    - 博客动态，有趣的灵魂等你来发现。<br>
                                </p>
                            </div>
                            <div class="inner-counters">
                                <div class="row">
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                        <div class="counters d-flex mb-10 wow fadeInUp2 animated" data-wow-delay='.1s'>
                                            <div class="counters__icon mb-30"><i class="far fa-box-usd"></i></div>
                                            <div class="counters__content">
                                                <h3><span class="counter">${homeUserCount}</span></h3>
                                                <p>注册人数</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                        <div class="counters d-flex mb-20 pl-35 wow fadeInUp2 animated" data-wow-delay='.1s'>
                                            <div class="counters__icon mb-30"><i class="far fa-business-time"></i></div>
                                            <div class="counters__content">
                                                <h3><span class="counter">${projectPrice}</span></h3>
                                                <p>众筹金额</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a class="theme_btn theme_btn_bg" href="/home/about_us/index"
                                                data-animation="fadeInUp2" data-delay=".1s">探索更多 <i
                                                    class="far fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--about-us-area end-->
        <!--feature-project-area start-->
        <section class="feature-project-03 grey-bg pt-125 pb-130">
            <div class="container custom-container-4">
                <div class="row">
                    <div class="col-xl-10 offset-xl-1">
                        <div class="section-title text-center mb-85 wow fadeInUp2 animated" data-wow-delay='.1s'>
                            <h6 class="left-line pl-75 pr-75">最新的项目</h6>
                            <h2>我们的 <br><span>最新众筹项目</span></h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <#list projects as item>
                        <div class="col-xl-3 col-lg-6 col-md-6">
                            <div class="projects projects__03 pos-rel mb-30 wow fadeInUp2 animated" data-wow-delay='.1s'>
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
                                <div class="projects__content white-bg">
                                    <h4>
                                        <a href="/home/project/detail?id=${item.id}">
                                          <#if item.caption?length gt 10>
                                              ${item.caption?substring(0,10)} ...
                                          <#else>
                                              ${item.caption}
                                          </#if>
                                        </a>
                                    </h4>
                                    <div class="skill mb-30">
                                        <p>目标金额 <span>￥ ${item.targetPrice}</span></p>
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
                                                            <img src="/photo/view?filename=${item.homeUser.headPic}" alt="" width="38" height="38">
                                                        <#else>
                                                            <img src="/home/images/project/01.png" alt="">
                                                        </#if>
                                                    <#else>
                                                          <img src="/home/images/project/01.png" alt="">
                                                    </#if>
                                                <span>${item.homeUser.name}</span></a></li>
                                            <li>
                                                <p class="time">
                                                    <i class="far fa-clock"></i>
                                                    ${item.start?string("yyyy-MM-dd")}
                                                </p>
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
        <!--feature-project-area end-->

        <!--faq-area start-->
        <section class="faq-area heding-bg pos-rel pt-130 pb-60">
            <div class="container">
                <div class="row">
                    <div class="col-xl-6 col-lg-6">
                        <div class="faq-wrapper mb-30">
                            <div class="section-title white-title text-left mb-85 wow fadeInUp2 animated" data-wow-delay='.1s'>
                                <h6 class="left-line pl-75 pr-75">常见问题</h6>
                                <h2>经常问的问题</h2>
                                <p>你遇到的问题可能在这里解决哦，快来看看常见问题汇总吧，说不定有你想要的答案 --常见问题汇总</p>
                                <a class="theme_btn theme_btn_bg" href="/home/common_problem/index">查看更多 <i
                                        class="far fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <div class="faq-content mb-30 wow fadeInUp2 animated" data-wow-delay='.1s'>
                            <div id="accordion">
                                <#list commonProblems as common>
                                    <div class="card card-bg mb-15" style="background-image:url(/home/images/bg/06.jpg)">
                                        <div class="card-header" id="heading${common.id}">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-toggle="collapse"
                                                        data-target="#collapse${common.id}" aria-expanded="false" aria-controls="collapse${common.id}">
                                                    ${common.name}
                                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapse${common.id}" class="collapse" aria-labelledby="heading${common.id}" data-parent="#accordion">
                                            <div class="card-body">
                                                <p>
                                                    ${common.answer}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </#list>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--faq-area end-->


        <!--testimonial-area start-->
        <section class="testimonial-area theme-bg2 pt-125 pb-130" style="background-image:url(/home/images/bg/04.png);">
            <div class="container">
                <div class="row">
                    <div class="col-xl-10 offset-xl-1">
                        <div class="section-title white-title text-center mb-70 wow fadeInUp2 animated" data-wow-delay='.2s'>
                            <h6 class="left-line pl-75 pr-75">客户反馈</h6>
                            <h2>客户<br>
                                <span>给我们的建议</span></h2>
                        </div>
                    </div>
                </div>
                <div class="testimonial-wrapper">
                    <div class="row testimonial-active">
                    <#if contactList?size gt 0>
                        <#list contactList as contact>
                            <div class="col-xl-6">
                                <div class="testimonial-item wow fadeInUp2 animated" data-wow-delay='.3s' style="width: 440px;box-sizing: content-box;">
                                    <div class="author-img fix pb-20">
                                        <div class="author-avatar f-right">
                                            <#if contact.homeUser.headPic??>
                                                <#if contact.homeUser.headPic?length gt 0>
                                                <#else>
                                                    <img src="/home/images/home/images/testimonial/01.png" style="height: 120px;width: 120px" alt="">
                                                </#if>
                                            <#else>
                                                <img src="/home/images/home/images/testimonial/01.png" style="height: 120px;width: 120px" alt="">
                                            </#if>
                                        </div>
                                    </div>
                                    <div class="author-content mb-15">
                                        <h5 class="left-line pl-40">${contact.homeUser.name}</h5>
                                    </div>
                                    <p class="semi-title mb-15" style="height: 140px">${contact.leavingMessage}</p>
                                </div>
                            </div>
                        </#list>
                    </#if>
                    </div>
                </div>
            </div>
        </section>
        <!--testimonial-area end-->
    </main>

    <#include "../common/foot.ftl"/>

    <#include "../common/foot-js.ftl"/>
</body>
<script>
    layui.use(['element', 'laypage'], function(){
        var element = layui.element; //加载进度条

        element.render();
    });
</script>
</html>