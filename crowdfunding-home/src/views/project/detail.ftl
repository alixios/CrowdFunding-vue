<!doctype html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>项目详情</title>
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

        label,a
        {
            color: black;
        }

        .nice-select
        {
            display: none;
        }

        .editor-img {
            width: 100%;
            height: auto;
            object-fit: cover;
            margin: 15px 0px;
        }

        #detail-content img
        {
            padding: 15px;
            max-width: 100%;
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
                            <h1 class="page-title wow fadeInUp2 animated" data-wow-delay='.1s'>项目详情</h1>
                            <div class="breadcrumb">
                                <ul class="breadcrumb-list wow fadeInUp2 animated" data-wow-delay='.3s'>
                                    <li><a href="/home/index/index">首页 <i class="far fa-chevron-right"></i></a></li>
                                    <li><a class="active">项目详情</a></li>
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
                             <#if item.headPic??>
                                <#if item.headPic?length gt 0>
                                     <img src="/photo/view?filename=${item.headPic}" alt="" style="height: 537px;"/>
                                <#else>
                                     <img src="/admin/images/default-head.jpg" alt="默认图片" style="height: 537px;"/>
                                </#if>
                             <#else>
                                 <img src="/admin/images/default-head.jpg" alt="默认图片" style="height: 537px;"/>
                             </#if>
                        </div>
                    </div >
                    <div class="col-xl-5  wow fadeInUp2 animated" data-wow-delay='.1s'>
                        <div class="projects project-cart white-bg mb-30">
                            <div class="projects__content" style="position: relative; height: 537px">
                                <#if ylrc_home_user??>
                                    <#if collect??>
                                        <a style="position: absolute; top: 50px; right: 40px; color: rgb(2, 182, 99); cursor: pointer" href="javascript:M.deleteCollect(${collect.id});">
                                            <i class="layui-icon layui-icon-heart-fill"></i>取消
                                        </a>
                                    <#else>
                                        <a style="position: absolute; top: 50px; right: 40px; color: black; cursor: pointer" href="javascript:M.addCollect();">
                                            <i class="layui-icon layui-icon-heart"></i>收藏
                                        </a>
                                    </#if>
                                </#if>
                                <a class="new-tag" style="color: white">${item.projectCategory.name}</a>
                                <h4><a>${item.caption}</a></h4>
                                    <div class="projects__manager d-sm-flex align-items-center mb-40">
                                        <div class="manager-img mr-20">
                                             <#if item.homeUser.headPic??>
                                                <#if item.homeUser.headPic?length gt 0>
                                                    <img style="height: 55px; width: 55px;" class="layui-nav-img" src="/photo/view?filename=${item.homeUser.headPic}" alt="">
                                                <#else>
                                                    <img style="height: 55px; width: 55px;" class="layui-nav-img" src="/admin/images/default-head.jpg" alt="默认图片">
                                                </#if>
                                             <#else>
                                                 <img style="height: 55px; width: 55px;" class="layui-nav-img" src="/admin/images/default-head.jpg" alt="默认图片">
                                             </#if>
                                        </div>
                                        <div class="name">
                                            <h5>${item.homeUser.name}</h5>
                                            <address>
                                                <a>
                                                    <#if item.homeUser.sex == 0>
                                                        未知
                                                    <#elseif item.homeUser.sex ==1>
                                                        男
                                                    <#else>
                                                        女
                                                    </#if>
                                                </a>
                                            </address>
                                        </div>
                                    </div>
                                <div class="skill mb-20">
                                    <p class="skill-para">目标金额 <span>￥ ${item.targetPrice}</span></p>
                                    <div class="progress">
                                        <div class="layui-progress" lay-showPercent="yes">
                                            <div class="layui-progress-bar" lay-percent="${item.progress}%"></div>
                                        </div>
                                    </div>
                                </div>
                                <p>温馨提示:您的支持，犹如爱已经起航，新阳光承诺为您撑起抵达彼岸的风帆，让这份爱快速前行，并且行的更远。</p>
                                <ul class="cart-list d-sm-flex align-items-center">
                                    <li>
                                        <form class="cart-plus-minus" action="form.php">
                                            <div class="plus-minus pos-rel">
                                                <input type="number" value="5" min="0" id="free-price">
                                                <div class="updown plus"><i class="far fa-chevron-left"></i></div>
                                                <div class="updown minus"><i class="far fa-chevron-right"></i></div>
                                            </div>
                                        </form>
                                    </li>
                                    <li><a class="theme_btn theme_btn_bg" href="<#if ylrc_home_user??>javascript:M.freeDonate();<#else>/home/homeUser/login</#if>"
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
        <section class="our-overview-area pos-rel  wow fadeInUp2 animated" data-wow-delay='.1s'>
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <ul class="nav nav-tabs nav-tabs-02" id="myTab" role="tablist">
                            <li class="nav-item">
                              <a class="nav-link theme_btn <#if tableIndex == 1>active</#if>" id="home-tab" data-toggle="tab" href="#home-01" role="tab" aria-controls="home-01" aria-selected="true">项目介绍</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link theme_btn <#if tableIndex == 2>active</#if>" id="profile-tab" data-toggle="tab" href="#profile-01" role="tab" aria-controls="profile-01" aria-selected="false">项目进展</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link theme_btn <#if tableIndex == 3>active</#if>" id="contact-tab" data-toggle="tab" href="#contact-02" role="tab" aria-controls="contact-02" aria-selected="false">捐赠列表</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link theme_btn <#if tableIndex == 4>active</#if>" id="contact2-tab" data-toggle="tab" href="#contact-03" role="tab" aria-controls="contact-03" aria-selected="false">评论</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade <#if tableIndex == 1>show active</#if>" id="home-01" role="tabpanel" aria-labelledby="home-tab">
                                <section class="project-image-text-area pt-35 pb-90 wow fadeInUp animated" data-wow-delay='.3s'>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-xl-8 col-lg-8 col-md-12">
                                                <div class="image-content-left">
                                                    <div class="left-content-box mb-45" id="detail-content">
                                                        ${item.content}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-lg-4 col-md-12">
                                                <#list item.feedBackList as feedback>
                                                    <div class="image-content-right">
                                                        <div class="widget grey-bg mb-30">
                                                            <div class="widget-rewards">
                                                                <h4>${feedback.caption}</h4>
                                                                <div class="reaward__thumb text-center mb-25">
                                                                    <#list feedback.images as img>
                                                                        <img src="${img}"/>
                                                                    </#list>
                                                                </div>
                                                                <h5>捐赠<span>￥ ${feedback.price}</span></h5>
                                                                <div class="mb-20">
                                                                    ${feedback.content}
                                                                </div>
                                                                <h5>${feedback.grantDate?string("yyyy年MM月dd日")}</h5>
                                                                <p>预计发放时间</p>
                                                                <ul class="rewards-list pt-15 mb-25">
                                                                    <li><i class="far fa-user-circle"></i> ${feedback.supportCount} 个支持者</li>
                                                                    <li><i class="far fa-trophy-alt"></i> 还剩 ${feedback.count - feedback.supportCount}份</li>
                                                                </ul>
                                                                <a class="theme_btn theme_btn_bg"
                                                                   data-animation="fadeInLeft" data-delay=".5s" style="color: white" href="<#if ylrc_home_user??>javascript:M.donate(${feedback.id});<#else>/home/homeUser/login</#if>">去支持
                                                                    <i class="far fa-arrow-right"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </#list>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                            <div class="tab-pane fade <#if tableIndex == 2>show active</#if>" id="profile-01" role="tabpanel" aria-labelledby="profile-tab">
                                <section class="project-image-text-area pb-90 pt-25">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12">
                                                <ul class="timeline mb-100">
                                                    <#list progresses as progress>
                                                        <li class="timeline-list wow fadeInUp2 animated" data-wow-delay='.1s' style="display: block">
                                                            <div class="update-content">
                                                                <div class="update-meta">
                                                                    <span><i class="far fa-calendar-alt"></i>${progress.createTime?string("yyyy-MM-dd")}</span>
                                                                </div>
                                                                <h4 class="left-line">${progress.caption}</h4>
                                                                <p>
                                                                    ${progress.info}<a href="/home/progress/detail?id=${progress.id}">[查看详情]</a>
                                                                </p>
                                                                <div class="update-share d-flex align-items-center">
                                                                    <span>图片:</span>
                                                                    <ul class="team__social update__social">
                                                                        <#if progress.images?size gt 0>
                                                                            <#list progress.images as img>
                                                                                <li>
                                                                                    <a href="" style="width: 100px; height: 100px">
                                                                                        <img src="${img}" style="width: 100%; height: 100%;"/>
                                                                                    </a>
                                                                                </li>
                                                                            </#list>
                                                                        <#else>
                                                                            <li>
                                                                                <a href="" style="width: auto;">
                                                                                    暂无图片
                                                                                </a>
                                                                            </li>
                                                                        </#if>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </#list>
                                                    <li class="timeline-list wow fadeInUp2 animated" data-wow-delay='.1s'>
                                                        <div class="update-content">
                                                            <div class="update-meta">
                                                                <span><i class="far fa-calendar-alt"></i>${item.createTime?string("yyyy-MM-dd")}</span>
                                                            </div>
                                                            <h4 class="left-line">
                                                                项目发布了
                                                            </h4>
                                                            <p>
                                                                项目发布开始众筹
                                                            </p>
                                                            <div class="update-share d-flex align-items-center">
                                                                <span>图片:</span>
                                                                <ul class="team__social update__social">
                                                                    <li>
                                                                        <a>
                                                                            <i class="fab fa-facebook-f"></i>
                                                                            <i class="fab fa-facebook-f"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a>
                                                                            <i class="fab fa-twitter"></i>
                                                                            <i class="fab fa-twitter"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a>
                                                                            <i class="fab fa-youtube"></i>
                                                                            <i class="fab fa-youtube"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a>
                                                                            <i class="fab fa-behance"></i>
                                                                            <i class="fab fa-behance"></i>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                            <div class="tab-pane fade <#if tableIndex == 3>show active</#if>" id="contact-02" role="tabpanel" aria-labelledby="contact-tab">
                                <div class="backer-list-table pt-45 pb-130">
                                    <table class="table">
                                        <thead>
                                          <tr>
                                            <th scope="col">姓名</th>
                                            <th scope="col">捐款金额</th>
                                            <th scope="col">捐款时间</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                            <#if donatePageBean.content?size gt 0>
                                                <#list donatePageBean.content as donate>
                                                    <tr>
                                                        <td>${donate.homeUser.name}</td>
                                                        <td>￥${donate.money}</td>
                                                        <td>${donate.createTime?string("yyyy年MM月dd日")}</td>
                                                    </tr>
                                                </#list>
                                            <#else>
                                                <tr>
                                                    <td colspan="3" style="text-align: center">暂无数据</td>
                                                </tr>
                                            </#if>
                                        </tbody>
                                      </table>
                                    <div id="donate-page">

                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade <#if tableIndex == 4>show active</#if>" id="contact-03" role="tabpanel" aria-labelledby="contact2-tab">
                                <div class="row">
                                    <div class="col-xl-10">
                                        <div class="review-box pt-50">
                                            <h5 class="mb-35">${item.caption}项目的评论</h5>
                                            <#list commentPageBean.content as comment>
                                                 <div class="reviewer d-sm-flex" style="padding: 15px; margin-top: 15px;">
                                                     <div class="reviewer__img">
                                                        <#if comment.homeUser.headPic??>
                                                            <#if comment.homeUser.headPic?length gt 0>
                                                                <img class="layui-nav-img"  style="height: 80px; width: 80px;" src="/photo/view?filename=${comment.homeUser.headPic}" />
                                                            <#else>
                                                                <img class="layui-nav-img"  style="height: 80px; width: 80px;" src="/home/images/default-head.jpg"/>
                                                            </#if>
                                                        <#else>
                                                            <img class="layui-nav-img"  style="height: 80px; width: 80px;" src="/home/images/default-head.jpg" />
                                                        </#if>
                                                     </div>
                                                     <div class="reviewer__content">
                                                         <p>${comment.homeUser.name}
                                                             <span>${comment.createTime?string('yyyy-MM-dd')}</span>
                                                         </p>
                                                         <div class="review-icon">
                                                         </div>
                                                         <span>
                                                             <span style="color: black; margin-left: 15px;">${comment.content}</span>
                                                             <a href="javascript:M.openDialog(${comment.id}, ${comment.id});">[回复]</a>
                                                         </span>
                                                     </div>
                                                 </div>

                                                <#list comment.projectComments as child>
                                                    <div class="reviewer d-sm-flex" style="padding: 15px; margin-left: 80px; margin-top: 15px;">
                                                        <div class="reviewer__img">
                                                             <#if child.homeUser.headPic??>
                                                                <#if child.homeUser.headPic?length gt 0>
                                                                    <img class="layui-nav-img"  style="height: 80px; width: 80px;" src="/photo/view?filename=${child.homeUser.headPic}" />
                                                                <#else>
                                                                    <img class="layui-nav-img"  style="height: 80px; width: 80px;" src="/home/images/default-head.jpg"/>
                                                                </#if>
                                                             <#else>
                                                                <img class="layui-nav-img"  style="height: 80px; width: 80px;" src="/home/images/default-head.jpg" />
                                                             </#if>
                                                        </div>
                                                        <div class="reviewer__content">
                                                            <p>
                                                                ${child.homeUser.name}
                                                                <span>${child.createTime?string('yyyy-MM-dd')}</span>
                                                            </p>
                                                            <div class="review-icon">
                                                            </div>
                                                            <span>
                                                                <a style="margin-right: 15px">@ ${child.reply.homeUser.name}</a>
                                                                <span style="color: black; margin-left: 15px;">${child.content}</span>
                                                                <a href="javascript:M.openDialog(${comment.id}, ${child.id});">[回复]</a>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </#list>
                                            </#list>

                                            <div id="comment-page">

                                            </div>
                                        </div>
                                        <div class="post-form-area review-form pt-50 pb-120">
                                            <h5 class="review-title mb-15">发布评论</h5>
                                            <div class="row">
                                                <div class="col-xl-12">
                                                    <div class="input-box mb-25">
                                                        <div class="input-text input-message">
                                                            <textarea name="message" id="message" cols="30" rows="10" placeholder="请将你要发布的评论内容填在这里"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-12">
                                                    <div class="review-btn">
                                                        <#if ylrc_home_user??>
                                                            <a class="theme_btn theme_btn_bg" href="javascript:M.comment();">发送评论 <i
                                                                    class="far fa-arrow-right"></i></a>
                                                        <#else>
                                                            <a class="theme_btn theme_btn_bg" href="/home/homeUser/login">去登陆 <i
                                                                    class="far fa-arrow-right"></i></a>
                                                        </#if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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


    <div class='simple_dlg_define' style='display:none' >
        <div class='pane' style='padding:20px'>
            <div class="layui-form-item">
                <label class="layui-form-label">回复:</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea content" placeholder="请输入内容"></textarea>
                </div>
            </div>
        </div>
    </div>

    <div class='simple_dlg_define_2' style='display:none' >
        <div class='pane layui-form' style='padding:20px'>
            <div class="layui-form-item">
                <label class="layui-form-label">地址:</label>
                <div class="layui-input-block">
                    <select class="layui-select addressId">
                        <option value="">请选择</option>
                        <#list locations as location>
                             <option value="${location.id}"> ${location.mobile} -- ${location.address}</option>
                        </#list>
                    </select>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    var M = {};
    M.projectId = ${item.id}; //项目ID
    M.pageSize = ${donatePageBean.pageSize};
    M.donateCurr = ${donatePageBean.currentPage};
    M.donateCount = ${donatePageBean.total};
    M.tableIndex = ${tableIndex};
    M.commentCount = ${commentPageBean.total};
    M.commentCurr = ${commentPageBean.currentPage};

    M.init = function()
    {
    }();

    layui.use(['element', 'laypage'], function(){
        var element = layui.element; //加载进度条
        var laypage = layui.laypage;

        //执行一个laypage实例
        laypage.render({
            elem: 'donate-page' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: M.donateCount //数据总数，从服务端得到
            ,limit:M.pageSize
            ,curr:M.donateCurr
            ,jump: function(obj, first){
                //首次不执行
                if(!first){
                    M.proCurr = obj.curr;
                    location.href="detail?id=${item.id}&donateCurr="+obj.curr + "&tableIndex=" + 3;
                }
            }
        });


        //执行一个laypage实例
        laypage.render({
            elem: 'comment-page' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: M.commentCount //数据总数，从服务端得到
            ,limit:M.pageSize
            ,curr:M.commentCurr
            ,jump: function(obj, first){
                //首次不执行
                if(!first){
                    M.proCurr = obj.curr;
                    location.href="detail?id=${item.id}&commentCurr="+obj.curr + "&tableIndex=" + 4;
                }
            }
        });

        element.render();
    });

    //不要回馈的
    M.freeDonate = function()
    {
        msg.confirm("确定是否捐赠", function()
        {
            var number = $("#free-price").val().trim();
            if(msg.isEmpty(number))
            {
                errorMsg("请输入你要捐赠的金额");
                return ;
            }

            var price = Number(number);
            if(price < 1)
            {
                errorMsg("请输入整数金额");
                return ;
            }

            $.ajax({
                url:"free_donate",
                type:'POST',
                data:{projectId:M.projectId, price:price},
                dataType:'json',
                success:function(data){
                    if(data.code == 0){
                        successMsg("捐赠成功");
                        setInterval(function()
                        {
                            location.href = location.href;
                        }, 1000);
                    }else{
                        errorMsg(data.msg);
                    }
                },
                error:function(data){
                    errorMsg("网络错误")
                }
            });
        });
    }

    //收费的
    M.donate = function(id)
    {
        var dlgContent = $('.simple_dlg_define_2').html(); // 窗口内容
        layer.open({
            type: 1,
            title: '请选择收货地址',
            area: ['500px', '300px'],
            content: dlgContent,
            btn:['确定','取消'] ,

            btn1: function(index,layero){
                var addressId = $('.addressId', layero).val().trim();
                M.addDonate(addressId, id);
            },
            btn2 : function(index,layero){
                layer.close(index)
            },
            success: function(layero, index)
            {
                layui.use(['form'],function () {
                    var form = layui.form;
                    form.render();
                });
            }
        });
    }

    //收费提交
    M.addDonate = function(addressId, id)
    {
        if(msg.isEmpty(addressId))
        {
            errorMsg("请选择地址");
            return ;
        }

        $.ajax({
            url:"donate",
            type:'POST',
            data:{projectId:M.projectId, feedBackId:id, addressId: addressId},
            dataType:'json',
            success:function(data){
                if(data.code == 0){
                    successMsg("捐赠成功");
                    setInterval(function()
                    {
                        location.href = location.href;
                    }, 1000);
                }else{
                    errorMsg(data.msg);
                }
            },
            error:function(data){
                errorMsg("网络错误")
            }
        });
    }

    M.comment = function()
    {
        var content = $("#message").val().trim();
        if(msg.isEmpty(content))
        {
            errorMsg("请输入内容");
            return ;
        }

        $.ajax({
            url:"/home/project_comment/add",
            type:'POST',
            data:{projectId:M.projectId, content:content},
            dataType:'json',
            success:function(data){
                if(data.code == 0){
                    successMsg("评论成功");
                    setInterval(function()
                    {
                        location.href = "detail?id="+M.projectId+"&tableIndex=" + 4;
                    }, 1000);
                }else{
                    errorMsg(data.msg);
                }
            },
            error:function(data){
                errorMsg("网络错误")
            }
        });
    }

    M.openDialog = function(parent, reply)
    {
        var dlgContent = $('.simple_dlg_define').html(); // 窗口内容
        layer.open({
            type: 1,
            title: '回复评论',
            area: ['500px', '300px'],
            content: dlgContent,
            btn:['确定','取消'] ,

            btn1: function(index,layero){
                var password = $('.content', layero).val().trim();
                M.replyComment(password, parent, reply);
            },
            btn2 : function(index,layero){
                layer.close(index)
            }
        });
    }

    M.replyComment = function( content, parent, reply )
    {
        if(msg.isEmpty(content))
        {
            errorMsg("请输入回复内容");
            return;
        }

        $.ajax({
            url:"/home/project_comment/reply",
            type:'POST',
            data:{projectId:M.projectId, content:content, parent: parent, reply: reply},
            dataType:'json',
            success:function(data){
                if(data.code == 0){
                    successMsg("回复成功");
                    setInterval(function()
                    {
                        location.href = "detail?id="+M.projectId+"&tableIndex=" + 4;
                    }, 1000);
                }else{
                    errorMsg(data.msg);
                }
            },
            error:function(data){
                errorMsg("网络错误")
            }
        });
    }


    M.deleteCollect = function( id )
    {
        $.ajax({
            url:"/home/collect/delete",
            type:'POST',
            data:{id:id},
            dataType:'json',
            success:function(data){
                if(data.code == 0){
                    successMsg("取消成功");
                    setInterval(function()
                    {
                        location.href = "detail?id="+M.projectId;
                    }, 1000);
                }else{
                    errorMsg(data.msg);
                }
            },
            error:function(data){
                errorMsg("网络错误")
            }
        });
    }

    M.addCollect = function()
    {
        $.ajax({
            url:"/home/collect/add",
            type:'POST',
            data:{projectId:M.projectId},
            dataType:'json',
            success:function(data){
                if(data.code == 0){
                    successMsg("收藏成功");
                    setInterval(function()
                    {
                        location.href = "detail?id="+M.projectId;
                    }, 1000);
                }else{
                    errorMsg(data.msg);
                }
            },
            error:function(data){
                errorMsg("网络错误")
            }
        });
    }
</script>
</html>