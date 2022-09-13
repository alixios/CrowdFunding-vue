<!doctype html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>关于我们</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <#include "../common/head-link.ftl"/>
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
                <div class="col-xl-6 offset-xl-3">
                    <div class="page-title-wrapper text-center">
                        <h1 class="page-title wow fadeInUp2 animated" data-wow-delay='.1s'>关于我们</h1>
                        <div class="breadcrumb">
                            <ul class="breadcrumb-list wow fadeInUp2 animated" data-wow-delay='.3s'>
                                <li><a href="/home/index/index">首页 <i class="far fa-chevron-right"></i></a></li>
                                <li><a class="active" href="/home/about_us/index">关于我们</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--page-title-area area-->
    <!--about-us-area start-->
    <section class="about-us-area-03 pt-130 pb-85">
        <div class="container">
            <div class="row">
                <div class="col-xl-5 col-lg-6 col-md-12">
                    <div class="about-img mb-50">
                        <div class="about-img__thumb wow fadeInUp2 animated" data-wow-delay='.1s'>
                            <img src="/home/images/about/03.jpg" alt="">
                        </div>
                        <div class="about-img__style-text wow fadeInUp2 animated" data-wow-delay='.3s'>
                            <img src="/home/images/about/02.png" alt="">
                        </div>
                        <div class="about-img__style-shape wow fadeInUp2 animated" data-wow-delay='.4s'>
                            <img src="/home/images/shape/07.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-xl-7 col-lg-6 col-md-12">
                    <div class="about__wrapper about__wrap__03 pl-65 wow fadeInUp2 animated" data-wow-delay='.3s'>
                        <div class="section-title text-left mb-35">
                            <h6 class="left-line pl-75">关于我们</h6>
                            <h2>我们是有25+年的经验的<br>
                            <span>机构</span></h2>
                        </div>
                        <div class="partner-list d-sm-flex align-items-center mb-30">
                            <div class="total-client">
                                <h4><span>${homeUserCount} </span> 我们的合作伙伴</h4>
                            </div>
                            <div class="joint-btn ml-15">
                                <a href="/home/homeUser/register" class="theme_btn theme_btn2 ">加入我们<i class="far fa-arrow-right"></i></a>
                            </div>
                        </div>
                        <p>
                            - 云养计划，持续支持你喜爱的创作者。<br>
                            - 产品众筹，把新奇的创意变成现实。<br>
                            - 参与改变，每一次支持都在改变世界。<br>
                            - 博客动态，有趣的灵魂等你来发现。<br>
                        </p>
                        <a href="/home/contact/index" class="theme_btn theme_btn_bg mt-25">联系我们 <i class="far fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--about-us-area end-->
    <!--counter-area start-->
    <section class="counter-area heding-bg pt-130 pb-95" style="background-image: url(/home/images/bg/03.png);">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                    <div class="counetrs mb-30 wow fadeInUp2 animated" data-wow-delay='.1s'>
                        <div class="counetrs__icon mb-30"><i class="far fa-gem"></i></div>
                        <h1><span class="counter">${statusCount}</span></h1>
                        <p>已结束项目</p>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                    <div class="counetrs mb-30 wow fadeInUp2 animated" data-wow-delay='.2s'>
                        <div class="counetrs__icon mb-30"><i class="fal fa-gift"></i></div>
                        <h1><span class="counter">${priceCount}</span></h1>
                        <p>募集总金额</p>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                    <div class="counetrs mb-30 wow fadeInUp2 animated" data-wow-delay='.3s'>
                        <div class="counetrs__icon mb-30"><i class="far fa-trophy-alt"></i></div>
                        <h1><span class="counter">${typeStatusCount}</span></h1>
                        <p>募款中的公益项目</p>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                    <div class="counetrs mb-30 wow fadeInUp2 animated" data-wow-delay='.4s'>
                        <div class="counetrs__icon mb-30"><i class="far fa-users"></i></div>
                        <h1><span class="counter">${homeUserCount}</span></h1>
                        <p>注册人数</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--counter-area end-->
    <!--donation-area start-->
    <section class="donation-area pt-125 pb-100" style="background-image:url(/home/images/events/01.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 offset-xl-2">
                    <div class="donation-wrapper">
                        <div class="section-title white-title text-center mb-40 wow fadeInUp2 animated" data-wow-delay='.2s'>
                            <h6 class="left-line pl-75 pr-75">前往捐赠</h6>
                            <h2>伸出你的手<br>
                                <span>到正确的地方</span></h2>
                        </div>
                        <ul class="btn-list text-center mb-30 wow fadeInUp2 animated" data-wow-delay='.3s'>
                            <li><a class="theme_btn theme_btn_bg" href="/home/news/list" data-animation="fadeInLeft" data-delay=".7s">
                                    了解更多 <i class="far fa-arrow-right"></i></a>
                            </li>
                            <li><a class="theme_btn theme-border-btn" href="/home/project/project" data-animation="fadeInLeft" data-delay=".7s">
                                    前往捐赠 <i class="far fa-arrow-right"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--donation-area end-->
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
                                                    <img src="/photo/view?filename=${contact.homeUser.headPic}" style="height: 120px;width: 120px" alt="">
                                                <#else>
                                                    <img src="/home/images/testimonial/01.png" style="height: 120px;width: 120px" alt="">
                                                </#if>
                                            <#else>
                                                <img src="/home/images/testimonial/01.png" style="height: 120px;width: 120px" alt="">
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

    <!--blog-area start-->
    <section class="blog-area pt-130 pb-100">
        <div class="container">
            <div class="row no-gutters">
                <div class="col-xl-4 col-lg-8 col-md-12">
                    <div class="blog-wrapper mb-30">
                        <div class="section-title text-left mb-70 wow fadeInUp2 animated" data-wow-delay='.1s'>
                            <h6 class="left-line pl-75 pr-75">最近的新闻</h6>
                            <h2>最近更新<br>
                                <span>新闻</span></h2>
                            <p>查看新闻</p>
                            <a href="/home/news/list" class="theme_btn theme_btn2 theme_btn_bg_02">查看所有新闻 <i class="far fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
                <#if newsList?size gt 0>
                    <#list newsList as news>
                        <div class="col-xl-4 col-lg-6 col-md-6 wow fadeInUp2 animated" data-wow-delay='.3s'>
                            <div class="blogs mb-30 mr-15">
                                <div class="blogs__thumb pos-rel mb-45">
                                    <div class="blogs__thumb--img">
                                        <#if news.picture??>
                                            <#if news.picture?length gt 0>
                                                <img src="/photo/view?filename=${news.picture}" style="height: 250px;width: 370px" alt="">
                                            <#else>
                                                <img src="/home/images/testimonial/01.png" style="height: 250px;width: 370px" alt="">
                                            </#if>
                                        <#else>
                                            <img src="/home/images/testimonial/01.png" style="height: 250px;width: 370px" alt="">
                                        </#if>
                                    </div>
                                    <a class="blog-tag" href="/home/news/detail?id=${news.id}">${news.newsType.name}</a>
                                </div>
                                <div class="blogs__content">
                                    <div class="blogs__content--meta mb-15">
                                        <span><i class="far fa-calendar-alt"></i>${news.createTime?string("yyyy-MM-dd")}</span>
                                        <span><i class="far fa-comment"></i>评论数量(${news.comments})</span>
                                    </div>
                                    <h4 class="mb-20"><a href="/home/news/detail?id=${news.id}">
                                            <#if news.caption?length gt 10>
                                                ${news.caption?substring(0,10)}...
                                            <#else>
                                                ${news.caption}
                                            </#if>
                                        </a></h4>
                                    <ul class="project-manager">
                                        <li><a href="/home/news/detail?id=${news.id}">
                                                <#if news.homeUser.headPic??>
                                                    <#if news.homeUser.headPic?length gt 0>
                                                        <img src="/photo/view?filename=${news.homeUser.headPic}" style="width: 35px;height: 35px" alt="">
                                                    <#else>
                                                        <img src="/home/images/blog/03.png" style="width: 35px;height: 35px" alt="">
                                                    </#if>
                                                <#else>
                                                    <img src="/home/images/blog/03.png" style="width: 35px;height: 35px" alt="">
                                                </#if>
                                                <span>${news.homeUser.name}</span></a></li>
                                        <li>
                                            <a class="more_btn_02" href="/home/news/detail?id=${news.id}">查看详情 <i class="far fa-arrow-right"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </#list>
                </#if>

            </div>
        </div>
    </section>
    <!--blog-area end-->
</main>
<#include "../common/foot.ftl"/>
<#include "../common/foot-js.ftl"/>
</body>

</html>
