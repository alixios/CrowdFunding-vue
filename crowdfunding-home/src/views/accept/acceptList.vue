<template>
  <div>
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
  <section class="pos-rel  wow fadeInUp2 animated" data-wow-delay='.1s' style="padding: 20px;">
    <div class="container">
      <div class="row">
        <div class="col-xl-12">
          <blockquote class="layui-elem-quote" style="margin-bottom: 15px;">
            <div class="layui-row">
              <span class="span-margin">回馈管理</span>
            </div>
          </blockquote>
          <!-- 表格展示 -->
          <el-table
              border
              :data="projectList"
          >
            <!-- 项目标题 -->
            <el-table-column prop="caption" label="项目标题" align="center" />
            <!-- 回馈标题 -->
            <el-table-column prop="caption" label="回馈标题" align="center" />
            <!-- 接收人姓名  -->
            <el-table-column prop="targetPrice" label="接收人姓名" align="center" />
            <!-- 接收人电话 -->
            <el-table-column prop="homeUserName"  label="接收人电话" align="center" />
            <!-- 接收人地址 -->
            <el-table-column prop="homeUserName"  label="接收人地址" align="center" />
            <!-- 预计发放时间 -->
            <el-table-column
                prop="start"
                label="预计发放时间 "
                width="120"
                align="center"
            >
              <template slot-scope="scope">
                <i class="el-icon-time" style="margin-right:5px" />
                {{ scope.row.start | date }}
              </template>
            </el-table-column>

            <!-- 状态 -->
            <el-table-column prop="status" label="状态" width="100" align="center" >
              <template slot-scope="scope" >
                {{projectStatus(scope.row.status).name}}
              </template>
            </el-table-column>

            <el-table-column label="操作" align="center" width="200">
              <template slot-scope="scope">
                <el-button v-show="scope.row.type==1"
                           type="success"
                           size="mini"
                           style="margin-left: 5px"
                           @click="goAcceptList(scope.row.id)"
                >
                  赠品管理
                </el-button>

                <el-button v-show="scope.row.status==3 || scope.row.status==0"
                           type="primary"
                           size="mini"
                           style="margin-left: 5px"
                           @click="editProject(scope.row.id)"
                >
                  编辑
                </el-button>
                <el-button v-show="scope.row.status==3"
                           type="danger"
                           size="mini"
                           style="margin-top: 5px;margin-left: 5px"
                           @click="not_pass(scope.row.notPassReason)"
                >
                  查看原因
                </el-button>
                <el-button v-show="scope.row.status==0"
                           type="success"
                           size="mini"
                           style="margin-top: 5px;margin-left: 5px"
                           @click="submit_audit(scope.row.id)"
                >
                  提交审核
                </el-button>

              </template>
            </el-table-column>
          </el-table>
        </div>
      </div>
    </div>
  </section>
  <!--our-overview-area end-->
  </div>
</template>

<script>
export default {
  name: "acceptList",
  data() {
    return {
      dataList: [],
    }
  },
  created() {
    this.getProject()
  },
  methods: {
    getProject() {
      const path = this.$route.path;
      const arr = path.split("/");
      const projectId = arr[4];
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