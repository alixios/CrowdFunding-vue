<template>
  <div>
    <!--page-title-area start-->
    <section class="page-title-area" >
      <div class="right-border-shape">
        <img src="/home/images/shape/02.png" alt="">
      </div>
      <div class="container">
        <div class="row">
          <div class="col-xl-10 offset-xl-1">
            <div class="page-title-wrapper text-center">
              <h1 class="page-title wow fadeInUp2 animated" data-wow-delay='.1s'>新闻列表</h1>
              <div class="breadcrumb">
                <ul class="breadcrumb-list wow fadeInUp2 animated" data-wow-delay='.3s'>
                  <li><a href="/home/index/index">首页<i>
                    <font-awesome-icon :icon="['fas', 'chevron-right']"/>
                  </i></a></li>
                  <li><a class="active">新闻列表</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--page-title-area area-->
    <!--blog-area start-->
    <section class="blog-area pt-130 pb-100">
      <b-container>
        <b-row cols="3">
          <div v-for="item in newsList" :key="item.id">
            <b-col>
              <div class=" wow fadeInUp2 animated" data-wow-delay='.1s'>
                <div class="blogs mb-30">
                  <div class="blogs__thumb pos-rel mb-45">
                    <div class="blogs__thumb--img">
                      <img :src="item.picture" alt="" style="width: 366px;height: 247px;">
                    </div>
                    <a class="blog-tag" href="/home/news/detail?id=${news.id}">{{ item.typeName }}</a>
                  </div>
                  <div class="blogs__content">
                    <div class="blogs__content--meta mb-15">
                      <span><i class="far fa-calendar-alt"></i>{{ item.createTime }}</span>
                    </div>
                    <h4 class="mb-20"><a href="/home/news/detail?id=${news.id}">{{ item.caption }}</a></h4>
                    <ul class="project-manager">
                      <li>
                        <a href="#">
                          <img :src="item.headPic" alt="" style="width: 40px;height: 40px;">
                          <span>{{ item.homeUserName }}</span>
                        </a>
                      </li>
                      <li>
                        <a class="more_btn_02" href="/home/news/detail?id=${news.id}">阅读更多<i
                            class="fa fa-arrow-right"></i></a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </b-col>
          </div>
        </b-row>
        <div id="page" style="text-align: center">

        </div>
      </b-container>
    </section>
    <!--blog-area end-->
  </div>
</template>

<script>
export default {
  name: "news",
  data() {
    return {
      newsList: [], //
      title: '标题内容',
      pagination: { // 分页相关模型数据
        currentPage: 1, // 当前页码
        pageSize: 6, // 每页显示的记录数
        total: 0, // 总记录数
        queryString: null // 查询条件
      },
    }
  },
  created() {
    this.listNews()
  },
  methods: {
    currentChange(current) {
      this.current = current;
      this.projectList();
    },
    listNews() {
      this.axios.post("/api/home/news/newsList", this.pagination)
          .then(({data}) => {
            this.newsList = data.data.records;
            this.total = data.data.total;
            this.loading = false;
          });
    },
    toProject(projectId) {
      this.$store.state.projectId = projectId;
      this.$router.push(`/home/project/${projectId}`);
    },
    handleCurrentChange(currentPage) {
      // 设置最新的页码
      this.pagination.currentPage = currentPage
      // 重新调用findPage方法进行分页查询
      this.listProjects()
    },
    handleSizeChange(newSize) {
      this.pagination.pageSize = newSize
      this.listProjects()
    }
  }
}
</script>

<style scoped>

</style>