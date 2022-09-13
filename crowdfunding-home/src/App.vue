<template>
  <div id="app">
    <p>http://192.168.1.100:10010/swagger-ui.html</p>
    <index></index>
    <router-view/>
  </div>
</template>

<script>

import TopNavBar from "./layout/TopNavBar";
import index from './layout'
export default {
  name: 'App',
  components: {
    TopNavBar,
    index
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
