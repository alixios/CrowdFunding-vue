<template>
  <div>

    <!--slider-area start-->
    <div class="slider-area slider-area-02 ">
      <!--          <div class="right-border-shape">
                  <img src="../../assets/images/shape/02.png" alt="">
                </div>-->
      <div class="slider-active">
        <div class="single-slider slider-height-02 pos-rel d-flex align-items-center"
             style="background-image: url(../../assets/images/slider/slider1.jpg)">

          <div class="container">
            <div class="row">
              <div class="col-xl-8">
                <div class="slider__content slider__content__02 text-left">
                  <h1 class="main-title mb-25" data-animation="fadeInUp2" data-delay=".2s">
                    我们准备推广你的众筹项目
                  </h1>
                  <h4>感谢你来到众筹网</h4>
                  <ul class="btn-list btn-list-02">
                    <li><a class="theme_btn theme_btn2 theme_btn_bg_02" href="../../assets/news/list"
                           data-animation="fadeInLeft" data-delay=".5s">探索更多 <i
                        class="fa fa-arrow-right"></i></a>
                    </li>
                    <li><a class="theme_btn theme-border-btn theme_btn_bg_02" href="../../assets/project/project"
                           data-animation="fadeInLeft" data-delay=".5s">捐赠更多<i
                        class="fa fa-arrow-right"></i></a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--slider-area end-->
    <!--about-us-area start-->
    <section class="about-us-area about-area-02 pt-130 pb-100">
      <div class="container">
        <div class="row">
          <div class="col-xl-5 col-lg-6 col-md-12">
            <div class="about-img mb-30 wow fadeInUp2 animated" data-wow-delay='.1s'>
              <div class="about-img__thumb">
                <img src="../../assets/images/about/02.jpg" alt="">
              </div>
              <div class="about-img__style-text">
                <img src="../../assets/images/about/02.png" alt="">
              </div>
              <div class="about-img__style-dot d-none d-lg-inline-block">
                <img src="../../assets/images/shape/03.png" alt="">
              </div>
            </div>
          </div>
          <div class="col-xl-7 col-lg-6 col-md-12">
            <div class="about__wrapper about-wrapper-02 pl-70">
              <div class="section-title text-left mb-50 wow fadeInUp2 animated" data-wow-delay='.1s'>
                <h6 class="left-line pl-75">我们是谁</h6>
                <h2>给你的手<br>
                  <span>在正确的地方</span></h2>
                <p>
                  - 云养计划，持续支持你喜爱的创作者。<br>
                  - 产品众筹，把新奇的创意变成现实。<br>
                  - 参与改变，每一次支持都在改变世界。<br>
                  - 博客动态，有趣的灵魂等你来发现。<br>
                </p>
              </div>
              <div class="inner-counters">
                <div class="row">
                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                    <div class="counters d-flex mb-10 wow fadeInUp2 animated" data-wow-delay='.1s'>
                      <div class="counters__icon mb-30"><i>
                        <font-awesome-icon :icon="['fas', 'users']"/>
                      </i></div>
                      <div class="counters__content">
                        <h3><span class="counter">{{ homeUserCount }}</span></h3>
                        <p>注册人数</p>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                    <div class="counters d-flex mb-20 pl-35 wow fadeInUp2 animated" data-wow-delay='.1s'>
                      <div class="counters__icon mb-30"><i>
                        <font-awesome-icon :icon="['fas', 'fa-business-time']"/>
                      </i></div>
                      <div class="counters__content">
                        <h3><span class="counter">{{ projectPrice }}</span></h3>
                        <p>众筹金额</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <a class="theme_btn theme_btn_bg" href="/home/about_us/index"
                 data-animation="fadeInUp2" data-delay=".1s">探索更多
                <font-awesome-icon :icon="['fas', 'fa-arrow-right']"/>
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--about-us-area end-->

    <!--feature-project-area start-->
    <section class="feature-project-03 grey-bg pt-125 pb-130">
      <b-container class="custom-container-4">

        <b-row>
          <div class="col-xl-10 offset-xl-1">
            <div class="section-title text-center mb-85 wow fadeInUp2 animated" data-wow-delay='.1s'>
              <h6 class="left-line pl-75 pr-75">最新的项目</h6>
              <h2>我们的 <br><span>最新众筹项目</span></h2>
            </div>
          </div>
        </b-row>
        <b-row cols="4">
          <div v-for="item in dataList" :key="item.id">
            <b-col >
              <div class="projects projects__03 pos-rel mb-30 wow fadeInUp2 animated" data-wow-delay='.1s'>
                <div class="projects__thumb pos-rel">
                  <img v-bind:src=item.headPic alt="" @click="toProject(item.id)" height="268">
                </div>
                <div class="projects__content white-bg">
                  <h4 @click="toProject(item.id)">
                      {{ item.caption }}
                  </h4>
                  <div class="skill mb-30">
                    <p>目标金额 <span>￥ {{ item.targetPrice }}</span></p>
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
                          <img v-bind:src=item.avatar alt="" width="38" height="38">
                         {{ item.homeUserName }}</a></li>
                      <li>
                        <p class="time">
                          <i><font-awesome-icon :icon="['fas', 'fa-clock']"/></i>
                            {{item.start}}
                        </p>
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
    <!--feature-project-area end-->

    <!--faq-area start-->
    <section class="faq-area heding-bg pos-rel pt-130 pb-60">
      <b-container class="container">
        <b-row>
          <b-col xl="6" lg="6">
            <div class="faq-wrapper mb-30">
              <div class="section-title white-title text-left mb-85 wow fadeInUp2 animated" data-wow-delay='.1s'>
                <h6 class="left-line pl-75 pr-75">常见问题</h6>
                <h2>经常问的问题</h2>
                <p>你遇到的问题可能在这里解决哦，快来看看常见问题汇总吧，说不定有你想要的答案 --常见问题汇总</p>
                <a class="theme_btn theme_btn_bg" href="/home/common_problem/index">查看更多


                  <font-awesome-icon :icon="['fas', 'fa-arrow-right']"></font-awesome-icon>
                </a>
              </div>
            </div>
          </b-col>
          <b-col xl="6" lg="6">
            <div class="faq-content mb-30 wow fadeInUp2 animated" data-wow-delay='.1s'>
              <div id="accordion">
                <div v-for="item in dataList2" :key="item.id" class=" card-bg mb-15"
                     style="background-image:url(../../assets/images/bg/06.jpg)">
                  <b-card no-body class="mb-1">
                    <b-card-header>
                      <h5 class="mb-0">
                        <b-button block v-b-toggle="`accordion-${item.id}`" variant="link">{{ item.name }}</b-button>
                      </h5>
                    </b-card-header>
                    <b-collapse :id="`accordion-${item.id}`" visible accordion="my-accordion" role="tabpanel">
                      <b-card-body>
                        <p>{{ item.answer }}</p>
                      </b-card-body>
                    </b-collapse>
                  </b-card>
                </div>
              </div>
            </div>
          </b-col>
        </b-row>
      </b-container>
    </section>
    <!--faq-area end-->


    <!--testimonial-area start-->
    <section class="testimonial-area theme-bg2 pt-125 pb-130"
             style="background-image:url(../../assets/images/bg/04.png);">
      <div class="container">
        <b-row>
          <b-col xl="10" offset-xl="1">

            <div class="section-title white-title text-center mb-70 wow fadeInUp2 animated" data-wow-delay='.2s'>
              <h6 class="left-line pl-75 pr-75">客户反馈</h6>
              <h2>客户<br>
                <span>给我们的建议</span></h2>
            </div>
          </b-col>
        </b-row>
        <div class="testimonial-wrapper">
          <div class="row testimonial-active" v-for="item in contactList" :key="item.id">

            <b-col xl="6">
              <div class="testimonial-item wow fadeInUp2 animated" data-wow-delay='.3s'
                   style="width: 440px;box-sizing: content-box;">
                <div class="author-img fix pb-20">
                  <div class="author-avatar f-right">
                    <img src="../../assets/images/testimonial/01.png" style="height: 120px;width: 120px" alt="">
                  </div>
                </div>
                <div class="author-content mb-15">
                  <h5 class="left-line pl-40">{{ item.homeUserName }}</h5>
                </div>
                <p class="semi-title mb-15" style="height: 140px">{{ item.leavingMessage }}</p>
              </div>
            </b-col>

          </div>
        </div>
      </div>
    </section>
  </div>
  <!--testimonial-area end-->
</template>


<script>



export default {
  name: "index",

  data: function () {
    return {
      visible: true,
      dataList: [], // 当前页要展示的项目分页列表数据
      dataList2: [],
      contactList: [],
      homeUserCount: "",
      projectPrice: "",

    }
  },
  created() {
    this.getHomeCount();
    this.getProCount();
    this.getProList();
    this.getCommonProblems();
  },
  methods: {
    getHomeCount() {
      this.axios.get("/api/home/index/homeCount").then(({data}) => {
        this.homeUserCount = data.data
      })
    },
    getProCount() {
      this.axios.get("/api/home/index/proCount").then(({data}) => {
        this.projectPrice = data.data
      })
    },
    getProList() {
      this.axios.get("/api/home/index/list").then(({data}) => {
        this.dataList = data.data
      })
    },
    getCommonProblems() {
      this.axios.get("/api/home/index/commonProblems").then(({data}) => {
        this.dataList2 = data.data
      })
    },
    getContactList() {
      this.axios.get("/api/home/index/contactList").then(({data}) => {
        this.contactList = data.data
      })
    },
    toProject(projectId){
      this.$store.state.projectId = projectId;
      this.$router.push(`/home/project/${projectId}`);
    },
  }
}
</script>

<style scoped>

</style>