<template>
  <div>
    <!--page-title-area start-->
    <section class="page-title-area">
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
                  <li><a href="/home/index/index">首页<i>
                    <font-awesome-icon :icon="['fas', 'chevron-right']"/>
                  </i> </a></li>
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
                <img src="../../assets/images/about/03.jpg" alt="">
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
                  <h4><span>{{ homeCount }} </span> 我们的合作伙伴</h4>
                </div>
                <div class="joint-btn ml-15">
                  <a href="/home/homeUser/register" class="theme_btn theme_btn2 ">加入我们<i>
                    <font-awesome-icon :icon="['fas', 'arrow-right']"/>
                  </i></a>
                </div>
              </div>
              <p>
                - 云养计划，持续支持你喜爱的创作者。<br>
                - 产品众筹，把新奇的创意变成现实。<br>
                - 参与改变，每一次支持都在改变世界。<br>
                - 博客动态，有趣的灵魂等你来发现。<br>
              </p>
              <a href="/home/contact/index" class="theme_btn theme_btn_bg mt-25">联系我们 <i>
                <font-awesome-icon :icon="['fas', 'arrow-right']"/>
              </i></a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--about-us-area end-->
    <!--counter-area start-->
    <section class="counter-area heding-bg pt-130 pb-95">
      <div class="container">
        <div class="row">
          <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
            <div class="counetrs mb-30 wow fadeInUp2 animated" data-wow-delay='.1s'>
              <div class="counetrs__icon mb-30"><i>
                <font-awesome-icon :icon="['fas', 'gem']"/>
              </i></div>
              <h1><span class="counter">{{ proStatusCount }}</span></h1>
              <p>已结束项目</p>
            </div>
          </div>
          <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
            <div class="counetrs mb-30 wow fadeInUp2 animated" data-wow-delay='.2s'>
              <div class="counetrs__icon mb-30"><i>
                <font-awesome-icon :icon="['fas', 'gift']"/>
              </i></div>
              <h1><span class="counter">{{ proCount }}</span></h1>
              <p>募集总金额</p>
            </div>
          </div>
          <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
            <div class="counetrs mb-30 wow fadeInUp2 animated" data-wow-delay='.3s'>
              <div class="counetrs__icon mb-30"><i>
                <font-awesome-icon :icon="['fas', 'trophy']"/>
              </i></div>
              <h1><span class="counter">{{ freeProCount }}</span></h1>
              <p>募款中的公益项目</p>
            </div>
          </div>
          <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
            <div class="counetrs mb-30 wow fadeInUp2 animated" data-wow-delay='.4s'>
              <div class="counetrs__icon mb-30"><i>
                <font-awesome-icon :icon="['fas', 'users']"/>
              </i></div>
              <h1><span class="counter">{{ homeCount }}</span></h1>
              <p>注册人数</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--counter-area end-->
    <!--donation-area start-->
    <section class="donation-area pt-125 pb-100">
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
                <li><a class="theme_btn theme_btn_bg" href="/home/news/list" data-animation="fadeInLeft"
                       data-delay=".7s">
                  了解更多 <i>
                  <font-awesome-icon :icon="['fas', 'arrow-right']"/>
                </i></a>
                </li>
                <li><a class="theme_btn theme-border-btn" href="/home/project/project" data-animation="fadeInLeft"
                       data-delay=".7s">
                  前往捐赠 <i>
                  <font-awesome-icon :icon="['fas', 'arrow-right']"/>
                </i></a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--donation-area end-->
    <!--testimonial-area start-->
    <section class="testimonial-area theme-bg2 pt-125 pb-130">
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
          <div class="row testimonial-active" v-for="item in contactList" :key="item.id">

            <div class="col-xl-6">
              <div class=" wow fadeInUp2 animated" data-wow-delay='.3s'
                   style="width: 440px;box-sizing: content-box;">
                <div class="author-img fix pb-20">
                  <div class="author-avatar f-right">
                  </div>
                </div>
                <div class="author-content mb-15">
                  <h5 class="left-line pl-40">{{ item.homeUserName }}</h5>
                </div>
                <p class="semi-title mb-15" style="height: 140px">{{ item.leavingMessage }}</p>
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>
    <!--testimonial-area end-->

    <!--blog-area start-->
    <section class="blog-area pt-130 pb-100">
      <b-container>
        <b-row >
          <b-col xl="3" lg="8" md="12">
            <div class=" col-md-12">
              <div class="blog-wrapper mb-30">
                <div class="section-title text-left mb-70 wow fadeInUp2 animated" data-wow-delay='.1s'>
                  <h6 class="left-line pl-75 pr-75">最近的新闻</h6>
                  <h2>最近更新<br>
                    <span>新闻</span></h2>
                  <p>查看新闻</p>
                  <a href="/home/news/list" class="theme_btn theme_btn2 theme_btn_bg_02">查看所有新闻 <i
                      class="fa fa-arrow-right"></i></a>
                </div>
              </div>
            </div>
          </b-col>

            <div v-for="item in newsList" :key="item.id">
              <b-col xl="10" lg="1">
              <div class="animated" data-wow-delay='.3s'>

                <div class="blogs mb-30 mr-15">
                  <div class="blogs__thumb pos-rel mb-45">
                    <div class="blogs__thumb--img">
                      <img :src="item.picture" style="height: 250px;width: 370px" alt="">
                    </div>
                    <a class="blog-tag" href="/home/news/detail?id=${news.id}">{{ item.typeName }}</a>
                  </div>
                  <div class="blogs__content">
                    <div class="blogs__content--meta mb-15">
                      <span><i class="far fa-calendar-alt"></i>{{ item.createTime }}</span>
                    </div>
                    <h4 class="mb-20"><a href="/home/news/detail?id=${news.id}">

                    </a></h4>
                    <ul class="project-manager">
                      <li><a href="/home/news/detail?id=${news.id}">
                        <img :src="item.headPic" style="width: 35px;height: 35px" alt="">
                        <span>{{ item.homeUserName }}</span></a></li>
                      <li>
                        <a class="more_btn_02" href="/home/news/detail?id=${news.id}">查看详情 <i
                            class="fa fa-arrow-right"></i></a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              </b-col>
            </div>

        </b-row>
      </b-container>
    </section>
    <!--blog-area end-->
  </div>
