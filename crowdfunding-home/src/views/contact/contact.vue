<template>
  <div>

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
                <li><a href="/home/index/index">首页 <i>
                  <font-awesome-icon :icon="['fas', 'chevron-right']"/>
                </i></a></li>
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
              <h4>地点:桂林理工大学</h4>
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
              <h5>1786909765@qq.com</h5>
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
              <h5>123456789</h5>
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
                    <div v-if="homeUserId === null">
                      <a class="theme_btn theme_btn_bg" href="/home/homeUser/login" >请先登录 <i>
                        <font-awesome-icon :icon="['fas', 'fa-arrow-right']"/>
                      </i></a>
                    </div>
                    <div v-else>
                      <a class="theme_btn theme_btn_bg" href="javascript:void(0);" id="contact-submit">提交 <i>
                        <font-awesome-icon :icon="['fas', 'fa-arrow-right']"/>
                      </i></a>
                    </div>





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
  </div>
</template>

<script>
export default {
  name: "contact",
  created() {
    this.getUid()
  },
  data() {
    return {
      homeUserId: null,
    }
  },
  methods: {
    getUid(){
      this.homeUserId = window.sessionStorage.getItem('uid')
    },
  },
}
</script>

<style scoped>

</style>