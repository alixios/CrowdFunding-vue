<template>
  <div>
  <div class="box-container layui-form" lay-filter="main">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md3">

        <img class="user-image" src="/photo/view?filename=${homeUser.headPic}" id="upload_headPic"/>

        <img  class="user-image" src="/home/images/default-head.jpg" id="upload_headPic"/>


      <img  class="user-image" src="/home/images/default-head.jpg" id="upload_headPic"/>

  </div>
  <div class="layui-col-md9">
    <div class="layui-row pdding-left-right5">
      <span>姓名:</span>${homeUser.name}
    </div>
    <div class="layui-row pdding-left-right5">
      <span>性别:</span>

      <i class="layui-icon layui-icon-female" style="color: dodgerblue"></i>

      <i class="layui-icon layui-icon-male" style="color: darkorchid"></i>


  </div>
  <div class="layui-row pdding-left-right5">
    <span>邮箱:</span>${homeUser.email}
  </div>
  <div class="layui-row pdding-left-right5">
    <span>手机号:</span>${homeUser.mobile}
  </div>
  <div class="layui-row pdding-left-right5">
    <span>余额:</span>${homeUser.balance}元
  </div>
  <div class="layui-row pdding-left-right5">
    <span>其他操作:</span>
    <a href="javascript:M.recharge();" style="margin-left: 15px;">点击充值</a>
    <a href="javascript:M.withdraw();" style="margin-left: 15px;">申请提现</a>
    <a href="javascript:M.addBackCard();" style="margin-left: 15px;">添加银行卡</a>
    <a href="javascript:M.addLocations();" style="margin-left: 15px;">添加收货地址</a>
  </div>
  </div>
  </div>
  <div class="layui-row">
    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
      <ul class="layui-tab-title">
        <li class="layui-this" lay-id="0">
          <i class="layui-icon layui-icon-username"></i>个人信息
        </li>
        <li lay-id="1">
          <i class="layui-icon layui-icon-password"></i>密码修改
        </li>
        <li lay-id="2">
          <i class="layui-icon layui-icon-file-b"></i>我的新闻
        </li>
        <li lay-id="3">
          <i class="layui-icon layui-icon-template"></i>我的众筹
        </li>
        <li lay-id="4">
          <i class="layui-icon layui-icon-face-smile-b"></i>我的捐赠
        </li>
        <li lay-id="5">
          <i class="layui-icon layui-icon-location"></i>地址管理
        </li>
        <li lay-id="6">
          <i class="layui-icon layui-icon-star"></i>我的收藏
        </li>
        <li lay-id="7">
          <i class="layui-icon layui-icon-survey"></i>银行卡管理
        </li>
        <li lay-id="8">
          <i class="layui-icon layui-icon-dollar"></i>充值记录
        </li>
        <li lay-id="9">
          <i class="layui-icon layui-icon-rmb"></i>提现记录
        </li>
        <li lay-id="10">
          <i class="layui-icon layui-icon-notice"></i>赠品接收
        </li>
      </ul>
      <div class="layui-tab-content">
        <#--个人信息-->
        <div class="layui-tab-item layui-show">
          <div class="layui-row layui-form">
            <div class="layui-form-item">
              <label class="layui-form-label">手机号:</label>
              <div class="layui-input-block">
                <input type="text" class="layui-input layui-disabled" placeholder="请输入手机号" value="${homeUser.mobile}" disabled />
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">邮箱:</label>
              <div class="layui-input-block">
                <input type="text" class="layui-input layui-disabled" placeholder="请输入邮箱" value="${homeUser.email}" disabled />
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">身份证号码:</label>
              <div class="layui-input-block">
                <input type="text" class="layui-input layui-disabled" placeholder="请输入身份证号码" value="${homeUser.idNumber}" disabled />
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">性别:</label>
              <div class="layui-input-block">


          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">姓名:</label>
          <div class="layui-input-block">
            <input type="text" class="layui-input" id="name" placeholder="请输入姓名" value="${homeUser.name}" />
          </div>
        </div>
      </div>
    </div>
    <#--修改密码-->
    <div class="layui-tab-item">
      <div class="layui-row layui-form">
        <div class="layui-form-item">
          <label class="layui-form-label">旧密码:</label>
          <div class="layui-input-block">
            <input type="password" class="layui-input password"  placeholder="请输入旧密码" />
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">新密码:</label>
          <div class="layui-input-block">
            <input type="password" class="layui-input newPassword"  placeholder="请输入新密码" />
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">确认密码:</label>
          <div class="layui-input-block">
            <input type="password" class="layui-input confirmPassword"  placeholder="请输入确认密码" />
          </div>
        </div>
      </div>
    </div>

    <div class="layui-tab-item">
      <div class="layui-row">
        <table class="layui-table">
          <tr>
            <th>新闻标题</th>
            <th>所属类型</th>
            <th>发布时间</th>
          </tr>

          <tr>
            <td>
              <a href="/home/news/detail?id=${news.id}">

              </a>
            </td>
            <td>${news.newsType.name}</td>
            <td>${news.createTime}</td>

          </tr>

        <tr>
          <td colspan="20">暂无数据</td>
        </tr>

      </table>
      <div id="newsPage">

      </div>
    </div>
    <div>
    </div>
  </div>

  <div class="layui-tab-item">
    <div class="layui-row">
      <table class="layui-table">
        <tr>
          <th>项目标题</th>
          <th>项目标签</th>
          <th>开始时间</th>
          <th>结束时间</th>
          <th>目标金额</th>
          <th>已筹金额</th>
          <th>项目类型</th>
          <th>状态</th>
          <th>操作</th>
        </tr>

        <tr>
          <td>
            <a href="/home/project/detail?id=${project.id}">


            </a>
          </td>
          <td>${project.projectCategory.name}</td>
          <td>${project.start?string('yyyy-MM-dd')}</td>
          <td>${project.end?string('yyyy-MM-dd')}</td>
          <td>${project.targetPrice}</td>
          <td>${project.preparePrice}</td>
          <td>

          </td>
          <td>

          </td>
          <td style="width: 20%;">

            <button class="layui-btn layui-btn-primary layui-btn-sm" type="button" onclick="M.submitProject('${project.id}')">
              提交申请
            </button>
            <button class="layui-btn layui-btn-primary layui-btn-sm" type="button" onclick="M.editProject('${project.id}')">
              重新编辑
            </button>

            <button class="layui-btn layui-btn-primary layui-btn-sm" type="button" onclick="M.editProject('${project.id}')">
              重新编辑
            </button>

            查看原因


            <button class="layui-btn layui-btn-primary layui-btn-sm" type="button" onclick="M.feedAccept('${project.id}')">
              赠品管理
            </button>

            <button class="layui-btn layui-btn-primary layui-btn-sm layui-disabled" disabled type="button">
              赠品管理
            </button>



        </td>
        </tr>


      <tr>
        <td colspan="20">暂无数据</td>
      </tr>

    </table>
    <div id="proPage">

    </div>
  </div>
  <div>
  </div>
  </div>

  <div class="layui-tab-item">
    <div class="layui-row">
      <table class="layui-table">
        <tr>
          <th>项目标题</th>
          <th>项目标签</th>
          <th>捐赠金额</th>
          <th>项目类型</th>
          <th>状态</th>
        </tr>

        <tr>
          <td>
            <a href="/home/project/detail?id=${donateRecord.project.id}">

            </a>
          </td>
          <td>${donateRecord.project.projectCategory.name}</td>
          <td>${donateRecord.money}</td>
          <td>

            公益项目

            非公益项目

          </td>
          <td>

          </td>
        </tr>

      <tr>
        <td colspan="20">暂无数据</td>
      </tr>

    </table>
    <div id="donPage">

    </div>
  </div>
  <div>
  </div>
  </div>

  <div class="layui-tab-item">
    <div class="layui-row">
      <table class="layui-table">
        <tr>
          <th>收件地址</th>
          <th>手机号</th>
          <th>操作</th>
        </tr>

        <tr>
          <td>${local.address}</td>
          <td>${local.mobile}</td>
          <td>
            <button class="layui-btn layui-btn-primary layui-btn-sm" type="button" onclick="M.editLocation('${local.id}','${local.mobile}','${local.address}')">
              编辑
            </button>
            <button class="layui-btn layui-btn-primary layui-btn-sm" type="button" onclick="M.deleteLocation('${local.id}')">
              删除
            </button>
          </td>
        </tr>

      <tr>
        <td colspan="20">暂无数据</td>
      </tr>

    </table>
    <div id="localPage">

    </div>
  </div>
  <div>
  </div>
  </div>

  <div class="layui-tab-item">
    <div class="layui-row">
      <table class="layui-table">
        <tr>
          <th>项目标题</th>
          <th>项目标签</th>
          <th>项目类型</th>
          <th>项目状态</th>
          <th>操作</th>
        </tr>

        <tr>
          <td>
            <a href="/home/project/detail?id=${collect.project.id}">

            </a>
          </td>
          <td>${collect.project.projectCategory.name}</td>
          <td>

            公益项目

            非公益项目

          </td>
          <td>

          </td>
          <td>
            <button class="layui-btn layui-btn-primary layui-btn-sm" type="button" onclick="M.cancelColl('${collect.id}')">
              取消收藏
            </button>
          </td>
        </tr>

      <tr>
        <td colspan="20">暂无数据</td>
      </tr>

    </table>
    <div id="collPage">

    </div>
  </div>
  <div>
  </div>
  </div>

  <div class="layui-tab-item">
    <div class="layui-row">
      <table class="layui-table">
        <tr>
          <th>卡号</th>
          <th>银行</th>
          <th>支行</th>
          <th>开户人姓名</th>
          <th>开户人手机号</th>
          <th>操作</th>
        </tr>

        <tr>
          <td></td>
          <td data-bank="${card.bank}">

          </td>
          <td>${card.branch}</td>
          <td>${card.name}</td>
          <td>${card.phone}</td>
          <td>
            <button class="layui-btn layui-btn-primary layui-btn-sm" type="button" onclick="M.deleteCard('${card.id}')">
              删除
            </button>
          </td>
        </tr>

      <tr>
        <td colspan="20">暂无数据</td>
      </tr>

    </table>
    <div id="cardPage">

    </div>
  </div>
  </div>

  <div class="layui-tab-item">
    <div class="layui-row">
      <table class="layui-table">
        <tr>
          <th>订单编号</th>
          <th>金额</th>
          <th>状态</th>
          <th>操作</th>
        </tr>

        <tr>
          <td>${alipay.outTradeNo}</td>
          <td>${alipay.totalAmount}</td>
          <td>

            <font style="color: orange">待支付</font>

            <font style="color: green">已支付</font>

            <font style="color: blue">已退款</font>

            <font style="color: red">已关闭</font>

          </td>
          <td>

            <button class="layui-btn layui-btn-primary layui-btn-sm" type="button" onclick="M.goPay('${alipay.outTradeNo}')">
              继续支付
            </button>

            <button class="layui-btn layui-btn-primary layui-btn-sm layui-disabled" disabled type="button">
              继续支付
            </button>

          </td>
        </tr>

      <tr>
        <td colspan="20">暂无数据</td>
      </tr>

    </table>
    <div id="alipayPage">

    </div>
  </div>
  </div>

  <div class="layui-tab-item">
    <div class="layui-row">
      <table class="layui-table">
        <tr>
          <th>银行卡号</th>
          <th>金额</th>
          <th>状态</th>
          <th>操作</th>
        </tr>

        <tr>
          <td>${with.bankCard}</td>
          <td>${with.money}</td>
          <td>

          </td>
          <td>

            查看原因


            <button class="layui-btn layui-btn-sm layui-disabled" disabled type="button">
              查看原因
            </button>

          </td>
        </tr>

      <tr>
        <td colspan="20">暂无数据</td>
      </tr>

    </table>
    <div id="withPage">

    </div>
  </div>
  </div>

  <div class="layui-tab-item">
    <div class="layui-row">
      <table class="layui-table">
        <tr>
          <th>项目标题</th>
          <th>回馈标题</th>
          <th>接收人姓名</th>
          <th>接收地址</th>
          <th>预计发放时间</th>
          <th>状态</th>
          <th>操作</th>
        </tr>

        <tr>
          <td>

          </td>
          <td>

          </td>
          <td>${feed.name}</td>
          <td>${feed.address}</td>
          <td>${feed.feedBack.grantDate}</td>
          <td>

          </td>
          <td>

            <button class="layui-btn layui-btn-primary layui-btn-sm" type="button"
                    onclick="M.ensureAccept('${feed.id}')">
              确认接收
            </button>

            <button class="layui-btn layui-btn-primary layui-btn-sm layui-disabled" disabled type="button">
              确认接收
            </button>


          </td>
        </tr>

      <tr>
        <td colspan="20">暂无数据</td>
      </tr>

    </table>
    <div id="feedPage">

    </div>
  </div>
  </div>
  </div>
  </div>
  <div class="layui-row" style="text-align: right;" id="form-submit-btn">


  </div>
  </div>
  </div>








  <div class='simple_dlg_define_3' style='display:none'>
    <div class='pane' style='padding:16px'>
      <div class="layui-form-item">
        <label class="layui-form-label" style="width: 80px">手机号:</label>
        <div class="layui-input-block">
          <input type="text" class="number layui-input" value="" placeholder="请输入手机号" id="mobile"/>
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label" style="width: 80px">地址:</label>
        <div class="layui-input-block">
          <textarea class="address layui-textarea" placeholder="请输入2~100字"></textarea>
        </div>
      </div>
    </div>
  </div>
  </div>
</template>

<script>
export default {
name: "index"
}
</script>

<style scoped>

</style>
