<template>
  <div class="navClass" >

    <!-- 导航栏 -->
    <div class="d-md-block d-none nav-container">
      <div class="float-left blog-title">
<!--        <router-link to="/">-->
<!--        </router-link>-->
      </div>
      <div class="float-right nav-title">

        <div class="menus-item">
          <router-link to="/index">
            <i class="home icon" style="color: whitesmoke" /><span style="color: whitesmoke;margin-right: 10px">首页</span>
          </router-link>
        </div>
        <div class="menus-item">
          <router-link to="/discovery">
            <i class="el-icon-headset" style="color: whitesmoke"/><span style="color: whitesmoke;margin-right: 10px">音乐盒</span>
          </router-link>
        </div>

        <div class="user-btn">
          <a>
            <i class="el-icon-s-operation" style="color: whitesmoke"/><span style="color: whitesmoke;margin-right: 10px">类别</span>
            <ul class="user-submenu">
              <li>
                <router-link to="/types">
                  <i class="th icon"/> 分类
                </router-link>
              </li>
              <li>
                <router-link to="/tags">
                  <i class="tags icon"/> 标签
                </router-link>
              </li>
            </ul>
          </a>
        </div>
        <div class="menus-item">
          <router-link to="/archives">
            <i class="archive icon" style="color: whitesmoke"/><span style="color: whitesmoke;margin-right: 10px">归档</span>
          </router-link>
        </div>
        <div class="menus-item">
          <router-link to="/link">
            <i class="linkify icon" style="color: whitesmoke"/><span style="color: whitesmoke;margin-right: 10px">友链</span>
          </router-link>
        </div>
        <div class="menus-item">
          <router-link to="/message">
            <i class="rocketchat icon" style="color: whitesmoke"/> <span style="color: whitesmoke;margin-right: 10px">留言</span>
          </router-link>
        </div>
        <div class="user-btn">
          <a>
            <i class="el-icon-sugar" style="color: whitesmoke"/><span style="color: whitesmoke;margin-right: 10px">后花园</span>
            <ul class="user-submenu">
              <li>
                <router-link to="/crawler">
                  <i class="el-icon-magic-stick"/> 爬虫
                </router-link>
              </li>
              <li>
                <router-link to="/AI">
                  <i class="user secret icon"/> AI
                </router-link>
              </li>
              <li>
                <router-link to="/about">
                  <i class="paper plane icon"/> 关于我
                </router-link>
              </li>
            </ul>
          </a>
        </div>

      </div>
    </div>

  </div>
</template>

<script>

export default {


}
</script>

<style scoped>
  .navClass{
    position:fixed; /* 绝对定位，fixed是相对于浏览器窗口定位。 */
    /*position: relative;*/
    top:15px; /* 距离窗口顶部距离 */
    right: 22px;
    height:10px; /* 高度 */
    float: right;
    z-index:99; /* 层叠顺序，数值越大就越高。页面滚动的时候就不会被其他内容所遮挡。 */
  }
  @media (min-width: 760px) {
    .nav-container {
      font-size: 14px;
      width: 100%;
      height: 100%;
    }
    .nav-mobile-container {
      display: none;
    }
  }
  @media (max-width: 759px) {
    .nav-container {
      display: none;
    }
    .nav-mobile-container {
      width: 100%;
      display: flex;
      align-items: center;
    }
  }
  i {
    margin-right: 4px;
  }
  ul {
    list-style: none;
  }
  .nav {
    background: rgba(0, 0, 0, 0) !important;
  }
  .nav a {
    color: #eee !important;
  }
  .nav .menus-item a {
    text-shadow: 0.05rem 0.05rem 0.1rem rgba(0, 0, 0, 0.3);
  }
  .nav .blog-title a {
    text-shadow: 0.1rem 0.1rem 0.2rem rgba(0, 0, 0, 0.15);
  }
  .theme--light.nav-fixed {
    background: rgba(255, 255, 255, 0.8) !important;
    box-shadow: 0 5px 6px -5px rgba(133, 133, 133, 0.6);
  }
  .theme--dark.nav-fixed {
    background: rgba(18, 18, 18, 0.8) !important;
  }
  .theme--dark.nav-fixed a {
    color: rgba(255, 255, 255, 0.8) !important;
  }
  .theme--light.nav-fixed a {
    color: #4c4948 !important;
  }
  .nav-fixed {
    position:fixed; /* 绝对定位，fixed是相对于浏览器窗口定位。 */
    /*position: relative;*/
    top:15px; /* 距离窗口顶部距离 */
    right: 22px;
    height:10px; /* 高度 */
    float: right;
    z-index:99; /* 层叠顺序，数值越大就越高。页面滚动的时候就不会被其他内容所遮挡。 */
  }
  .nav-fixed .menus-item a,
  .nav-fixed .menus-btn a,
  .nav-fixed .blog-title a {
    text-shadow: none;
  }
  .blog-title,
  .nav-title {
    display: flex;
    align-items: center;
    height: 100%;
  }
  .blog-title a {
    font-size: 18px;
    font-weight: bold;
  }
  .user-btn,
  .menus-btn,
  .menus-item {
    position: relative;
    display: inline-block;
    margin: 0 0 0 0.875rem;
  }
  .menus-btn a,
  .menus-item a {
    transition: all 0.2s;
  }
  .nav-fixed .menus-btn a:hover,
  .nav-fixed .menus-item a:hover {
    color: #49b1f5 !important;
  }
  .menus-item a:hover:after {
    width: 100%;
  }
  .menus-item a:after {
    position: absolute;
    bottom: -5px;
    left: 0;
    z-index: -1;
    width: 0;
    height: 3px;
    background-color: #80c8f8;
    content: "";
    transition: all 0.3s ease-in-out;
  }
  .user-btn a {
    transition: all 0.2s;
  }
  .user-avatar {
    cursor: pointer;
    border-radius: 50%;
  }
  .user-btn:hover .user-submenu {
    display: block;
  }
  .user-submenu {
    position: absolute;
    display: none;
    right: 0;
    width: max-content;
    margin-top: 8px;
    box-shadow: 0 5px 20px -4px rgba(0, 0, 0, 0.5);
    background-color: #fff;
    animation: submenu 0.3s 0.1s ease both;
  }
  .user-submenu:before {
    position: absolute;
    top: -8px;
    left: 0;
    width: 100%;
    height: 20px;
    content: "";
  }
  .user-submenu a {
    line-height: 2;
    color: #4c4948 !important;
    text-shadow: none;
    display: block;
    padding: 6px 14px;
  }
  .user-submenu a:hover {
    background: #4ab1f4;
  }
  @keyframes submenu {
    0% {
      opacity: 0;
      filter: alpha(opacity=0);
      transform: translateY(10px);
    }
    100% {
      opacity: 1;
      filter: none;
      transform: translateY(0);
    }
  }
  .red-point {
    position: absolute;
    color: white;
    font-size: 5px;
    background-color: red;
    width: 8px;
    height: 8px;
    line-height: 8px;
    left: 85%;
    top: 0;
    text-align: center;
    -webkit-border-radius: 24px;
    border-radius: 24px;
  }
</style>
