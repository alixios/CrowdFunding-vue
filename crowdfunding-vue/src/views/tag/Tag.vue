<template>
  <el-card class="main-card">

    <!-- 表格展示 -->
    <el-table
        border
        :data="dataList"
        @selection-change="selectionChange"
        v-loading="loading"
    >
      <!-- 表格列 -->
      <el-table-column type="selection" width="55" />
      <!-- 分类名 -->
      <el-table-column prop="name" label="分类名" align="center" />
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
      @size-change="sizeChange"
      @current-change="currentChange"
      :current-page="current"
      :page-size="size"
      :total="count"
      :page-sizes="[5, 10, 20]"
      layout="total, sizes, prev, pager, next, jumper"
    />

  </el-card>
</template>

<script>
export default {
  created() {
    this.listProjects();
  },
  data: function() {
    return {
      dataList: [],
      pagination: { // 分页相关模型数据
        currentPage: 1, // 当前页码
        pageSize: 6, // 每页显示的记录数
        total: 0, // 总记录数
        queryString: null // 查询条件
      },
    };
  },
  methods: {
    selectionChange(tagList) {
      this.tagIdList = [];
      tagList.forEach(item => {
        this.tagIdList.push(item.tagId);
      });
    },
    listProjects() {
      this.axios
          .post("/api/category/admin/typeList", this.pagination)
          .then(({data}) => {
            this.dataList = data.data.records;
            this.count = data.data.total;
            this.loading = false;
          });
    },
    openModel(tag) {
      if (tag != null) {
        this.tagForm = JSON.parse(JSON.stringify(tag));
        this.$refs.tagTitle.innerHTML = "修改标签";
      } else {
        this.tagForm.id = null;
        this.tagForm.tagName = "";
        this.$refs.tagTitle.innerHTML = "添加标签";
      }
      this.addOrEdit = true;
    },
    addOrEditTag() {
      if (this.tagForm.tagName.trim() == "") {
        this.$message.error("标签名不能为空");
        return false;
      }
      this.axios
        .post("/api/tag/admin/saveOrUpdate", this.tagForm)
        .then(({ data }) => {
          if (data.flag) {
            this.$notify.success({
              title: "成功",
              message: data.message
            });
            this.listTags();
          } else {
            this.$notify.error({
              title: "失败",
              message: data.message
            });
          }
        });
      this.addOrEdit = false;
    }
  }
};
</script>
