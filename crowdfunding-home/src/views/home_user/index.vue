<template>
  <div>
    <div class="box-container layui-form" lay-filter="main">
      <div class="layui-row layui-col-space15">
        <div class="layui-col-md3">
          <img class="user-image" :src="userInfo.headPic" id="upload_headPic"/>
        </div>
        <div class="layui-col-md9">
          <div class="layui-row pdding-left-right5">
            <span>姓名:</span>{{ userInfo.name }}
          </div>
          <div class="layui-row pdding-left-right5">
            <span>性别:</span>
            <i class="layui-icon layui-icon-female" style="color: dodgerblue"></i>
          </div>
          <div class="layui-row pdding-left-right5">
            <span>邮箱:</span>{{ userInfo.email }}
          </div>
          <div class="layui-row pdding-left-right5">
            <span>手机号:</span>{{ userInfo.mobile }}
          </div>
          <div class="layui-row pdding-left-right5">
            <span>余额:</span>{{ userInfo.balance }}元
          </div>
          <div class="layui-row pdding-left-right5">
            <span>其他操作:</span>
            <a href="javascript:M.recharge();" style="margin-left: 15px;">点击充值</a>
            <a href="javascript:M.withdraw();" style="margin-left: 15px;">申请提现</a>
            <a href="javascript:M.addBackCard();" style="margin-left: 15px;">添加银行卡</a>
            <a href="javascript:M.addLocations();" style="margin-left: 15px;">添加收货地址</a>
          </div>
        </div>
      </div>

    </div>


  <el-tabs class="tabs-container"  type="border-card" v-model="activeName" @tab-click="handleClick">
    <el-tab-pane label="个人信息" name="first">
    </el-tab-pane>
    <el-tab-pane label="我的众筹" name="second">
      <!-- 表格展示 -->
      <el-table
          border
          :data="projectList"
      >
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
        <el-table-column prop="homeUserName" width="120" label="已筹金额" align="center" />
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
      <!-- 分页 -->
      <el-pagination
          class="pagination-container"
          background
          @current-change="currentChange"
          :current-page="pagination.currentPage"
          :total="pagination.total"

          layout="total, prev, pager, next, jumper"
      />
    </el-tab-pane>
    <el-tab-pane label="我的捐赠" name="third">我的捐赠</el-tab-pane>
    <el-tab-pane label="地址管理" name="fourth">地址管理</el-tab-pane>
    <el-tab-pane label="我的收藏" name="fifth">我的收藏</el-tab-pane>
    <el-tab-pane label="银行卡管理" name="sixth">银行卡管理</el-tab-pane>
    <el-tab-pane label="充值记录" name="seventh">充值记录</el-tab-pane>
    <el-tab-pane label="提现记录" name="eighth">提现记录</el-tab-pane>
    <el-tab-pane label="赠品接收" name="ninth">赠品接收</el-tab-pane>
    <el-tab-pane label="我的新闻" name="tenth">我的新闻</el-tab-pane>

  </el-tabs>
  </div>
</template>

<script>

export default {
  name: "index",
  data() {
    return {
      loading: true,
      activeName: 'second',
      userInfo: "",
      projectList: [], //
      pagination: { // 分页相关模型数据
        currentPage: 1, // 当前页码
        pageSize: 5, // 每页显示的记录数
        total: 0, // 总记录数
        queryString: null // 查询条件
      },
    }
  },
  created() {
    this.getUserInfo();
    this.getProjectList();
  },
  methods: {
    currentChange(current) {
      this.current = current;
      this.projectList();
    },
    handleClick(tab, event) {
      console.log(tab, event);
    },
    getUserInfo() {
      this.axios.get("/api/home/homeUser/userInfo")
          .then(({data}) => {
            this.userInfo = data.data;

          });
    },
    getProjectList() {
      this.axios.post("/api/home/homeUser/projectList",this.pagination).then(({data}) => {
        if(data.flag){
          this.projectList = data.data.records

        }else {
          this.$message.error(data.message)
        }
      })
    },
    submit_audit(projectId) {
      this.axios.post(`/api/home/project/submit_audit/${projectId}`).then(({data}) => {
        if(data.flag){
          this.$message.success(data.message)
          this.getProjectList()
        }else {
          this.$message.error(data.message)
        }
      })
    },
    editProject(projectId){
      this.$router.push({ path: "/project/add/" + projectId });
    },
    not_pass(notPassReason){
      this.$alert(notPassReason, '未通过原因' );
    },
    goAcceptList(projectId){
      this.$router.push({ path: "/home/accept/list/" + projectId });
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
.tabs-container{
  margin-left: 110px;
  margin-right: 110px;
  margin-bottom: 10px;
}
.pagination-container {
  float: right;
  margin-top: 1.25rem;
  margin-bottom: 1.25rem;
}
.box-container {
  font-family: "Poppins", sans-serif;
  font-size: 15px;
  line-height: 28px;
  font-weight: 400;
  font-style: normal;
  color: #716ca2;
  width: 960px;
  height: 250px;
  min-height:150px;
  margin: 15px auto;
}

.user-image {
  height: 125px;
  border-radius: 4px;
  width: 75%;
  object-fit: cover;
  margin-left: 20px;
}

.pdding-left-right5 {
  padding: 5px 0px;
}

.pdding-left-right15 {
  display: inline-block;
  margin: 0px 15px;
  padding: 15px 0px;
}

</style>
