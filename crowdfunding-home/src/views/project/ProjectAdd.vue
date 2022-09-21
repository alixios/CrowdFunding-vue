<template>
  <div class="box-container">
    <el-form ref="form"  :model="project" label-width="80px">
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
      <el-form-item label="标题:">
        <el-input v-model="project.caption" placeholder="请输入标题"></el-input>
      </el-form-item>
      <el-form-item label="目标金额:">
        <el-input v-model="project.targetPrice" placeholder="请输入募款金额"></el-input>
      </el-form-item>
      <el-form-item label="起止时间:">
          <el-date-picker
              type="date"
              placeholder="项目开始日期"
              :picker-options="pickerOptionsStart"
              v-model="project.start"
              class="box-date-picker"
              style="width: 440px"
              value-format="yyyy-MM-dd HH:mm"/>
          <el-date-picker
              type="date"
              placeholder="项目结束日期"
              :picker-options="pickerOptionsEnd"
              v-model="project.end"
              class="box-date-picker"
              style="width: 440px"
              value-format="yyyy-MM-dd HH:mm"/>
      </el-form-item>
      <el-form-item label="项目标签:">
        <el-select v-model="project.projectCategoryId" placeholder="请选择" style="width: 880px">
        <el-option
            v-for="item in categoryList"
            :key="item.id"
            :label="item.name"
            :value="item.id"
        >
        </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="项目类型:">
        <el-select v-model="project.type" placeholder="请选择" style="width: 880px">
          <el-option
              v-for="item in typeList"
              :key="item.type"
              :label="item.label"
              :value="item.type" >
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="详情:">
        <div  ref="editor"> </div>
      </el-form-item>
    </el-form>

    <div  style="text-align: right">
      <el-button type="primary"
                 @click="saveOrUpdate">
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
name: "ProjectAdd",

  data() {
    let that = this;
    return {
      pickerOptionsStart:{
        disabledDate(time) {
          return time.getTime() < Date.now() - 8.64e7;   //禁用以前的日期，今天不禁用
        },
      },
      pickerOptionsEnd:{
        disabledDate(time) {
          return time.getTime() < Date.now() - 8.64e7;   //禁用以前的日期，今天不禁用
        },
      },

      categoryList: [],
      mode: 'default', // or 'simple'
      dateRange: "",
      editorContent: '',
      editor: null,
      typeList: [
        {
          type: 0,
          label: "公益"
        },
        {
          type: 1,
          label: "非公益"
        }
      ],
      project: {
        headPic: "",
        caption: "",
        targetPrice: "",
        projectCategoryId: null,
        start: null,
        end: null,
        type: null,
        content: "",
      }
    }
  },
  methods: {
    initProject() {
      const path = this.$route.path;
      const arr = path.split("/");
      const projectId = arr[3];
      if (projectId) {
        console.log(projectId)
        this.axios.get(`/api/home/project/${projectId}`).then(({ data }) => {
          this.project = data.data;
          this.editor.txt.html('<p>' + data.data.content + '</p>')
        });
      } else {
        const project = sessionStorage.getItem("project");
        if (project) {
          this.article = JSON.parse(project);
        }
      }
    },
    saveOrUpdate() {
      this.project.content = this.editor.txt.html();
      console.log(this.project.end)
      console.log(this.project.projectCategoryId)
      this.axios.post("/api/home/project/saveOrUpdate",this.project).then(({data}) => {
        if(data.flag){
          this.$message.success(data.message)
          this.$router.push("/project/index")
        }
      })
    },
    getCategoryList() {
      this.axios.get("/api/category/categoryList").then(({data}) => {
        if(data.flag){
          this.categoryList = data.data

        }else {
          this.$message.error(data.message)
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
      this.project.headPic = response.data;
    },

  },
  created() {
    this.getCategoryList()
    this.initProject()
  },
  mounted() {

    this.editor = new E(this.$refs.editor)
    this.editor.customConfig = this.editor.customConfig ? this.editor.customConfig : this.editor.config
    this.editor.customConfig.onchange = (html) => {
      // console.log(html,'----------------',a)
      this.editorContent = html
    }

    this.editor.customConfig.uploadFileName = 'file'; //设置文件上传的参数名称
    this.editor.customConfig.uploadImgServer = 'http://localhost:10010/file/editorImg'  // 上传图片到服务器
    this.editor.customConfig.showLinkImg = false// 隐藏“网络图片”tab
    this.editor.create()
  },



}
</script>

<style scoped>
.box-container
{
  width: 960px;
  height: auto;
  margin: 15px auto;
}

/*.upload-cover
{
  width: 100px;
  height: 100px;
  margin-left: 4px;
}*/

.layui-form-label
{
  color: black;
  width: auto;
}

.nice-select
{
  display: none;
}
p
{
  color: black;
}

dd
{
  color: black;
}
</style>