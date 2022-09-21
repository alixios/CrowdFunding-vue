<template>
  <div class="box-container">
  <el-form ref="form"  :model="feedBack" label-width="80px">
    <el-form-item label="封面图:">
      <el-upload
          class="upload-cover"
          drag
          action="http://localhost:10010/file/images"
          multiple
          :before-upload="beforeUpload"
          :on-success="uploadCover">
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
      </el-upload>
    </el-form-item>
    <el-form-item label="回馈标题:">
      <el-input v-model="feedBack.caption" placeholder="请输入标题"></el-input>
    </el-form-item>

    <el-form-item label="发放时间:">
      <el-date-picker
          v-model="feedBack.grantDate"
          type="date"
          style="width: 880px"
          placeholder="选择日期"
          value-format="yyyy-MM-dd HH:mm"/>
    </el-form-item>
    <el-form-item label="金额:">
      <el-input v-model="feedBack.price" placeholder="请输入募款金额"></el-input>
    </el-form-item>
    <el-form-item label="份数:">
        <el-input v-model="feedBack.count" placeholder="请输入份数"></el-input>
    </el-form-item>
    <el-form-item label="介绍:">
      <el-input   type="textarea" v-model="feedBack.content" placeholder="请输入"></el-input>
    </el-form-item>
  </el-form>

  <div  style="text-align: right">
    <el-button type="primary"
               @click="saveOrUpdateFeedBack(projectId)">
      发 表
    </el-button>
    <el-button onclick="javascript:history.back(-1);return false;">
      返回
    </el-button>
  </div>
  </div>
</template>

<script>
import * as imageConversion from "image-conversion";

export default {
name: "FeedBackAdd",
  created() {
    this.initFeedBack()
  },
  data() {
    return {
      projectId: null,
      feedBack: {
        headPic: "",
        caption: "",
        grantDate: "",
        price: "",
        count: "",
        content: ""
      }
    }
  },
  methods: {
    initFeedBack() {
      const path = this.$route.path;
      const arr = path.split("/");
      const projectId = arr[4];
      this.projectId = projectId
      if (projectId) {
        console.log("====" + this.projectId)
        this.axios.get(`/api/home/feed_back/${projectId}`).then(({data}) => {
          this.feedBack = data.data;
        });
      }
    },
    beforeUpload(file) {
      return new Promise(resolve => {
        if (file.size / 1024 < 200) {
          resolve(file);
        }
        // 压缩到200KB,这里的200就是要压缩的大小,可自定义
        imageConversion
            .compressAccurately(file, 200)
            .then(res => {
              resolve(res);
            });
      });
    },
    uploadCover(response) {
      console.log(response.data)
      this.feedBack.headPic = response.data;
    },
    saveOrUpdateFeedBack(projectId){
      this.axios.post(`/api/home/feed_back/saveOrUpdate/${projectId}`,this.feedBack).then(({data}) => {
        if(data.flag){
          this.$message.success(data.message)
          _this.$router.back(-1);
        }
      })
    }
  },


}
</script>

<style scoped>

</style>