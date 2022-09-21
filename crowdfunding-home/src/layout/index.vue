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
                      <i>
                        <font-awesome-icon :icon="['fas', 'fa-chevron-down']"/>
                      </i>
                    </a>

                    <ul class="submenu">
                      <li><a href="/project/add">发布项目</a></li>
                      <li><a href="/project/index">我的添加</a></li>
                      <li><a href="/project/published">已在募捐</a></li>
                    </ul>

                  </li>
                  <li>
                    <a href="/home/news/list">
                      新闻列表
                    </a>
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
              <div v-if="homeUserId !== null" @click="toLogout" class="theme_btn theme_btn_bg">
                  注销 <i>
                  <font-awesome-icon :icon="['fas', 'fa-arrow-right']"/>
                </i>
              </div>
              <div v-else="homeUserId === null" @click="toLogin" class="theme_btn theme_btn_bg">
                  登录 <i>
                  <font-awesome-icon :icon="['fas', 'fa-arrow-right']"/>
                </i>

              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "index",
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
    toLogin() {
      this.$router.push("/home/homeUser/login")
    },
    toLogout() {
      window.sessionStorage.removeItem('uid')
      this.axios.get("/api/home/homeUser/logout").then(({data}) => {
        if (data.flag) {
          this.$message.success("注销成功")
          this.$router.go(0)
        }
      });
    },
  },

}
</script>

<style scoped>

</style>