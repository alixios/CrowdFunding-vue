import Vue from 'vue'
import VueRouter from "vue-router";

Vue.use(VueRouter)

//导入组件
const Login = () => import ('../views/home_user/login')
const index = () => import ('../views/index/index')

export default new VueRouter({
  mode: "history",
  routes: [
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/index',
      name: 'index',
      component: index
    }
  ]
})
