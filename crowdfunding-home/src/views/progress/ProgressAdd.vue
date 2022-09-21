<template>
  <div class="box-container">
    <el-form ref="form"  :model="progress" label-width="80px">
      <el-form-item label="图片:">
        <el-upload
            class="upload-cover"
            drag
            action="/api/file/images"
            multiple
            :before-upload="beforeUpload"
            :on-success="uploadCover">
          <i class="el-icon-upload"></i>
          <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        </el-upload>
      </el-form-item>
      <el-form-item label="标题:">
        <el-input v-model="progress.caption" placeholder="请输入标题"></el-input>
      </el-form-item>
      <el-form-item label="简介:">
        <el-input type="textarea" v-model="progress.info" placeholder="请输入标题"></el-input>
      </el-form-item>
      <el-form-item label="内容:">
        <div  ref="editor"> </div>
      </el-form-item>
    </el-form>

    <div  style="text-align: right">
      <el-button type="primary"
                 @click="saveOrUpdate()">
        发 表
      </el-button>
      <el-button onclick="javascript:history.back(-1);return false;">
        返回
      </el-button>
    </div>
  </div>
</template>

<script>
import E from 'wangeditor'
import * as imageConversion from "image-conversion";

export default {
  name: "ProgressAdd",
  data() {
    return {
      projectId: null,
      editorContent: '',
      editor: null,
      progress: {
        headPic: "",
        caption: "",
        info: "",
        content: "",
      }
    }
  },
  methods: {

    saveOrUpdate() {
      const path = this.$route.path;
      const arr = path.split("/");
      const projectId = arr[4];
      this.progress.content = this.editor.txt.html();
      this.axios.post(`/api/progress/saveOrUpdate/${projectId}`,this.progress).then(({data}) => {
        if(data.flag){
          this.$message.success(data.message);
          this.$router.push({path: "/home/progress/index/" + projectId });
        }
      })
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
      this.progress.headPic = response.data;
    },

  },
  mounted() {

    this.editor = new E(this.$refs.editor)
    this.editor.customConfig = this.editor.customConfig ? this.editor.customConfig : this.editor.config
    this.editor.customConfig.onchange = (html) => {
      // console.log(html,'----------------',a)
      this.editorContent = html
    }

    this.editor.customConfig.uploadFileName = 'file'; //设置文件上传的参数名称
    this.editor.customConfig.uploadImgServer = '/api/file/editorImg'  // 上传图片到服务器
    this.editor.customConfig.showLinkImg = false// 隐藏“网络图片”tab
    this.editor.create()
  },
}
</script>

<style scoped>

</style>