</template>

<script>
import '../../assets/css/bootstrap.min.css'

export default {
  name: "about_us",
  data() {
    return {
      dataList: [],
      contactList: [],
      newsList: [],
      freeProCount: "",
      homeCount: "",
      homeIndex: "",
      proCount: "",
      proStatusCount: "",
    }
  },
  created() {
    this.getFreeProCount();
    this.getHomeCount();
    this.projectList();
    this.getProCount();
    this.getProStatusCount();
    this.getContactList();
    this.getNewsList();
  },
  methods: {
    getContactList() {
      this.axios.get("/api/home/about_us/contactList").then(({data}) => {
        if (data.flag) {
          this.contactList = data.data
        }
      });
    },

    getFreeProCount() {
      this.axios.get("/api/home/about_us/freeProCount").then(({data}) => {
        if (data.flag) {
          this.freeProCount = data.data
        }
      });
    },
    getHomeCount() {
      this.axios.get("/api/home/about_us/homeCount").then(({data}) => {
        if (data.flag) {
          this.homeCount = data.data
        }
      });
    },
    projectList() {
      this.axios.get("/api/home/about_us/list").then(({data}) => {
        if (data.flag) {
          this.dataList = data.data
        }
      });
    },
    getProCount() {
      this.axios.get("/api/home/about_us/proCount").then(({data}) => {
        if (data.flag) {
          this.proCount = data.data
        }
      });
    },
    getProStatusCount() {
      this.axios.get("/api/home/about_us/proStatusCount").then(({data}) => {
        if (data.flag) {
          this.proStatusCount = data.data
        }
      });
    },
    getNewsList() {
      this.axios.get("/api//home/about_us/twoNewsList").then(({data}) => {
        if (data.flag) {
          this.newsList = data.data
        }
      });
    },

  }
}
</script>

<style scoped>

</style>