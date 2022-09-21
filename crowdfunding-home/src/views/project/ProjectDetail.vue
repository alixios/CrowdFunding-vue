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

                <a style="position: absolute; top: 50px; right: 40px; color: rgb(2, 182, 99); cursor: pointer">
                  <i class="layui-icon layui-icon-heart-fill"></i>取消
                </a>

                <a style="position: absolute; top: 50px; right: 40px; color: black; cursor: pointer">
                  <i class="layui-icon layui-icon-heart"></i>收藏
                </a>

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
                      <a>

                      </a>
                    </address>
                  </div>
                </div>
                <div class="skill mb-20">
                  <p class="skill-para">目标金额 <span>￥ {{ dataList.targetPrice }}</span></p>
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
                        <div class="updown plus"><i>
                          <font-awesome-icon :icon="['fas', 'chevron-left']"/>
                        </i></div>
                        <div class="updown minus"> <i>
                          <font-awesome-icon :icon="['fas', 'chevron-right']"/>
                        </i></div>
                      </div>
                    </form>
                  </li>
                  <li><a class="theme_btn theme_btn_bg"
                         href="<#if ylrc_home_user??>javascript:M.freeDonate();<#else>/home/homeUser/login</#if>"
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
      <div>
        <b-card no-body>
          <b-tabs v-model="tabIndex" card>
            <b-tab class="nav-tabs-02 nav-link theme_btn" title="Tab 1" :title-link-class="linkClass(0)">Tab contents 1</b-tab>
            <b-tab title="Tab 2" :title-link-class="linkClass(1)">Tab contents 2</b-tab>
            <b-tab title="Tab 3" :title-link-class="linkClass(2)">Tab contents 3</b-tab>
            <b-tab title="Tab 4" :title-link-class="linkClass(3)">Tab contents 3</b-tab>
          </b-tabs>
        </b-card>
      </div>
      <b-container>
        <b-row>
          <b-col xl="12">
            <ul class="nav nav-tabs nav-tabs-02" id="myTab" role="tablist">
              <li class="nav-item">
                <a class="nav-link theme_btn <#if tableIndex == 1>active</#if>" id="home-tab" data-toggle="tab"
                   href="#home-01" role="tab" aria-controls="home-01" aria-selected="true">项目介绍</a>
              </li>
              <li class="nav-item">
                <a class="nav-link theme_btn <#if tableIndex == 2>active</#if>" id="profile-tab" data-toggle="tab"
                   href="#profile-01" role="tab" aria-controls="profile-01" aria-selected="false">项目进展</a>
              </li>
              <li class="nav-item">
                <a class="nav-link theme_btn <#if tableIndex == 3>active</#if>" id="contact-tab" data-toggle="tab"
                   href="#contact-02" role="tab" aria-controls="contact-02" aria-selected="false">捐赠列表</a>
              </li>
              <li class="nav-item">
                <a class="nav-link theme_btn <#if tableIndex == 4>active</#if>" id="contact2-tab" data-toggle="tab"
                   href="#contact-03" role="tab" aria-controls="contact-03" aria-selected="false">评论</a>
              </li>
            </ul>
            <div class="tab-content" id="myTabContent">
              <div class="tab-pane fade <#if tableIndex == 1>show active</#if>" id="home-01" role="tabpanel"
                   aria-labelledby="home-tab">
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

                        <div class="image-content-right">
                          <div class="widget grey-bg mb-30">
                            <div class="widget-rewards">
                              <h4>${feedback.caption}</h4>
                              <div class="reaward__thumb text-center mb-25">

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
                                 data-animation="fadeInLeft" data-delay=".5s" style="color: white"
                                 href="<#if ylrc_home_user??>javascript:M.donate(${feedback.id});<#else>/home/homeUser/login</#if>">去支持
                                <i class="far fa-arrow-right"></i>
                              </a>
                            </div>
                          </div>
                        </div>

                      </div>
                    </div>
                  </div>
                </section>
              </div>
              <div class="tab-pane fade <#if tableIndex == 2>show active</#if>" id="profile-01" role="tabpanel"
                   aria-labelledby="profile-tab">
                <section class="project-image-text-area pb-90 pt-25">
                  <div class="container">
                    <div class="row">
                      <div class="col-xl-12 col-lg-12 col-md-12">
                        <ul class="timeline mb-100">

                          <li class="timeline-list wow fadeInUp2 animated" data-wow-delay='.1s' style="display: block">
                            <div class="update-content">
                              <div class="update-meta">
                                <span><i
                                    class="far fa-calendar-alt"></i>${progress.createTime?string("yyyy-MM-dd")}</span>
                              </div>
                              <h4 class="left-line">${progress.caption}</h4>
                              <p>
                                ${progress.info}<a href="/home/progress/detail?id=${progress.id}">[查看详情]</a>
                              </p>
                              <div class="update-share d-flex align-items-center">
                                <span>图片:</span>
                                <ul class="team__social update__social">

                                  <li>
                                    <a href="" style="width: 100px; height: 100px">
                                      <img src="${img}" style="width: 100%; height: 100%;"/>
                                    </a>
                                  </li>

                                  <li>
                                    <a href="" style="width: auto;">
                                      暂无图片
                                    </a>
                                  </li>

                                </ul>
                              </div>
                            </div>
                          </li>

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
              <div class="tab-pane fade <#if tableIndex == 3>show active</#if>" id="contact-02" role="tabpanel"
                   aria-labelledby="contact-tab">
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

                    <tr>
                      <td>${donate.homeUser.name}</td>
                      <td>￥${donate.money}</td>
                      <td>${donate.createTime?string("yyyy年MM月dd日")}</td>
                    </tr>

                    <tr>
                      <td colspan="3" style="text-align: center">暂无数据</td>
                    </tr>

                    </tbody>
                  </table>
                  <div id="donate-page">

                  </div>
                </div>
              </div>
              <div class="tab-pane fade <#if tableIndex == 4>show active</#if>" id="contact-03" role="tabpanel"
                   aria-labelledby="contact2-tab">
                <div class="row">
                  <div class="col-xl-10">
                    <div class="review-box pt-50">
                      <h5 class="mb-35">${item.caption}项目的评论</h5>

                      <div class="reviewer d-sm-flex" style="padding: 15px; margin-top: 15px;">
                        <div class="reviewer__img">

                        </div>
                        <div class="reviewer__content">
                          <p>${comment.homeUser.name}
                            <span>${comment.createTime?string('yyyy-MM-dd')}</span>
                          </p>
                          <div class="review-icon">
                          </div>

                        </div>
                      </div>


                      <div class="reviewer d-sm-flex" style="padding: 15px; margin-left: 80px; margin-top: 15px;">
                        <div class="reviewer__img">


                          <img class="layui-nav-img" style="height: 80px; width: 80px;"
                               src="/photo/view?filename=${child.homeUser.headPic}"/>


                        </div>
                        <div class="reviewer__content">
                          <p>
                            ${child.homeUser.name}
                            <span>${child.createTime?string('yyyy-MM-dd')}</span>
                          </p>
                          <div class="review-icon">
                          </div>

                        </div>
                      </div>


                      <div id="comment-page">

                      </div>
                    </div>
                    <div class="post-form-area review-form pt-50 pb-120">
                      <h5 class="review-title mb-15">发布评论</h5>
                      <div class="row">
                        <div class="col-xl-12">
                          <div class="input-box mb-25">
                            <div class="input-text input-message">
                              <textarea name="message" id="message" cols="30" rows="10"
                                        placeholder="请将你要发布的评论内容填在这里"></textarea>
                            </div>
                          </div>
                        </div>
                        <div class="col-xl-12">
                          <div class="review-btn">

                            <a class="theme_btn theme_btn_bg" href="javascript:M.comment();">发送评论 <i
                                class="far fa-arrow-right"></i></a>

                            <a class="theme_btn theme_btn_bg" href="/home/homeUser/login">去登陆 <i
                                class="far fa-arrow-right"></i></a>

                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </b-col>
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
      tabIndex: 0,
      dataList: [],
    }
  },
  created() {
    this.getProject()
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
      this.axios.get(`/api/home/project/${projectId}`)
          .then(({data}) => {
            if (!data.flag) {
              return this.$message.error(data.message)
            }
            this.dataList = data.data
          });
    },
  }
}
</script>

<style scoped>

</style>