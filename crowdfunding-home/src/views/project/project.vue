<template>
  <div>
    <!--page-title-area start-->
    <section class="page-title-area" >
      <div class="container">
        <div class="row">
          <div class="col-xl-10 offset-xl-1">
            <div class="page-title-wrapper text-center">
              <h1 class="page-title wow fadeInUp2 animated" data-wow-delay='.1s'>
                项目列表
              </h1>
              <div class="breadcrumb">
                <ul class="breadcrumb-list wow fadeInUp2 animated" data-wow-delay='.3s'>
                  <li><a href="/home/index/index">首页 <i>
                    <font-awesome-icon :icon="['fas', 'chevron-right']"/>
                  </i></a></li>
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
      <b-container>
        <div class="row mb-50 align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-6">
            <h5>众筹项目</h5>
          </div>
          <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                <div class="layui-input-inline">
                  <input name="caption" id="caption" type="search" class="layui-input" placeholder="请输入项目标题"
                         v-model="pagination.queryString" />
                </div>
                <button @click="listProjects" class="layui-btn layui-btn-primary">
                  <i class="layui-icon layui-icon-search"></i>
                  搜索
                </button>
          </div>
        </div>
        <b-row cols="3" >
          <div v-for="item in projectList" :key="item.id">
          <b-col>
            <div class="projects projects-02 white-bg mb-30 wow fadeInUp2 animated" data-wow-delay='.2s'>
              <div class="projects__thumb pos-rel">
                <img v-bind:src=item.headPic alt="" @click="toProject(item.id)" height="268">
              </div>
              <div class="projects__content" >
                <h4 @click="toProject(item.id)">
                    {{item.caption}}
                </h4>
                <div class="skill mb-30">
                  <p><a>目标金额 {{item.targetPrice}}</a></p>
                    <el-progress  :text-inside="true" :stroke-width="13"  status="success" :percentage="percentage(item.preparePrice,item.targetPrice)" ></el-progress>
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
        <!-- 分页 -->
        <el-pagination
            class="pagination-container"
            background
            @current-change="currentChange"
            :current-page="pagination.currentPage"
            :total="pagination.total"

            layout="total, prev, pager, next, jumper"
        />
      </b-container>
    </section>
    <!--project-area end-->

  </div>
</template>

<script>
export default {
  name: "project",
  data() {
    return {
      percentage1: "",
      projectList: [], //
      title: '标题内容',
      typeList: [], //
      latestList: [], //
      pagination: { // 分页相关模型数据
        currentPage: 1, // 当前页码
        pageSize: 6, // 每页显示的记录数
        total: 0, // 总记录数
        queryString: null // 查询条件
      },
      blogInfo: {},
    }
  },
  created() {
    this.listProjects()
  },
  methods: {
    currentChange(current) {
      this.current = current;
      this.projectList();
    },
    listProjects() {
      this.axios.post("/api/home/project/project", this.pagination)
          .then(({ data }) => {
            this.projectList = data.data.records;
            this.total = data.data.total;
            this.loading = false;
          });
    },
    toProject(projectId){
      this.$store.state.projectId = projectId;
      this.$router.push(`/home/project/${projectId}`);
    },
    handleCurrentChange (currentPage) {
      // 设置最新的页码
      this.pagination.currentPage = currentPage
      // 重新调用findPage方法进行分页查询
      this.listProjects()
    },
    handleSizeChange (newSize) {
      this.pagination.pageSize = newSize
      this.listProjects()
    },
    percentage(preparePrice,targetPrice) {
      return (preparePrice / targetPrice)*100
    },
  },


}
</script>

<style scoped>
.pagination-container {
  float: right;
  margin-top: 1.25rem;
  margin-bottom: 1.25rem;
}
</style>