import Vue from 'vue'
import VueRouter from "vue-router";

Vue.use(VueRouter)

//导入组件
const Login = () => import ('../views/home_user/login')
const index = () => import ('../views/index/index')
const about_us =() => import('../views/about_us/about_us')
const project =() => import('../views/project/project')
const news =() => import('../views/news/news')
const contact =() => import('../views/contact/contact')
const common_problem =() => import('../views/common_problem/faq')
const home_user =() => import('../views/home_user/index')
export default new VueRouter({
  mode: "history",
  routes: [
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/home/index/index',
      name: 'index',
      component: index
    },
    {
      path: '/home/about_us/index',
      name: 'index',
      component: about_us
    },
    {
      path: '/home/project/project',
      name: 'project',
      component: project
    },
    {
      path: '/home/news/list',
      name: 'news',
      component: news
    },
    {
      path: '/home/common_problem/index',
      name: 'common_problem',
      component: common_problem
    },
    {
      path: '/home/contact/index',
      name: 'contact',
      component: contact
    },
    {
      path: '/home/homeUser/index',
      name: 'homeUser',
      component: home_user
    },
  ]
})
