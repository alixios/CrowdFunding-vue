<template>
  <el-card class="main-card">
    <div class="title">{{ this.$route.name }}</div>
    <br/>
    <!-- 表格操作 -->
    <div class="operation-container">



      <!-- 条件筛选 -->
      <div style="margin-left:auto">

        <!-- 分类 -->
        <el-select
            clearable
            size="small"
            v-model="typeId"
            filterable
            placeholder="请选择分类"
            style="margin-right:1rem"
        >
          <el-option
              v-for="item in typeList"
              :key="item.typeId"
              :label="item.typeName"
              :value="item.typeId"
          />
        </el-select>

        <!-- 文章名 -->
        <el-input
            clearable
            v-model="pagination.queryString"
            prefix-icon="el-icon-search"
            size="small"
            placeholder="请输入文章名"
            style="width:200px"
            @keyup.enter.native="searchArticles"
        />
        <el-button
            type="primary"
            size="small"
            icon="el-icon-search"
            style="margin-left:1rem"
            @click="searchArticles"
        >
          搜索
        </el-button>
      </div>
    </div>
    <!-- 表格展示 -->
    <el-table
        border
        :data="projectList"
        @selection-change="selectionChange"
        v-loading="loading"
    >
      <!-- 文章封面 -->
      <el-table-column
          prop="headPic"
          label="文章封面"
          width="80"
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
      <el-table-column prop="caption"   label="标题" align="center"/>
      <!-- 文章开始时间 -->
      <el-table-column
          prop="start"
          label="开始时间 "
          width="100"
          align="center"
      >

      </el-table-column>
      <!--结束时间 -->
      <el-table-column
          prop="end"
          label="开始时间 "
          width="100"
          align="center"
      >
      </el-table-column>
      <!-- 目标金额  -->
      <el-table-column prop="targetPrice" width="80" label="目标金额" align="center"/>
      <!-- 已筹金额  -->
      <el-table-column prop="preparePrice" width="80" label="已筹金额" align="center"/>
      <!-- 捐赠人次 -->
      <el-table-column prop="donationCount" width="80" label="捐赠人次" align="center"/>
      <!-- 发布人 -->
      <el-table-column prop="homeUserName" width="70" label="发布人" align="center"/>
      <!-- 状态 -->
      <el-table-column prop="status" label="状态" width="70" align="center">
        <template slot-scope="scope">
          {{ projectStatus(scope.row.status).name }}
        </template>
      </el-table-column>
      <!-- 类型 -->
      <el-table-column prop="type" label="类型" width="70" align="center">
        <template slot-scope="scope">
          {{ projectType(scope.row.type).name }}
        </template>
      </el-table-column>

      <el-table-column  label="审核" width="170" align="center">
        <template slot-scope="scope">
          <el-popconfirm
              title="审核通过"
              @confirm="successExamine(scope.row.id)"
          >
            <el-button v-show="scope.row.status==1" type="success" size="mini" slot="reference">
              通过
            </el-button>
          </el-popconfirm>
          <el-button v-show="scope.row.status==1" @click="failExamine(scope.row.id)" size="mini" type="danger" style="margin-left:5px">
              不通过
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页 -->
    <el-pagination
        class="pagination-container"
        background
        @current-change="currentChange"
        :current-page="pagination.currentPage"
        :total="pagination.total"

        layout="total, sizes, prev, pager, next, jumper"
    />
  </el-card>
</template>

<script>
export default {
  created() {
    this.listProjects();
    this.listCategories();
    this.listTags();
  },
  data: function () {
    return {
      loading: true,
      updateIsDelete: false,
      isDelete: 0,
      projectList: [],
      projectIdList: [],
      pagination: { // 分页相关模型数据
        currentPage: 1, // 当前页码
        pageSize: 6, // 每页显示的记录数
        total: 0, // 总记录数
        queryString: null // 查询条件
      },
    };
  },
  methods: {
    failExamine(projectId) {
      this.$prompt('请输入原因', '审核不通过', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
      }).then(({ value }) => {
        this.axios
            .post("/api/project/admin/examine",  {
                isPass: 3,
                projectId: projectId,
                not_pass: value,
              })
            .then(({ data }) => {
              if (data.flag) {
                this.$notify.success({
                  title: "审核成功",
                  message: data.message
                });
                this.listProjects();
              } else {
                this.$notify.error({
                  title: "失败",
                  message: data.message
                });
              }
            });
      })
    },
    selectionChange(projectList) {
      this.projectIdList = [];
      projectList.forEach(item => {
        this.projectIdList.push(item.id);
      });
    },
    currentChange(current) {
      this.current = current;
      this.listProjects();
    },

    successExamine(projectId){
      this.updateIsDelete = false;
      console.log("=="+projectId);
      this.axios
          .post("/api/project/admin/examine", {
              isPass: 2,
              projectId: projectId,
              not_pass: null,
            })
          .then(({ data }) => {
            if (data.flag) {
              this.$notify.success({
                title: "成功",
                message: data.message
              });
              this.listProjects();
            } else {
              this.$notify.error({
                title: "失败",
                message: data.message
              });
            }
          });
    },
    listProjects() {
      this.axios
          .post("/api/project/admin/listProjects", this.pagination)
          .then(({data}) => {
            this.projectList = data.data.records;
            this.count = data.data.total;
            this.loading = false;
          });
    },
    listCategories() {
      this.axios.get("/api/server/type/getTypeList").then(({data}) => {
        this.typeList = data.data;
      });
    },
    listTags() {
      this.axios.get("/api/server/tag/getTagList").then(({data}) => {
        this.tagList = data.data;
      });
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

    isActive() {
      return function (status) {
        return this.activeStatus == status ? "active-status" : "status";
      };
    }
  }
};
</script>

<style scoped>
.operation-container {
  margin-top: 1.5rem;
}

.article-status-menu {
  font-size: 14px;
  margin-top: 40px;
  color: #999;
}

.article-status-menu span {
  margin-right: 24px;
}

.status {
  cursor: pointer;
}

.active-status {
  cursor: pointer;
  color: #333;
  font-weight: bold;
}

.article-cover {
  position: relative;
  width: 60px;
  height: 60px;
  border-radius: 4px;
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

.article-status-icon {
  color: #fff;
  font-size: 1.5rem;
  position: absolute;
  right: 1rem;
  bottom: 1.4rem;
}
</style>
