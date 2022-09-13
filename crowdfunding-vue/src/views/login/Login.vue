<template>
  <div class="login-container">
    <div class="login-card">
      <div class="login-title">管理员登录</div>
      <!-- 登录表单 -->
      <el-form
        status-icon
        :model="loginForm"
        :rules="rules"
        ref="ruleForm"
        class="login-form"
      >
        <!-- 用户名输入框 -->
        <el-form-item prop="username">
          <el-input
            v-model="loginForm.username"
            prefix-icon="el-icon-user-solid"
            placeholder="用户名"
            @keyup.enter.native="login"
          />
        </el-form-item>
        <!-- 密码输入框 -->
        <el-form-item prop="password">
          <el-input
            v-model="loginForm.password"
            prefix-icon="iconfont el-icon-mymima"
            show-password
            placeholder="密码"
            @keyup.enter.native="login"
          />
        </el-form-item>
      </el-form>
      <!-- 登录按钮 -->
      <el-button type="primary" @click="login()">登录</el-button>
    </div>
  </div>
</template>

<script>
import { generaMenu } from "../../assets/js/menu";
export default {
  data: function() {
    return {
      loginForm: {
        username: "孔半仙",
        password: "123456",
        code: "",
        verKey: ""
      },
      verifyCode: "",
      rules: {
        username: [
          { required: true, message: "用户名不能为空", trigger: "blur" }
        ],
        password: [{ required: true, message: "密码不能为空", trigger: "blur" }]
      }
    };
  },
  methods: {
    login() {
      // Spring Security 要求用form表单提交post请求
      this.$refs.ruleForm.validate(valid => {
        // if (valid) {
        //
        // }
        if (valid) {
          const _this = this;

          _this.axios.post("/api/login", _this.loginForm).then(({data}) => {
            if (data.flag) {
              _this.$message.success(data.message);
              //_this.$store.commit("set_token",data.data.token)
              //_this.$store.state.token = data.data.token;
              //_this.$store.commit("login", data.data.user);
              // 登录后保存用户信息
              // 加载用户菜单
              generaMenu();
              _this.$message.success("登录成功");
              _this.$router.push({ path: "/" });
            }/* else {
              _this.$message.error(data.message);
            }*/
          });
       /*   const _this = this;
          // eslint-disable-next-line no-undef
          var captcha = new TencentCaptcha(
            this.config.TENCENT_CAPTCHA,
            function(res) {
              if (res.ret === 0) {
                _this.axios.post("/api/login", _this.loginForm).then( response => {
                    if (response.flag) {
                      _this.$message.success(response.message);
                      _this.$store.commit("set_token",response.data.token)
                      _this.$store.state.token = response.data.token;
                      _this.$store.commit("login", response.data.user);
                      // 登录后保存用户信息
                      // 加载用户菜单
                      generaMenu();
                      _this.$message.success("登录成功");
                      _this.$router.push({ path: "/" });
                    } else {
                      _this.$message.error(response.message);
                    }
                  });
              }
            }
          );
          // 显示验证码;
          captcha.show();*/
        } else {
          return false;
        }
      });
    }
  }
};
</script>

<style scoped>
.login-container {
  position: absolute;
  top: 0;
  bottom: 0;
  right: 0;
  left: 0;
  background: url(http://images.newstar.net.cn/img/default-bg.jpeg)
    center center / cover no-repeat;
}
.login-card {
  position: absolute;
  top: 0;
  bottom: 0;
  right: 0;
  background: #fff;
  padding: 170px 60px 180px;
  width: 350px;
}
.login-title {
  color: #303133;
  font-weight: bold;
  font-size: 1rem;
}
.login-form {
  margin-top: 1.2rem;
}
.login-card button {
  margin-top: 1rem;
  width: 100%;
}
</style>
