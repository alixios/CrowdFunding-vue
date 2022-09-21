import Vue from "vue";
import Vuex from "vuex";
Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    uid: null,
    avatar: null,
    username: null,
    nickname: null,
    email: null,
    forgetFlag: false,
    projectId: '',
    searchFlag: false, // 搜索模态框
    queryString: null,
    loginUrl: "",
    parentCommentId: null,
    typeId: null,
    tagId: null,
    activePath: null,
    userMenuList: [],
    asyncRoutes: [],

    activeIndex: null,
  },
  mutations: {
    saveLoginUrl (state, url) {
      state.loginUrl = url;
    },
    login (state, user) {
      state.uid = user.uid;
      state.avatar = user.avatar;
      state.username = user.name
      state.email = user.email;
    },
    logout (state) {
      state.uid = null
      state.avatar = null
      state.username = null
      state.nickname = null
      state.email = null
      state.loginType = null
      state.token = ''
    },
  },
  actions: {},
  modules: {}
});
