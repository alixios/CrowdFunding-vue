module.exports = {
  productionSourceMap: false,
  //忽略ESlint代码规范
  lintOnSave: false,
  devServer: {
    proxy: {
      "/api": {
        target: "http://localhost:10010/",
        changeOrigin: true,
        pathRewrite: {
          "^/api": ""
        }
      },
    },
    disableHostCheck: true
  },
  chainWebpack: config => {
    config.resolve.alias.set("@", resolve("src"));
  },

};

const path = require("path");
function resolve(dir) {
  return path.join(__dirname, dir);
}
