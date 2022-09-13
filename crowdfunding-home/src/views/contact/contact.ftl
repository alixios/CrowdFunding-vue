<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>联系我们</title>
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
    <section class="page-title-area" style="background-image:url(/home/images/goal/06.jpg);">
        <div class="right-border-shape">
            <img src="/home/images/shape/02.png" alt="">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xl-10 offset-xl-1">
                    <div class="page-title-wrapper text-center">
                        <h1 class="page-title wow fadeInUp2 animated" data-wow-delay='.1s'>联系我们</h1>
                        <div class="breadcrumb">
                            <ul class="breadcrumb-list wow fadeInUp2 animated" data-wow-delay='.3s'>
                                <li><a href="/home/index/index">首页 <i class="far fa-chevron-right"></i></a></li>
                                <li><a class="active">联系我们</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--contact-box-area start-->
    <section class="contact-box-area pb-80 pt-125">
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
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                    <div class="contact-box d-lg-flex mb-50 wow fadeInUp2 animated" data-wow-delay='.1s'>
                        <div class="contact-box__icon">
                            <i class="far fa-map-marker-alt"></i>
                        </div>
                        <div class="contact-box__content">
                            <h4>地点:上海市浦东新区上海猿礼科技</h4>
                            <h5>上海市浦东新区上海猿礼科技</h5>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                    <div class="contact-box d-lg-flex mb-50 wow fadeInUp2 animated" data-wow-delay='.3s'>
                        <div class="contact-box__icon">
                            <i class="fal fa-envelope"></i>
                        </div>
                        <div class="contact-box__content">
                            <h4>Email</h4>
                            <h5>115432031@qq.com</h5>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                    <div class="contact-box d-lg-flex mb-50 wow fadeInUp2 animated" data-wow-delay='.5s'>
                        <div class="contact-box__icon">
                            <i class="fal fa-phone"></i>
                        </div>
                        <div class="contact-box__content">
                            <h4>Phone</h4>
                            <h5>+012 (345) 678 99</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--contact-area start-->
    <section class="contact-details-area pb-120 wow fadeInUp2 animated" data-wow-delay='.3s'>
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="post-form-area contact-form pt-125">
                        <div class="row">
                            <form id="contact-form"  class="row">
                            <div class="col-xl-6 col-lg-6 col-md-6">
                                <div class="input-box">
                                    <h5>你的全名</h5>
                                    <div class="input-text mb-35">
                                        <input type="text" class="form-control required" id="name" name="name" placeholder="请输入你的全名" tips="请输入你的全名">
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6">
                                <div class="input-box mb-35">
                                    <h5>邮箱地址</h5>
                                    <div class="input-text input-mail">
                                        <input type="text" class="form-control required" name="emails" id="emails" placeholder="请输入你的邮箱地址" tips="请输入你的邮箱地址">
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6">
                                <div class="input-box mb-35">
                                    <h5>电话号码</h5>
                                    <div class="input-text input-phone">
                                        <input type="text" class="form-control required" id="phone" name="phone" placeholder="请输入电话号码" tips="请输入电话号码">
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6">
                                <div class="input-box mb-35">
                                    <h5>想问话题</h5>
                                    <div class="input-text input-sub">
                                        <input type="text" id="subject" name="subject" class="form-control required" placeholder="请输入你想问的话题" tips="请输入你想问的话题">
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-12">
                                <div class="input-box mb-35">
                                    <h5>留言</h5>
                                    <div class="input-text input-message">
                                        <textarea name="leavingMessage" id="leavingMessage" cols="30" rows="10" placeholder=请输入留言"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-6">
                                <div class="msg-btn text-md-center">
                                    <#if ylrc_home_user??>
                                        <a class="theme_btn theme_btn_bg" href="javascript:void(0);" id="contact-submit">提交 <i
                                                class="far fa-arrow-right"></i></a>
                                        <#else>
                                        <a class="theme_btn theme_btn_bg" href="/home/homeUser/login" >请先登录 <i
                                                class="far fa-arrow-right"></i></a>
                                    </#if>

                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--contact-area end-->
    <!--map-area start-->
    <section class="contact-map-area">
        <div class="container-fluid pl-0 pr-0">
            <div class="row no-gutters">
                <div class="col-xl-12">
                    <div class="map-area map-02  wow fadeInUp2 animated" data-wow-delay='.1s'>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--map-area end-->
    <!--cta-area end-->
</main>
    <#include "../common/foot.ftl"/>
    <#include "../common/foot-js.ftl"/>
<script type="text/javascript" src="/home/layui/layui.all.js"></script>
<script type="text/javascript" src="/home/layui/layui.js"></script>
<script>
    $("#contact-submit").click(function(){
        if(!checkHomeForm("contact-form")){
            return;
        }
        var emailPattern = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        if(!emailPattern.test($("#emails").val())){
            layer.msg("请输入正确的电子邮箱");
            return;
        }
        var phonePattern = /^1[3|4|5|8][0-9]\d{4,8}$/;
        if(!phonePattern.test($("#phone").val())){
            layer.msg("请输入正确的手机号");
            return;
        }
        if($("#leavingMessage").val()==""){
            layer.msg("请输入留言");
            return;
        }
        var data=$("#contact-form").serialize();
        ajaxRequest('add','POST',data,function(result){
            if(result.code==0){
                location.href="/home/index/index";
                return;
            }else{
                layer.msg(result.msg);
            }
        })
    });
</script>
</body>

</html>