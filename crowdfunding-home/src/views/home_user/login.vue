<template>
  <div>
  <div class="main">
    <div class="login">
      <div class="log-con layui-form" v-model="loginForm">
        <span>登录</span>
        <div class="layui-form-item" style="padding: 7px 45px;">
          <input type="text" class="layui-input"  v-model="loginForm.email"  id="email" name="email" placeholder="请输入邮箱"/>
        </div>
        <div class="layui-form-item" style="padding: 7px 45px;">
          <input type="password" class="layui-input"  v-model="loginForm.password"  id="password" name="password" placeholder="请输入密码"/>
        </div>
        <div class="layui-form-item layui-row layui-col-space15" style="padding: 7px 45px;">
          <div class="layui-col-md8">
            <input type="text" class="layui-input"  v-model="loginForm.verKey" id="code" name="code" placeholder="请输入验证码" maxlength="4"/>
          </div>
          <div class="layui-col-md4">
            <img v-bind:src="verifyCode"
                 @click="getVerifyCode()"
                 width="130px" height="38px" style="float: right;cursor:pointer;" />

          </div>
        </div>
        <div class="layui-form-item" style="padding: 7px 45px;">
          <input type="button" value="登录" class="layui-btn layui-btn-normal" @click="login()" style="width: 100%;"/>
        </div>
        <div class="layui-form-item" style="padding:0px 45px;">
          <input type="button" value="忘记密码" class="layui-btn layui-btn-normal" style="width: 100%;" onclick="openDialog()"/>
        </div>
        <div class="layui-form-item" style="text-align: center;">
          <a style="color: #FFF;" href="/home/homeUser/register">注册</a>
          <a style="color: #FFF;" href="/home/index/index">首页</a>
          <a style="color: #FFF;" href="/system/login">前往后台</a>
        </div>
      </div>
    </div>
  </div>

  </div>
</template>

<script>


import axios from "axios";
import '../../assets/css/login.css'
import '../../assets/js/login'

export default {
  name: "login",
  data: function (){
    return {
      loginForm: {
        email: "",
        password: "",
        key: "",
        verKey: "",
      },
      verifyCode: "",
    }
  },
  created () {
    this.getVerifyCode()
  },
  methods: {
    getVerifyCode() {
      axios.get("http://localhost:10010/captcha").then(({data}) => {
        console.log(data.data)
        this.verifyCode = data.data

      })
    },
    login() {
      const _this = this;

      axios.post("http://localhost:10010/home/homeUser/login",_this.loginForm).then(({data})=>{
        if (data.flag) {
          console.log("登陆成功")
          _this.$message.success(data.message);
          //_this.$router.push({ path: "/" });
        }
      })
    }
  }
}
</script>

<style scoped>
#logincaptcha
{
  width: 100%;
  height: 38px;
}

.layui-form-label
{
  color: black;
}

.layui-layer-dialog .layui-layer-padding {
  padding: 20px 20px 20px 55px;
  text-align: left;
  color: #000;
}
</style>
