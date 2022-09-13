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

  },

}

