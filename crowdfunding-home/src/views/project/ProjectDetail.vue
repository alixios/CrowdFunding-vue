<template>
  <div>
    <!--page-title-area start-->
    <section class="page-title-area">
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
                  <li><a href="/home/index/index">首页 <i>
                    <font-awesome-icon :icon="['fas', 'chevron-right']"/>
                  </i></a></li>
                  <li><a class="active">项目详情</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!--project-area start-->
    <section class="project-image-area grey-bg pt-130 pb-100">
      <div class="container">
        <div class="row no-gutters">
          <div class="col-xl-7">
            <div class="project-img mb-30 wow fadeInUp2 animated" data-wow-delay='.1s'>
              <img v-bind:src=dataList.headPic alt="" style="height: 537px;"/>
            </div>
          </div>
          <div class="col-xl-5  wow fadeInUp2 animated" data-wow-delay='.1s'>
            <div class="projects project-cart white-bg mb-30">
              <div class="projects__content" style="position: relative; height: 537px">

<!--                <a style="position: absolute; top: 50px; right: 40px; color: rgb(2, 182, 99); cursor: pointer">
                  <i class="layui-icon layui-icon-heart-fill"></i>取消
                </a>

                <a style="position: absolute; top: 50px; right: 40px; color: black; cursor: pointer">
                  <i class="layui-icon layui-icon-heart"></i>收藏
                </a>-->

                <a class="new-tag" style="color: white">{{ dataList.categoryName }}</a>
                <h4><a>{{ dataList.caption }}</a></h4>
                <div class="projects__manager d-sm-flex align-items-center mb-40">
                  <div class="manager-img mr-20">

                    <img style="height: 55px; width: 55px;" class="layui-nav-img"
                         v-bind:src=dataList.avatar alt="">

                  </div>
                  <div class="name">
                    <h5>{{ dataList.homeUserName }}</h5>
                    <address>
                    </address>
                  </div>
                </div>
                <div class="skill mb-20">
                  <p class="skill-para">目标金额 <span>￥ {{ dataList.targetPrice }}</span></p>
                  <el-progress :text-inside="true" :stroke-width="13" status="success"
                               :percentage="percentage(dataList.preparePrice,dataList.targetPrice)"></el-progress>
                </div>
                <p>温馨提示:您的支持，犹如爱已经起航，新阳光承诺为您撑起抵达彼岸的风帆，让这份爱快速前行，并且行的更远。</p>
                <ul class="cart-list d-sm-flex align-items-center">
                  <li>
                    <form class="cart-plus-minus" action="form.php">
                      <div class="plus-minus pos-rel">
                        <input type="number" v-model="freeValue" value="5" min="0" id="free-price">
                        <div style="margin-top: 5px" class="updown plus"><i>
                          <font-awesome-icon :icon="['fas', 'chevron-left']"/>
                        </i></div>
                        <div style="margin-top: 5px" class="updown minus"><i>
                          <font-awesome-icon :icon="['fas', 'chevron-right']"/>
                        </i></div>
                      </div>
                    </form>
                  </li>
                  <li><a class="theme_btn theme_btn_bg"
                         @click="donate()"
                         data-animation="fadeInLeft" data-delay=".5s">现在捐赠 <i>
                    <font-awesome-icon :icon="['fas', 'chevron-right']"/>
                  </i></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>


    <!--our-overview-area start-->
    <section class="our-overview-area pos-rel  wow fadeInUp2 animated" data-wow-delay='.1s'>
      <b-container fluid>
        <b-row>
          <b-tabs v-model="tabIndex" card>
            <b-tab title="项目介绍" :title-link-class="linkClass(0)">
              <section class="project-image-text-area pt-35 pb-90 wow fadeInUp animated" data-wow-delay='.3s'>
                <div class="container">
                  <div class="row">
                    <div class="col-xl-8 col-lg-8 col-md-12">
                      <div class="image-content-left">
                        <div class="left-content-box mb-45" id="detail-content" v-html="dataList.content">

                        </div>
                      </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-12">

