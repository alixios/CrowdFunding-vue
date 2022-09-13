
<!-- preloader -->
<div id="preloader">
    <div class="preloader">
        <span></span>
        <span></span>
    </div>
</div>
<!-- preloader end  -->
<!-- header-area start -->
<header id="top-menu">
    <div class="header-top-area  head-top-02 grey-bg pt-15 pb-15 d-none d-lg-block">
        <div class="container custom-container-03">
            <div class="row align-items-center">
                <div class="col-xl-7 col-lg-8">
                    <ul class="login-area">
                        <li><span>欢迎来到最受欢迎的众筹机构。</span></li>
                        <#--<li><a class="sign_btn" href="/home/homeUser/login"><i class="far fa-lock-alt"></i> 登录</a></li>-->
                    </ul>
                </div>
                <div class="col-xl-5 col-lg-5 d-none d-xl-block">
                    <div class="top-cta text-right">
                        <span class="media-link"><i class="far fa-envelope"></i> support@gmail.com</span>
                        <span class="media-link" style="margin-right: 20px;"><i class="far fa-map-marker-alt"></i> 上海</span>
                        <span class="media-link">
                            <#if ylrc_home_user??>
                                <i class="far fa-user"></i>
                                <a href="/home/homeUser/index">${ylrc_home_user.name}<a>
                            </#if>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main-header-area main-head-02">
        <div class="container custom-container-03">
            <div class="row align-items-center justify-content-between">
                <div class="col-xl-2 col-lg-2 col-md-6 col-6">
                    <div class="logo">
                        <a class="logo-img" href="/home/index/index"><img src="/home/images/logo/header_logo_two.png" alt=""></a>
                    </div>
                </div>
                <div class="col-xl-7 col-lg-9 d-none d-lg-block text-lg-center text-xl-right">
                    <div class="main-menu main-menu-02 d-none d-lg-block">
                        <nav>
                            <ul class="sf-menu">
                                <li><a class="active" href="/home/index/index">首页 </a>
                                </li>
                                <li><a href="/home/about_us/index">关于我们</a></li>
                                <li>
                                    <a href="/home/project/project">项目列表
                                        <#if ylrc_home_user??>
                                            <i class="far fa-chevron-down"></i>
                                        </#if>
                                    </a>
                                    <#if ylrc_home_user??>
                                        <ul class="submenu">
                                            <li><a href="/home/project/add">发布项目</a></li>
                                            <li><a href="/home/project/index">我的添加</a></li>
                                            <li><a href="/home/project/published">已在募捐</a></li>
                                        </ul>
                                    </#if>
                                </li>
                                <li>
                                    <a href="/home/news/list">
                                        新闻列表
                                        <i class="far fa-chevron-down"></i>
                                    </a>
                                    <ul class="submenu">
                                        <#if ylrc_home_user??>
                                            <li><a href="/home/news/index">发布新闻</a></li>
                                        </#if>
                                        <li><a href="/home/news/list">新闻列表</a></li>
                                    </ul>
                                </li>
                                <li><a href="/home/common_problem/index">常见问答</a>
                                </li>
                                <li><a href="/home/contact/index">联系我们</a></li>
                                <#if ylrc_home_user??>
                                    <li><a href="/home/homeUser/index">个人中心</a></li>
                                </#if>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-1 col-md-6 col-6 text-right d-flex align-items-center justify-content-end">
                    <div class="quote-btn mr-10">
                        <#if ylrc_home_user??>
                            <a href="/home/homeUser/logout" class="theme_btn theme_btn_bg">注销 <i class="far fa-arrow-right"></i></a>
                        <#else>
                            <a href="/home/homeUser/login" class="theme_btn theme_btn_bg">登录 <i class="far fa-arrow-right"></i></a>
                        </#if>
                    </div>
                    <div class="hamburger-menu">
                        <a href="javascript:void(0);">
                            <img src="/home/images/logo/bar-icon-01.png" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- header-area end -->

<!-- slide-bar start -->
<aside class="slide-bar">
    <div class="close-mobile-menu">
        <a href="javascript:void(0);"><i class="fas fa-times"></i></a>
    </div>

    <!-- offset-sidebar start -->
    <div class="offset-sidebar">
        <div class="offset-widget offset-logo mb-30">
            <a href="/home/index/index" style="color: white; font-size: 20px;">
                猿来入此
            </a>
        </div>
        <div class="offset-widget mb-40">
            <div class="info-widget">
                <h4 class="offset-title mb-20">关于我们</h4>
                <p class="mb-30">
                    但我必须向你解释，所有这些谴责快乐赞美痛苦的错误想法
                    生而会给你一个完整的交代体系和阐述实际的教导吗
                    伟大的探索
                </p>
                <a class="theme_btn theme_btn_bg" href="/home/contact/index">联系我们</a>
            </div>
        </div>
        <div class="offset-widget mb-30 pr-10">
            <div class="info-widget info-widget2">
                <h4 class="offset-title mb-20">联系方式</h4>
                <p> <i class="fal fa-address-book"></i> 上海</p>
                <p> <i class="fal fa-phone"></i> 888 (0123) 456 79 </p>
                <p> <i class="fal fa-envelope-open"></i> support@gmail.com </p>
            </div>
        </div>

    </div>

    <!-- side-mobile-menu start -->
    <nav class="side-mobile-menu">
        <ul id="mobile-menu-active">
            <li>
                <a href="/home/index/index">首页</a>
            </li>
            <li>
                <a href="/home/about_us/index">关于我们</a>
            </li>
            <li >
                <a style="color: white">众筹项目</a>
                <ul class="submenu">
                    <li><a href="/home/project/project">项目列表</a></li>
                    <#if ylrc_home_user??>
                        <li><a href="/home/project/add">发布项目</a></li>
                        <li><a href="/home/project/index">我的添加</a></li>
                        <li><a href="/home/project/published">已在募捐</a></li>
                    </#if>
                </ul>
            </li>
            <li >
                <a href="/home/news/list">新闻</a>
            </li>
            <li>
                <a href="/home/common_problem/index">常见问答</a>
            </li>
            <li>
                <a href="/home/contact/index">联系我们</a>
            </li>
            <li>
                <a href="/home/homeUser/index">个人中心</a>
            </li>

        </ul>
    </nav>
    <!-- side-mobile-menu end -->
</aside>
<div class="body-overlay"></div>
<!-- slide-bar end -->
    <!-- offset-sidebar end -->
<#if ylrc_auth != 1>
    <div class="top-nav" id="show-copyright">
        <div class="container fn-clear" align="center">
            <p style="color:red;font-size:16px;">
                本系统由<a href="https://www.yuanlrc.com/product/details.html?pid=413">【猿来入此】</a>发布，请认准官网获取，官网获取的正版源码提供免费更新升级！
                <a href="javascript:alert('请登录后台首页填写订单号进行验证，验证通过后刷新此页面，版权信息会自动消失！')" id="order-auth-btn">点此去版权</a>
                <a href="https://www.yuanlrc.com/">点此进入官网</a>
            </p>
        </div>
    </div>
</#if>