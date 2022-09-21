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

const project_detail = () => import('../views/project/ProjectDetail')
const project_add = () => import('../views/project/ProjectAdd')
const project_index = () => import('../views/project/ProjectIndex')
const project_published = () => import('../views/project/ProjectPublished')

const feed_back_index = () => import('../views/feed_back/FeedBackIndex')
const feed_back_add = () => import('../views/feed_back/FeedBackAdd')

const progress_index = () => import('../views/progress/ProgressIndex')
const progress_detail = () => import('../views/progress/ProgressDetail')
const progress_add = () => import('../views/progress/ProgressAdd')

const accept_list = () => import('../views/accept/acceptList')
const user_register =() => import('../views/home_user/register')

export default new VueRouter({
  mode: "history",
  routes: [
    {
      path: '',
      redirect: '/home/index/index'
    },
    {
      path: '/home/homeUser/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/home/homeUser/register',
      name: 'user_register',
      component: user_register
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
      path: '/home/project/:projectId',
      name: 'project_detail',
      component: project_detail
    },
    {
      path: '/project/add',
      name: 'project_add',
      component: project_add
    },
    {
      path: '/project/add/:projectId',
      name: 'project_add',
      component: project_add
    },
    {
      path: '/project/index',
      name: 'project_index',
      component: project_index
    },
    {
      path: '/project/published',
      name: 'project_published',
      component: project_published
    },
    {
      path: '/home/feed_back/index/:projectId',
      name: 'feed_back_index',
      component: feed_back_index
    },
    {
      path: '/home/feed_back/add',
      name: 'feed_back_add',
      component: feed_back_add
    },
    {
      path: '/home/feed_back/add/:projectId',
      name: 'feed_back_add',
      component: feed_back_add
    },
    {
      path: '/home/progress/index/:projectId',
      name: 'progress_index',
      component: progress_index
    },
    {
      path: '/home/progress/add/:projectId',
      name: 'progress_add',
      component: progress_add
    },
    {
      path: '/home/progress/add',
      name: 'progress_add',
      component: progress_add
    },
    {
      path: '/home/progress/detail/:detailId',
      name: 'progress_detail',
      component: progress_detail
    },
    {
      path: '/home/accept/list/:projectId',
      name: 'accept_list',
      component: accept_list
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
