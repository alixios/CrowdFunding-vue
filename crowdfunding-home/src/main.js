import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from "axios";
import store from './store'
import VueAxios from "vue-axios";
import ElementUI from "element-ui";
import BootstrapVue from 'bootstrap-vue'



import { library } from '@fortawesome/fontawesome-svg-core';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
import {
  faArrowRight,
  faBusinessTime,
  faUsers,
  faClock,
  faChevronDown,
  faEarthAfrica,
  faGift,
  faGem,
  faTrophy,
  faChevronRight
} from '@fortawesome/free-solid-svg-icons';

library.add(
    faArrowRight,
    faBusinessTime,
    faUsers,
    faClock,
    faChevronDown,
    faEarthAfrica,
    faGift,
    faGem,
    faTrophy,
    faChevronRight
);

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import 'font-awesome/css/font-awesome.css'
import './assets/css/magnific-popup.css'
import './assets/css/metisMenu.css'
import './assets/css/nice-select.css'
import './assets/css/slick.css'
import './assets/css/main.css'
import './assets/css/animate.css'
import './assets/layui/layui'
import './assets/layui/css/layui.css'


Vue.config.productionTip = false
Vue.use(VueAxios, axios);
Vue.use(ElementUI);
Vue.use(BootstrapVue);
Vue.component('font-awesome-icon', FontAwesomeIcon);


new Vue({
  render: h => h(App),
  router,
  store,
}).$mount('#app')

axios.defaults.withCredentials = true     // 允许跨域携带cookie