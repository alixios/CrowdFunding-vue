<template>
  <div class="main-card">
    <!-- 表格展示 -->
    <el-table
        border
        :data="dataList"
        v-loading="loading"
    >

      <!-- 文章封面 -->
      <el-table-column
          prop="headPic"
          label="文章封面"
          width="100"
          align="center"
      >
        <template slot-scope="scope">
          <el-image
              class="article-cover"
              :src="
              scope.row.headPic
                ? scope.row.headPic
                : 'https://www.static.talkxj.com/articles/c5cc2b2561bd0e3060a500198a4ad37d.png'
            "
          />
        </template>
      </el-table-column>
      <!-- 文章标题 -->
      <el-table-column prop="caption" label="标题" align="center" />
      <!-- 文章分类 -->
      <el-table-column
          prop="categoryName"
          label="分类"
          width="80"
          align="center"
      />
      <!-- 文章开始时间 -->
      <el-table-column
          prop="start"
          label="开始时间 "
          width="120"
          align="center"
      >
        <template slot-scope="scope">
          <i class="el-icon-time" style="margin-right:5px" />
          {{ scope.row.start | date }}
        </template>
      </el-table-column>
      <!--结束时间 -->
      <el-table-column
          prop="end"
          label="开始时间 "
          width="120"
          align="center"
      >
        <template slot-scope="scope">
          <i class="el-icon-time" style="margin-right:5px" />
          {{ scope.row.end | date }}
        </template>
      </el-table-column>
      <!-- 目标金额  -->
      <el-table-column prop="targetPrice" width="100" label="目标金额" align="center" />
      <!-- 发布人 -->
      <el-table-column prop="homeUserName" width="120" label="发布人" align="center" />
      <!-- 状态 -->
      <el-table-column prop="status" label="状态" width="100" align="center" >
        <template slot-scope="scope" >
          {{projectStatus(scope.row.status).name}}
        </template>
      </el-table-column>
      <!-- 类型 -->
      <el-table-column prop="type" label="类型" width="80" align="center" >
        <template slot-scope="scope" >
          {{projectType(scope.row.type).name}}
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="200">
        <template slot-scope="scope">
          <el-button
              type="success"
              size="mini"
              style="margin-left: 5px"
              @click="submit_audit(scope.row.id)"
          >
            提交审核
          </el-button>

          <el-button
              type="primary"
              size="mini"
              style="margin-left: 5px"
              @click="editProject(scope.row.id)"
          >
            编辑
          </el-button>

          <el-button
              type="success"
              size="mini"
              style="margin-top: 5px;margin-left: 5px"
              @click="feedBack(scope.row.id)"
          >
            添加回馈
          </el-button>

          <el-popconfirm
              title="确定删除吗？"
              style="margin-left: 5px"
              @confirm="deleteProject(scope.row.id)"
          >
            <el-button size="mini" type="danger" slot="reference">
              删除
            </el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
  <div id="page">

  </div>
  </div>
</template>

<script>
export default {
name: "ProjectIndex",
  data() {
    return {
      dataList: [],
      pagination: { // 分页相关模型数据
        currentPage: 1, // 当前页码
        pageSize: 6, // 每页显示的记录数
        total: 0, // 总记录数
        queryString: null // 查询条件
      },
    }
  },
  created() {
    this.getIndexProjectList()
  },
  methods: {
    getIndexProjectList() {
      this.axios.post("/api/home/project/index",this.pagination).then(({data}) => {
        if(data.flag){
          this.dataList = data.data.records

        }else {
          this.$message.error(data.message)
        }
      })
    },
    submit_audit(projectId) {
      this.axios.post(`/api/home/project/submit_audit/${projectId}`).then(({data}) => {
        if(data.flag){
          this.$message.success(data.message)
          this.getIndexProjectList()
        }else {
          this.$message.error(data.message)
        }
      })
    },
    editProject(projectId){
      this.$router.push({ path: "/project/add/" + projectId });
    },
    deleteProject(projectId){
      this.axios.delete( "/api/home/project/delete/"+ projectId).then(({data}) => {
        if(data.flag){
          this.$message.success(data.message)
          this.getIndexProjectList()
        }else {
          this.$message.error(data.message)
        }
      })
    },
    feedBack(projectId){
      this.$router.push({ path: "/home/feed_back/index/" + projectId });
    }
  },
  computed: {
    projectStatus() {
      return function (status) {
        var name = "";
        switch (status) {
          case 0:
            name = "未提交";
            break;
          case 1:
            name = "待审核";
            break;
          case 2:
            name = "通过";
            break;
          case 3:
            name = "未通过";
            break;
          case 4:
            name = "募款";
            break;
          case 5:
            name = "结束";
            break;
        }
        return {
          name: name
        };
      };
    },
    projectType() {
      return function (type) {
        var name = "";
        switch (type) {
          case 0:
            name = "公益";
            break;
          case 1:
            name = "非公益";
            break;
        }
        return {
          name: name
        };
      };
    },
  }
}
</script>

<style scoped>
.main-card {
  padding-left: 80px;
  padding-right: 80px;
}
.article-cover {
  position: relative;
  width: 70px;

}
.article-cover::after {
  content: "";
  background: rgba(0, 0, 0, 0.3);
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
}
</style>