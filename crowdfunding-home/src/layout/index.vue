<template>
  <div>
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

                      <i class="far fa-chevron-down"></i>

                    </a>

                    <ul class="submenu">
                      <li><a href="/home/project/add">发布项目</a></li>
                      <li><a href="/home/project/index">我的添加</a></li>
                      <li><a href="/home/project/published">已在募捐</a></li>
                    </ul>

                  </li>
                  <li>
                    <a href="/home/news/list">
                      新闻列表
                      <i class="far fa-chevron-down"></i>
                    </a>
                    <ul class="submenu">

                      <li><a href="/home/news/index">发布新闻</a></li>

                      <li><a href="/home/news/list">新闻列表</a></li>
                    </ul>
                  </li>
                  <li><a href="/home/common_problem/index">常见问答</a>
                  </li>
                  <li><a href="/home/contact/index">联系我们</a></li>

                  <li><a href="/home/homeUser/index">个人中心</a></li>

                </ul>
              </nav>
            </div>
          </div>
          <div class="col-xl-3 col-lg-1 col-md-6 col-6 text-right d-flex align-items-center justify-content-end">
            <div class=" mr-10">

<!--              <a href="/home/homeUser/logout" class="theme_btn theme_btn_bg">注销 <i class="far fa-arrow-right"></i></a>-->

              <a  class="theme_btn theme_btn_bg">登录 <i class="far fa-arrow-right"></i></a>

            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "index"
}
</script>

<style scoped>

</style>