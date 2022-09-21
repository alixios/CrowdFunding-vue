<template>
  <div class="main-card">
    <el-button
        type="success"
        size="max"
        style="float: right;  margin-bottom: 10px"
        @click="addFeedBAck(projectId)"
    >
      添加回馈
    </el-button>
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
      <el-table-column prop="caption" label="回馈标题" align="center"/>
      <!-- 文章标题 -->
      <el-table-column prop="projectCaption" label="项目标题" align="center"/>
      <!-- 文章开始时间 -->
      <el-table-column
          prop="start"
          label="发放时间"
          width="120"
          align="center"
      >
        <template slot-scope="scope">
          <i class="el-icon-time" style="margin-right:5px"/>
          {{ scope.row.grantDate | date }}
        </template>
      </el-table-column>

      <!-- 目标金额  -->
      <el-table-column prop="price" width="100" label="金额" align="center"/>
      <!-- 份数 -->
      <el-table-column prop="count" label="份数" align="center"/>
      <el-table-column label="操作" align="center" width="200">
        <template slot-scope="scope">
          <el-button
              type="primary"
              size="mini"
              style="margin-left: 5px"
              @click="editFeedBack(scope.row.id)"
          >
            编辑
          </el-button>
          <el-popconfirm
              title="确定删除吗？"
              style="margin-left: 5px"
              @confirm="deleteFeedBack(scope.row.id)"
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
  name: "FeedBackIndex",
  data() {
    return {
      dataList: [],
      projectId: "",
    }
  },
  created() {
    this.initFeedBackList()
  },
  methods: {
    initFeedBackList() {
      const path = this.$route.path;
      const arr = path.split("/");
      const projectId = arr[4];
      this.projectId = projectId
      if (projectId) {
        console.log("====" + this.projectId)
        this.axios.get(`/api/home/feed_back/index/${projectId}`).then(({data}) => {
          this.dataList = data.data;
        });
      }
    },
    addFeedBAck(){
      this.$router.push({path: "/home/feed_back/add"});
    },
    editFeedBack(projectId) {
      this.$router.push({path: "/home/feed_back/add/" + projectId});
    },
    deleteFeedBack(feedBackId) {
      this.axios.delete(`/api/home/feed_back/delete/${feedBackId}`).then(({data}) => {
        if (data.flag) {
          this.$message.success(data.message)
          this.initFeedBackList()
        } else {
          this.$message.error(data.message)
        }
      })
    },
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