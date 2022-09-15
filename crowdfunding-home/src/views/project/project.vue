<template>
  <div>
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

        <div class="col-xl-4 col-lg-4 col-md-6">
          <div class="projects projects-02 white-bg mb-30 wow fadeInUp2 animated" data-wow-delay='.2s'>
            <div class="projects__thumb pos-rel">

              <img src="/photo/view?filename=${item.headPic}" alt="" height="268">

              <img src="/admin/images/default-head.jpg" alt="默认图片" height="268">

            <img src="/admin/images/default-head.jpg" alt="默认图片" height="268">

        </div>
        <div class="projects__content">
          <h4><a href="detail?id=${item.id}">

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

                  <img class="layui-nav-img" src="/photo/view?filename=${item.homeUser.headPic}" alt="">

                  <img class="layui-nav-img" src="/admin/images/default-head.jpg" alt="默认图片">

                <img class="layui-nav-img" src="/admin/images/default-head.jpg" alt="默认图片">

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

  </div>
  <div id="page">

  </div>
  </div>
  </section>
  <!--project-area end-->
  </div>
</template>

<script>
export default {
name: "project"
}
</script>

<style scoped>

</style>