<!--                      <div class="image-content-right" v-show="feedback.id!=null">
                        <div class="widget grey-bg mb-30">
                          <div class="widget-rewards">
                            <h4>{{feedback.caption}}</h4>
                            <div class="reaward__thumb text-center mb-25">
                              <img :src="feedback.headPic" />
                            </div>
                            <h5>捐赠<span>￥ {{feedback.price}}</span></h5>
                            <div class="mb-20">
                              {{feedback.content}}
                            </div>
                            <h5>{{feedback.grantDate}}</h5>
                            <p>预计发放时间</p>
                            <ul class="rewards-list pt-15 mb-25">
                              <li><i>
                                <font-awesome-icon :icon="['fas', 'user-circle']"/>
                              </i> {{feedback.supportCount}} 个支持者</li>
                              <li><i>
                                <font-awesome-icon :icon="['fas', 'trophy']"/>
                              </i> 还剩 {{feedback.count - feedback.supportCount}}份</li>
                            </ul>
                            <a class="theme_btn theme_btn_bg"
                               data-animation="fadeInLeft" data-delay=".5s" style="color: white"
                               href="<#if ylrc_home_user??>javascript:M.donate(${feedback.id});<#else>/home/homeUser/login</#if>">去支持
                              <i>
                                <font-awesome-icon :icon="['fas', 'chevron-right']"/>
                              </i>
                            </a>
                          </div>
                        </div>
                      </div>-->
                    </div>
                  </div>
                </div>
              </section>
            </b-tab>
            <b-tab title="项目进展" :title-link-class="linkClass(1)">
              <section class="project-image-text-area pb-90 pt-25">
                <div class="container">
                  <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12">
                      <ul class="timeline mb-100">
                        <div v-for="item in progressList" :key="item.id">
                        <li class="timeline-list wow fadeInUp2 animated" data-wow-delay='.1s' style="display: block">
                          <div class="update-content">
                            <div class="update-meta">
                              <span><i class="far fa-calendar-alt"></i>{{item.createTime}}</span>
                            </div>
                            <h4 class="left-line">{{item.caption}}</h4>
                            <p>
                              {{item.info}}<a href="/home/progress/detail?id=${progress.id}">[查看详情]</a>
                            </p>
                            <div class="update-share d-flex align-items-center">
                              <span>图片:</span>
                              <ul class="team__social update__social">
                                <li>
                                  <a href="" style="width: 100px; height: 100px">
                                    <img :src="item.headPic" style="width: 100%; height: 100%;"/>
                                  </a>
                                </li>
                              </ul>
                            </div>
                          </div>
                        </li>

                        <li class="timeline-list wow fadeInUp2 animated" data-wow-delay='.1s'>
                          <div class="update-content">
                            <div class="update-meta">
                              <span><i class="far fa-calendar-alt"></i>{{item.createTime}}</span>
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
                        </div>
                      </ul>
                    </div>
                  </div>
                </div>
              </section>
            </b-tab>
            <b-tab title="捐赠列表" :title-link-class="linkClass(2)">
              <div class="backer-list-table pt-45 pb-130">
                <!-- 表格展示 -->
                <el-table
                    border
                    :data="donateList"
                >
                  <!-- 文章标题 -->
                  <el-table-column prop="homeUsername" label="姓名" align="center" />
                  <!-- 文章开始时间 -->
                  <el-table-column
                      prop="createTime"
                      label="捐赠时间 "
                      align="center"
                  >
                    <template slot-scope="scope">
                      <i class="el-icon-time"  />
                      {{ scope.row.createTime | date }}
                    </template>
                  </el-table-column>
                  <!-- 目标金额  -->
                  <el-table-column prop="money" label="捐赠金额" align="center" />
                </el-table>
              </div>
            </b-tab>
          </b-tabs>
        </b-row>
      </b-container>
    </section>
    <!--our-overview-area end-->
  </div>
</template>

<script>
export default {
  name: "ProjectDetail",
  data() {
    return {
      freeValue: 5,
      projectId: "",
      tabIndex: 0,
      dataList: [],
      feedback: [],
      progressList: [],
      donateList: [],
      pagination: { // 分页相关模型数据
        currentPage: 1, // 当前页码
        pageSize: 6, // 每页显示的记录数
        total: 0, // 总记录数
        queryString: null // 查询条件
      },
    }
  },
  created() {
    this.getProject();
    this.getFeed_back();
    this.getProgress();
    this.getDonate();
  },
  methods: {
    linkClass(idx) {
      if (this.tabIndex === idx) {
        return ['bg-success', 'text-light']
      } else {
        return ['bg-light', 'text-info']
      }
    },
    getProject() {
      const path = this.$route.path;
      const arr = path.split("/");
      const projectId = arr[3];
      console.log("==="+projectId)
      this.axios.get(`/api/home/project/${projectId}`)
          .then(({data}) => {
            if (!data.flag) {
              return this.$message.error(data.message)
            }
            this.dataList = data.data
          });
    },
    getFeed_back() {
      const path = this.$route.path;
      const arr = path.split("/");
      const projectId = arr[3];
      this.axios.get(`/api/home/feed_back/${projectId}`)
          .then(({data}) => {
            if (!data.flag) {
              return this.$message.error(data.message)
            }
            this.feedback = data.data
          });
    },
    getProgress() {
      const path = this.$route.path;
      const arr = path.split("/");
      const projectId = arr[3];
      this.axios.get(`/api/progress/index/${projectId}`)
          .then(({data}) => {
            if (!data.flag) {
              return this.$message.error(data.message)
            }
            this.progressList = data.data
          });
    },
    getDonate() {
      const path = this.$route.path;
      const arr = path.split("/");
      const projectId = arr[3];
      this.axios.post(`/api/home/donate/${projectId}`,this.pagination)
          .then(({data}) => {
            if (!data.flag) {
              return this.$message.error(data.message)
            }
            this.donateList = data.data.records
          });
    },
    percentage(preparePrice, targetPrice) {
      return (preparePrice / targetPrice) * 100
    },
    donate(){
      console.log("===="+this.freeValue)
      const path = this.$route.path;
      const arr = path.split("/");
      const projectId = arr[3];
      this.axios.post(`/api/home/project/free_donate/${projectId}/${this.freeValue}`)
          .then(({data}) => {
            if (data.flag) {
              this.$message.success("捐赠成功")
            }else {
              this.$message.error("捐赠失败")
            }
          });
    }
  }
}
</script>

<style scoped>

</style>