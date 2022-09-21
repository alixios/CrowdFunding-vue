<template>
  <div class="main">
    <div class="login" style="height:  auto;">
      <div v-model="registerForm" class="log-con layui-form" style="height: auto;">
        <span>注册</span>
        <div class="layui-form-item" style="padding: 4px 45px;">
          <input type="text" v-model="registerForm.name" name="name" id="name" class="layui-input" autocomplete="off" placeholder="请输入用户名"/>
        </div>
        <div class="layui-form-item" style="padding: 4px 45px;">
          <input type="text" v-model="registerForm.mobile"  name="mobile" id="mobile" autofocus="autofocus" class="layui-input" maxlength="11" autocomplete="off" placeholder="请输入手机号"/>
        </div>
        <div class="layui-form-item" style="padding: 4px 45px;">
          <input type="text" v-model="registerForm.email" name="email" id="email" class="layui-input" placeholder="请输入邮箱"/>
        </div>
        <div class="layui-form-item" style="padding: 4px 45px;">
          <input type="text" v-model="registerForm.idNumber" maxlength="18" autocomplete="off" name="idNumber" id="idNumber" class="layui-input"  placeholder="请输入身份证号"/>
        </div>
        <div class="layui-form-item" style="padding: 4px 45px;">
          <input type="password" v-model="registerForm.password" name="password" id="password" class="layui-input" placeholder="请输入密码"/>
        </div>
        <div class="layui-form-item" style="padding: 4px 45px;">
          <input type="button" value="注册" class="layui-btn layui-btn-normal" @click="register" style="width: 100%;" id="register-btn"/>
        </div>
        <div class="layui-form-item" style="text-align: center;">
          <a style="color: #FFF;" href="/home/homeUser/login">登录</a>
        </div>

      </div>
    </div>
  </div>
</template>

<script>
import '../../assets/css/login.css'
import '../../assets/js/login'
import axios from "axios";
export default {
name: "register",
  data() {
    return {
      registerForm: {
        name: "",
        mobile: "",
        email: "",
        verKey: "",
        idNumber: "",
        password: "",
      },
      // 这是表单的验证规则对象
      loginFormRules: {
        // 验证用户名是否合法
        username: [
          { required: true, message: '请输入登录名称', trigger: 'blur' },
          { min: 3, max: 15, message: '长度在 3 到 15 个字符', trigger: 'blur' }
        ],
        // 验证密码是否合法
        password: [
          { required: true, message: '请输入登录密码', trigger: 'blur' },
          { min: 6, max: 20, message: '长度在 6 到 20 个字符', trigger: 'blur' }
        ],
        // 验证码
        code: [
          { required: true, message: '请输入验证码', trigger: 'blur' }
        ],
        nickname: [
          { required: true, message: '请输入昵称', trigger: 'blur' },
          { min: 3, max: 15, message: '长度在 3 到 15 个字符', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    register() {
      axios.post("/api/home/homeUser/register",this.registerForm).then(({data})=>{
        if (data.flag) {
          console.log("成功")
          this.$message.success("注册成功，去登录吧！");
        }else{
          this.$message.error(data.message);
        }
      })
    }
  }
}
</script>

<style scoped>

</style>