<template>
  <div id="app">
    <index v-show="(path !== '/home/homeUser/register')" ></index>
    <router-view/>
  </div>
</template>

<script>

import TopNavBar from "./layout/TopNavBar";
import index from './layout'
export default {
  name: 'App',
  components: {
    path: '',
    TopNavBar,
    index
  },
  // 判断路由
  mounted () {
    this.path = this.$route.path
    // console.log(this.$route.path)
  },
  watch: {
    $route (to, from) {
      this.path = to.path
    }
  }
}
</script>
