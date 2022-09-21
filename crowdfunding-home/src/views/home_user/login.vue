<template>
  <div class="contain">
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
          <a style="color: #FFF; " href="/home/homeUser/register">注册</a>
          <a style="color: #FFF; margin-left: 20px" href="/home/index/index">首页</a>
          <a style="color: #FFF; margin-left: 20px" href="http://localhost:8081/login">前往后台</a>
        </div>
      </div>
    </div>
  </div>

  </div>
</template>

<script>


import axios from "axios";

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
      axios.get("/api/captcha").then(({data}) => {
        console.log(data.data)
        this.verifyCode = data.data

      })
    },
    login() {
      axios.post("/api/home/homeUser/login",this.loginForm).then(({data})=>{
        if (data.flag) {
          window.sessionStorage.setItem('uid', data.data.uid)
          this.$message.success("登陆成功");
          console.log(data.data)
          this.$store.commit("login", data.data);
          this.$router.push("/home/index/index");
        }else{
          this.$message.error(data.message);
        }
      })
    }
  }
}
</script>

<style scoped>
.contain {
  margin: 0;
  overflow: hidden;
  background: linear-gradient(to bottom, #19778c, #095f88);
  background-size:1400% 300%;
  animation: dynamics 6s ease infinite;
  -webkit-animation: dynamics 6s ease infinite;
  -moz-animation: dynamics 6s ease infinite;
  font-size: 14px;
  color: #ffffff;
  min-height: 700px;
}
/*登录样式*/
.main {
  position: fixed;
  text-align: center;
  top: 130px;
  width: 100%;
  height: auto;
  display: flex;
  justify-content: center;
}
.login {
  width: 470px;
  height:470px;
  background: linear-gradient(to bottom, #19778c, #095f88);
  animation: dynamics 6s ease infinite;
  -webkit-animation: dynamics 6s ease infinite;
  -moz-animation: dynamics 6s ease infinite;
  opacity: 0.9;
  border: solid 1px #13a1fc;
  background-size:1400% 300%;
}
@keyframes dynamics {
  0% {
    background-position: 0% 0%;
  }
  50% {
    background-position: 50% 100%;
  }
  100% {
    background-position: 100% 0%;
  }
}
.log-con {
  background: linear-gradient(#13a1fc, #13a1fc) left top, linear-gradient(#13a1fc, #13a1fc) left top,
  linear-gradient(#13a1fc, #13a1fc) right top, linear-gradient(#13a1fc, #13a1fc) right top,
  linear-gradient(#13a1fc, #13a1fc) left bottom, linear-gradient(#13a1fc, #13a1fc) left bottom,
  linear-gradient(#13a1fc, #13a1fc) right bottom, linear-gradient(#13a1fc, #13a1fc) right bottom;
  background-repeat: no-repeat;
  background-size: 3px 20px, 20px 3px;
  height: 100%;
  margin: -2px;
  padding: 3px 1px 1px 0;
  border-radius: 3px;
}
.log-con >span {
  font-size: 30px;
  font-weight: bold;
  line-height: 24px;
  letter-spacing: 2px;
  display: block;
  margin: 20px 0 44px 0;
}
.log-con >span::after {
  display: block;
  content: '';
  width: 57px;
  height: 3px;
  background: #ffffff;
  margin-top: 16px;
  justify-content: center;
  position: relative;
  left: 206px;
}
.log-con>input {
  display: block;
  margin: 10px 0 32px 70px;
  width: 330px;
  height: 42px;
  background-color: #ffffff;
  border-radius: 4px;
  opacity: 0.9;
  border: 0;
  font-size: 16px;
  outline: none;
  padding-left: 10px;
  color: #000000;
}
.log-con>a {
  width: 340px;
  height: 44px;
  background-color: #0090ff;
  border-radius: 4px;
  display: block;
  margin: 10px 0 0 70px;
  text-align: center;
  line-height: 44px;
  cursor: pointer;
  opacity: 1;
}

input::-webkit-input-placeholder {
  color: #000000;
  font-size: 16px;
}
.log-con>.code {
  width: 216px;
  display: inline-block;
  margin-left: 6px;
}
.log-con>#code {
  width: 94px;
  display: inline-block;
  margin-left: 14px;
  cursor: pointer;
}
/*logo*/
.logo {
  width: 168px;
  height: 75px;
  position: fixed;
  left: 150px;
  top: 26px;
}
.logo>img {
  max-width: 100%;
  max-height: 100%;
}


.layui-layer-dialog .layui-layer-padding {
  padding: 20px 20px 20px 55px;
  text-align: left;
  color: #000;
}
</style>
