<template>
  <div>
  <!--page-title-area start-->
  <section class="page-title-area" style="background-image:url(/home/images/faq/faq.jpg);">
    <div class="right-border-shape">
      <img src="/home/images/shape/02.png" alt="">
    </div>
    <div class="container">
      <div class="row">
        <div class="col-xl-10 offset-xl-1">
          <div class="page-title-wrapper text-center">
            <h1 class="page-title wow fadeInUp2 animated" data-wow-delay='.1s'>常见问答</h1>
            <div class="breadcrumb">
              <ul class="breadcrumb-list wow fadeInUp2 animated" data-wow-delay='.3s'>
                <li><a href="/home/index/index">首页<i>
                  <font-awesome-icon :icon="['fas', 'chevron-right']"/>
                </i></a></li>
                <li><a class="active">常见问答</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--page-title-area area-->
  <!--page-title-area area-->
  <section class="faq-area-02 grey-bg pt-130 pb-100">
    <div class="container">
      <div class="row">
        <div class="col-xl-8 col-lg-8">
          <div class="faq-content mb-30">
            <div id="accordion">
              <div v-for="item in dataList" :key="item.id">
              <div class="card card-bg card-02 mb-15 wow fadeInUp2 animated" data-wow-delay='.1s' >
                <div class="card-header" id="heading${problem_index}">
                  <h5 class="mb-0">
                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapse${problem_index}"aria-expanded="false" aria-controls="collapseOne">

                    </button>
                  </h5>
                </div>
                <div id="collapse${problem_index}" class="collapse" aria-labelledby="heading${problem_index}" data-parent="#accordion">
                  <div class="card-body">
                    <p>{{problem.answer}}</p>
                  </div>
                </div>
              </div>
              </div>
          </div>
        </div>
      </div>
      <div class="col-xl-4 col-lg-4 col-md-12">
        <div class="faq-right">
          <div class="widget white-bg mb-40 wow fadeInUp2 animated" data-wow-delay='.1s'>
            <div class="widget-contact-box pos-rel">
              <h4>联系我们</h4>
              <p>桂林理工大学</p>
              <ul class="fot-list address-list mb-20">
                <li><i class="far fa-map-marker-alt"></i> 广西桂林市雁山镇</li>
                <li><i class="far fa-envelope"></i> 17869097651@qq.com</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
  </section>
  <!--cta-area end-->
  </div>
</template>

<script>
export default {
  name: "faq",
  data() {
    return {
      dataList: [], //
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
    this.getFQA()
  },
  methods: {
    getFQA() {
      this.axios.get("/api/home/common_problem/index")
          .then(({ data }) => {
            this.dataList = data.data;
            this.loading = false;
          });
    },
  }
}
</script>

<style scoped>

</style>