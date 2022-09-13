<!doctype html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>回馈管理</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="manifest" href="#">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
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


    <!--page-title-area area-->
    <!--project-area start-->
    <section class="project-image-area grey-bg pt-130 pb-100" style="background-image:url(/home/images/shape/09.png);">
        <div class="container">
            <div class="row no-gutters">
                <div class="col-xl-7">
                    <div class="project-img mb-30 wow fadeInUp2 animated" data-wow-delay='.1s'>
                        <#if project.headPic??>
                            <#if project.headPic?length gt 0>
                                <img src="/photo/view?filename=${project.headPic}" alt="" height="537"/>
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
                        <div class="projects__content" style="height: 537px">
                            <a class="new-tag" style="color: white">${project.projectCategory.name}</a>
                            <h3><a>${project.caption}</a></h3>
                            <div class="projects__manager d-sm-flex align-items-center mb-40">
                                <div class="manager-img mr-20">
                                    <#if project.homeUser.headPic??>
                                        <#if project.homeUser.headPic?length gt 0>
                                            <img style="height: 55px; width: 55px;" class="layui-nav-img" src="/photo/view?filename=${project.homeUser.headPic}" alt="">
                                        <#else>
                                            <img style="height: 55px; width: 55px;" class="layui-nav-img" src="/admin/images/default-head.jpg" alt="默认图片">
                                        </#if>
                                    <#else>
                                        <img style="height: 55px; width: 55px;" class="layui-nav-img" src="/admin/images/default-head.jpg" alt="默认图片">
                                    </#if>
                                </div>
                                <div class="name">
                                    <h5>${project.homeUser.name}</h5>
                                    <address>
                                        <a>
                                            <#if project.homeUser.sex == 0>
                                                未知
                                            <#elseif project.homeUser.sex ==1>
                                                男
                                            <#else>
                                                女
                                            </#if>
                                        </a>
                                    </address>
                                </div>
                            </div>
                            <div class="skill mb-20">
                                <p class="skill-para">目标金额 <span>￥ ${project.targetPrice}</span></p>
                                <div class="progress">
                                    <div class="layui-progress" lay-showPercent="yes">
                                        <div class="layui-progress-bar" lay-percent="${project.progress}%"></div>
                                    </div>
                                </div>
                            </div>
                            <p>温馨提示:您的支持，犹如爱已经起航，新阳光承诺为您撑起抵达彼岸的风帆，让这份爱快速前行，并且行的更远。</p>
                            <ul class="cart-list d-sm-flex align-items-center">
                                <li><a class="theme_btn theme_btn_bg" href="/home/project/detail?id=${project.id}"
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
                            <span class="span-margin">回馈管理</span>
                        </div>
                    </blockquote>
                    <div class="box-container layui-form">
                        <div class="layui-row">
                                <table class="layui-table">
                                    <tr>
                                        <th>项目标题</th>
                                        <th>回馈标题</th>
                                        <th>接收人姓名</th>
                                        <th>接收人电话</th>
                                        <th>接收地址</th>
                                        <th>预计发放时间</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                    <#if pageBean.content?size gt 0>
                                        <#list pageBean.content as feed>
                                            <tr>
                                                <td>
                                                    <#if feed.feedBack.project.caption?length gt 4>
                                                        ${feed.feedBack.project.caption?substring(0,4)}...
                                                    <#else>
                                                        ${feed.feedBack.project.caption}
                                                    </#if>
                                                </td>
                                                <td>
                                                    <#if feed.feedBack.caption?length gt 4>
                                                        ${feed.feedBack.caption?substring(0,4)}...
                                                    <#else>
                                                            ${feed.feedBack.caption}
                                                    </#if>
                                                </td>
                                                <td>${feed.name}</td>
                                                <td>${feed.mobile}</td>
                                                <td>${feed.address}</td>
                                                <td>${feed.feedBack.grantDate?string("yyyy-MM-dd")}</td>
                                                <td>
                                                    <#if feed.status == 0>
                                                        <font style="color: orange">未发放</font>
                                                    <#elseif feed.status = 1>
                                                        <font style="color: green">已发放</font>
                                                    <#else>
                                                        <font style="color: red">已接收</font>
                                                    </#if>
                                                </td>
                                                <td>
                                                    <#if feed.status == 0>
                                                        <button class="layui-btn layui-btn-primary layui-btn-sm" type="button"
                                                                onclick="giveOut('${feed.id}')">
                                                            发放
                                                        </button>
                                                    <#else>
                                                        <button class="layui-btn layui-btn-primary layui-btn-sm layui-disabled" disabled type="button">
                                                            发放
                                                        </button>
                                                    </#if>

                                                </td>
                                            </tr>
                                        </#list>
                                    <#else>
                                        <tr>
                                            <td colspan="20">暂无数据</td>
                                        </tr>
                                    </#if>
                                </table>
                                <div id="feedPage">

                                </div>
                            </div>
                        </div>
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
    M.pageSize = ${pageBean.pageSize};//每页显示数量
    M.curr = ${pageBean.currentPage};//当前页码
    M.count = ${pageBean.total};//总数量


    layui.use(['form', 'laypage','element'],function()
    {
        var form = layui.form;
        var laypage = layui.laypage;
        var element = layui.element;

        element.render();
        form.render();

        laypage.render({
            elem: 'feedPage'
            ,count: M.count
            ,limit:M.pageSize
            ,curr:M.curr
            ,jump: function(obj, first){
                //首次不执行
                if(!first){
                    M.curr = obj.curr;
                    location.href="list?curr="+obj.curr+"&projectId=${project.id}";
                }
            }
        });
    });


    function giveOut(id){
        $.ajax({
            type: "POST",
            url: 'giveOut',
            data: {id:id},
            dataType: 'json',
            cache: false,
            success: function (data) {
                if (data.code == 0) {
                    successMsg("发放成功");
                    location.href = "list?projectId=${project.id}";
                }
                else
                {
                    errorMsg(data.msg);
                }
            },
            error: function (data) {
                errorMsg('网络错误!');
            }
        })
    }
</script>
</html>