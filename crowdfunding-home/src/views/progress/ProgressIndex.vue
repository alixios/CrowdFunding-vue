<template>
  <div class="main-card">
    <el-button
        type="success"
        size="max"
        style="float: right;  margin-bottom: 10px"
        @click="editProgress(projectId)"
    >
      添加进展
    </el-button>
    <!-- 表格展示 -->
    <el-table
        border
        :data="dataList"
        v-loading="loading"
    >
      <!-- 文章标题 -->
      <el-table-column prop="caption" label="回馈标题" align="center"/>
      <!-- 文章标题 -->
      <el-table-column prop="projectCaption" label="项目标题" align="center"/>

      <!-- 内容  -->
      <el-table-column prop="content"  label="内容" align="center"/>
      <!-- 图片 -->
      <el-table-column
          prop="headPic"
          label="图片"
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
      <el-table-column label="操作" align="center" width="200">
        <template slot-scope="scope">
          <el-popconfirm
              title="确定删除吗？"
              style="margin-left: 5px"
              @confirm="deleteProgress(scope.row.id)"
          >
            <el-button size="mini" type="danger" slot="reference">
              删除
            </el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>

  </div>
</template>

<script>
export default {
name: "ProgressIndex",
  data() {
    return {
      dataList: [],
      projectId: "",
    }
  },
  created() {
    this.initProgressList()
  },
  methods: {
    initProgressList() {
      const path = this.$route.path;
      const arr = path.split("/");
      const projectId = arr[4];
      this.projectId = projectId
      if (projectId) {
        console.log("====" + this.projectId)
        this.axios.get(`/api/progress/index/${projectId}`).then(({data}) => {
          this.dataList = data.data;
        });
      }
    },

    editProgress(projectId) {
      this.$router.push({path: "/home/progress/add/" + projectId});
    },
    deleteProgress(progressId) {
      this.axios.delete(`/api/progress/delete/${progressId}`).then(({data}) => {
        if (data.flag) {
          this.$message.success(data.message)
          this.initProgressList()
        } else {
          this.$message.error(data.message)
        }
      })
    },
  },
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