<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>个人中心</title>

		<link rel="stylesheet" href="/home/layui/css/layui.css" />
		<link rel="stylesheet" href="/home/css/homeUserIndex.css" />
		<script type="text/javascript" src="/home/layui/layui.all.js"></script>
		<script type="text/javascript" src="/home/js/msg.js"></script>
		<script type="text/javascript" src="/home/js/bank-card.js"></script>
		<script src="/home/js/vendor/jquery-1.12.4.min.js"></script>

		<#include "../common/head-link.ftl"/>


		<style>
            .box-container
            {
                width: 65%;
				padding: 20px;
				margin: 20px auto;
            }
			label {
				color: #4D4D4D;
				cursor: pointer;
				font-size: 14px;
				font-weight: 400;
			}
			.layui-form-label {
				float: left;
				display: block;
				padding: 9px 15px;
				width: 110px;
				font-weight: 400;
				line-height: 20px;
				text-align: right;
			}
			.nice-select
			{
				display: none;
				!important;
			}
            .price-item
            {
                display: inline-block;
                width: 120px;
                height: 50px;
                margin: 10px;
                border: 2px solid #EAEAEA;
                text-align: center;
                line-height: 50px;
            }

            .price-item:hover
            {
                border: 2px solid dodgerblue;
            }

            .price-item-active{
                border: 2px solid dodgerblue;
                border-radius: 4%;
            }

            .is-show
            {

            }

        </style>
	</head>
	<body>
    <#include "../common/top-menu.ftl"/>

    <div class="box-container layui-form" lay-filter="main">
			<div class="layui-row layui-col-space15">
				<div class="layui-col-md3">
					<#if homeUser.headPic??>
						<#if homeUser.headPic?length gt 0>
							<img class="user-image" src="/photo/view?filename=${homeUser.headPic}" id="upload_headPic"/>
						<#else>
							<img  class="user-image" src="/home/images/default-head.jpg" id="upload_headPic"/>
						</#if>
					<#else>
						<img  class="user-image" src="/home/images/default-head.jpg" id="upload_headPic"/>
					</#if>
				</div>
				<div class="layui-col-md9">
					<div class="layui-row pdding-left-right5">
						<span>姓名:</span>${homeUser.name}
					</div>
                    <div class="layui-row pdding-left-right5">
                        <span>性别:</span>
						<#if homeUser.sex == 1>
							<i class="layui-icon layui-icon-female" style="color: dodgerblue"></i>
						<#elseif homeUser.sex == 2>
							<i class="layui-icon layui-icon-male" style="color: darkorchid"></i>
						<#else>
							未知
						</#if>
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
										<select class="layui-select" id="sex">
                                            <option value="1" <#if homeUser.sex == 1>selected</#if>>男</option>
                                            <option value="2" <#if homeUser.sex == 2>selected</#if>>女</option>
                                            <option value="0" <#if homeUser.sex == 0>selected</#if>>未知</option>
										</select>
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
					<#--发布的新闻-->
					<div class="layui-tab-item">
						  <div class="layui-row">
							  <table class="layui-table">
								  <tr>
									  <th>新闻标题</th>
									  <th>所属类型</th>
									  <th>发布时间</th>
								  </tr>
								  <#if newsPageBean.content?size gt 0>
									  <#list newsPageBean.content as news>
										  <tr>
											  <td>
												  <a href="/home/news/detail?id=${news.id}">
													  ${news.caption}
												  </a>
											  </td>
											  <td>${news.newsType.name}</td>
											  <td>${news.createTime}</td>

										  </tr>
									  </#list>
								  <#else>
									  <tr>
										  <td colspan="20">暂无数据</td>
									  </tr>
								  </#if>
							  </table>
							  <div id="newsPage">

							  </div>
						  </div>
						  <div>
						  </div>
					  </div>
					<#--发起的众筹-->
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
								  <#if proPageBean.content?size gt 0>
									  <#list proPageBean.content as project>
										  <tr>
											  <td>
												  <a href="/home/project/detail?id=${project.id}">
													  <#if project.caption?length gt 4>
														  ${project.caption?substring(0,4)}...
													  <#else>
														  ${project.caption}
													  </#if>
												  </a>
											  </td>
											  <td>${project.projectCategory.name}</td>
											  <td>${project.start?string('yyyy-MM-dd')}</td>
											  <td>${project.end?string('yyyy-MM-dd')}</td>
											  <td>${project.targetPrice}</td>
											  <td>${project.preparePrice}</td>
											  <td>
												  <#if project.type == 0>
												  	公益项目
													<#else>
													  非公益项目
												  </#if>
											  </td>
											  <td>
												  <#if project.status == 0>
													  未提交
												  <#elseif project.status == 1>
													  审核中
												  <#elseif project.status == 2>
													  通过
												  <#elseif project.status == 3>
													  未通过
												  <#elseif project.status == 4>
													  募款中
												  <#else>
													  已结束
												  </#if>
											  </td>
											  <td style="width: 20%;">
												  <#if project.status == 0>
													  <button class="layui-btn layui-btn-primary layui-btn-sm" type="button" onclick="M.submitProject('${project.id}')">
														  提交申请
													  </button>
													  <button class="layui-btn layui-btn-primary layui-btn-sm" type="button" onclick="M.editProject('${project.id}')">
														  重新编辑
													  </button>
													<#elseif project.status == 3>
														<button class="layui-btn layui-btn-primary layui-btn-sm" type="button" onclick="M.editProject('${project.id}')">
															重新编辑
														</button>
														<button class="layui-btn layui-btn-sm" type="button" onclick="layer.alert('项目未通过原因:${project.notPassReason!""}')">
															查看原因
														</button>
													<#else>
													  <#if project.type != 0>
														  <button class="layui-btn layui-btn-primary layui-btn-sm" type="button" onclick="M.feedAccept('${project.id}')">
															  赠品管理
														  </button>
													  <#else>
														  <button class="layui-btn layui-btn-primary layui-btn-sm layui-disabled" disabled type="button">
															  赠品管理
														  </button>
													  </#if>

												  </#if>
											  </td>
										  </tr>
									  </#list>
								  <#else>
									  <tr>
										  <td colspan="20">暂无数据</td>
									  </tr>
								  </#if>
							  </table>
							  <div id="proPage">

							  </div>
						  </div>
						  <div>
						  </div>
					  </div>
					<#--我的捐赠记录-->
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
								  <#if donPageBean.content?size gt 0>
									  <#list donPageBean.content as donateRecord>
										  <tr>
											  <td>
												  <a href="/home/project/detail?id=${donateRecord.project.id}">
													  <#if donateRecord.project.caption?length gt 4>
														  ${donateRecord.project.caption?substring(0,4)}...
													  <#else>
														  ${donateRecord.project.caption}
													  </#if>
												  </a>
											  </td>
											  <td>${donateRecord.project.projectCategory.name}</td>
											  <td>${donateRecord.money}</td>
											  <td>
												  <#if donateRecord.project.type == 0>
													  公益项目
												  <#else>
													  非公益项目
												  </#if>
											  </td>
											  <td>
												  <#if donateRecord.project.status == 0>
													  未提交
												  <#elseif donateRecord.project.status == 1>
													  审核中
												  <#elseif donateRecord.project.status == 2>
													  通过
												  <#elseif donateRecord.project.status == 3>
													  未通过
												  <#elseif donateRecord.project.status == 4>
													  募款中
												  <#else>
													  已结束
												  </#if>
											  </td>
										  </tr>
									  </#list>
								  <#else>
									  <tr>
										  <td colspan="20">暂无数据</td>
									  </tr>
								  </#if>
							  </table>
							  <div id="donPage">

							  </div>
						  </div>
						  <div>
						  </div>
					  </div>
					<#--地址管理-->
					<div class="layui-tab-item">
						  <div class="layui-row">
							  <table class="layui-table">
								  <tr>
									  <th>收件地址</th>
									  <th>手机号</th>
									  <th>操作</th>
								  </tr>
								  <#if localPageBean.content?size gt 0>
									  <#list localPageBean.content as local>
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
									  </#list>
								  <#else>
									  <tr>
										  <td colspan="20">暂无数据</td>
									  </tr>
								  </#if>
							  </table>
							  <div id="localPage">

							  </div>
						  </div>
						  <div>
						  </div>
					  </div>
					<#--收藏的项目-->
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
								  <#if collPageBean.content?size gt 0>
									  <#list collPageBean.content as collect>
										  <tr>
											  <td>
												  <a href="/home/project/detail?id=${collect.project.id}">
												  	${collect.project.caption}
													</a>
											  </td>
											  <td>${collect.project.projectCategory.name}</td>
											  <td>
												  <#if collect.project.type == 0>
													  公益项目
												  <#else>
													  非公益项目
												  </#if>
											  </td>
											  <td>
												  <#if collect.project.status == 0>
													  未提交
												  <#elseif collect.project.status == 1>
													  审核中
												  <#elseif collect.project.status == 2>
													  通过
												  <#elseif collect.project.status == 3>
													  未通过
												  <#elseif collect.project.status == 4>
													  募款中
												  <#else>
													  已结束
												  </#if>
											  </td>
											  <td>
												  <button class="layui-btn layui-btn-primary layui-btn-sm" type="button" onclick="M.cancelColl('${collect.id}')">
													  取消收藏
												  </button>
											  </td>
										  </tr>
									  </#list>
								  <#else>
									  <tr>
										  <td colspan="20">暂无数据</td>
									  </tr>
								  </#if>
							  </table>
							  <div id="collPage">

							  </div>
						  </div>
						  <div>
						  </div>
					  </div>
					<#--银行卡管理-->
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
								  <#if cardPageBean.content?size gt 0>
									  <#list cardPageBean.content as card>
										  <tr>
											  <td>${card.cardNumbers?substring(0,4)}******${card.cardNumbers?substring(14)}</td>
											  <td data-bank="${card.bank}">
												  <script>
													  var text = getText('${card.bank}');
													  $("td[data-bank='"+'${card.bank}'+"']").html(text);
												  </script>
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
									  </#list>
								  <#else>
									  <tr>
										  <td colspan="20">暂无数据</td>
									  </tr>
								  </#if>
							  </table>
							  <div id="cardPage">

							  </div>
						  </div>
					</div>
					<#--充值订单记录-->
                    <div class="layui-tab-item">
                      <div class="layui-row">
                          <table class="layui-table">
                              <tr>
                                  <th>订单编号</th>
                                  <th>金额</th>
                                  <th>状态</th>
                                  <th>操作</th>
                              </tr>
                                <#if alipayPageBean.content?size gt 0>
                                    <#list alipayPageBean.content as alipay>
                                        <tr>
                                            <td>${alipay.outTradeNo}</td>
                                            <td>${alipay.totalAmount}</td>
                                            <td>
                                                 <#if alipay.status == 0>
                                                     <font style="color: orange">待支付</font>
                                                 <#elseif alipay.status = 1>
                                                     <font style="color: green">已支付</font>
                                                 <#elseif alipay.status = 2>
                                                     <font style="color: blue">已退款</font>
                                                 <#else>
                                                     <font style="color: red">已关闭</font>
                                                 </#if>
                                            </td>
                                            <td>
                                                <#if alipay.status == 0>
                                                    <button class="layui-btn layui-btn-primary layui-btn-sm" type="button" onclick="M.goPay('${alipay.outTradeNo}')">
                                                        继续支付
                                                    </button>
                                                <#else>
                                                     <button class="layui-btn layui-btn-primary layui-btn-sm layui-disabled" disabled type="button">
                                                         继续支付
                                                     </button>
                                                </#if>
                                            </td>
                                        </tr>
                                    </#list>
                                <#else>
                                    <tr>
                                        <td colspan="20">暂无数据</td>
                                    </tr>
                                </#if>
                          </table>
                          <div id="alipayPage">

                          </div>
                      </div>
            		</div>
					<#--提现记录-->
					<div class="layui-tab-item">
						<div class="layui-row">
							  <table class="layui-table">
								  <tr>
									  <th>银行卡号</th>
									  <th>金额</th>
									  <th>状态</th>
                                      <th>操作</th>
								  </tr>
								  <#if withPageBean.content?size gt 0>
									  <#list withPageBean.content as with>
										  <tr>
											  <td>${with.bankCard}</td>
											  <td>${with.money}</td>
											  <td>
												  <#if with.status == 1>
													  <font style="color: orange">审核中</font>
												  <#elseif with.status = 2>
													  <font style="color: green">已提现</font>
												  <#else>
													  <font style="color: red">申请被拒绝</font>
												  </#if>
											  </td>
											  <td>
										  		<#if with.status = 3>
                                                    <button class="layui-btn layui-btn-sm" type="button" onclick="layer.alert('提现未通过原因:${with.notPassReason!""}')">
                                                        查看原因
                                                    </button>
												<#else>
													<button class="layui-btn layui-btn-sm layui-disabled" disabled type="button">
														查看原因
													</button>
										  		</#if>
											  </td>
										  </tr>
									  </#list>
								  <#else>
									  <tr>
										  <td colspan="20">暂无数据</td>
									  </tr>
								  </#if>
							  </table>
							  <div id="withPage">

							  </div>
						  </div>
					</div>
					<#--赠品接收-->
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
								  <#if feedPageBean.content?size gt 0>
									  <#list feedPageBean.content as feed>
										  <tr>
											  <td>
												  <#if feed.feedBack.project.caption?length gt 4>
													  ${feed.feedBack.project.caption?substring(0,4)}...
												  <#else>
													  ${feed.feedBack.project.caption}
												  </#if>
											  </td>
											  <td>
												  <#if feed.feedBack.caption?length gt 4>
													  ${feed.feedBack.caption?substring(0,4)}...
												  <#else>
													  ${feed.feedBack.caption}
												  </#if>
											  </td>
											  <td>${feed.name}</td>
											  <td>${feed.address}</td>
											  <td>${feed.feedBack.grantDate}</td>
											  <td>
												  <#if feed.status == 0>
													  <font style="color: orange">未发放</font>
												  <#elseif feed.status = 1>
													  <font style="color: green">已发放</font>
												  <#else>
													  <font style="color: red">已接收</font>
												  </#if>
											  </td>
											  <td>
												  <#if feed.status == 1>
													  <button class="layui-btn layui-btn-primary layui-btn-sm" type="button"
															  onclick="M.ensureAccept('${feed.id}')">
														  确认接收
													  </button>
													<#else>
													  <button class="layui-btn layui-btn-primary layui-btn-sm layui-disabled" disabled type="button">
														  确认接收
													  </button>
												  </#if>

											  </td>
										  </tr>
									  </#list>
								  <#else>
									  <tr>
										  <td colspan="20">暂无数据</td>
									  </tr>
								  </#if>
							  </table>
							  <div id="feedPage">

							  </div>
						  </div>
					  </div>
                  </div>
			</div>
			<div class="layui-row" style="text-align: right;" id="form-submit-btn">
				<#--<#if tableIndex == 2 || tableIndex == 3>
                    <input id="submit-btn" type="button" class="layui-btn" value="确定" onclick="M.click()"  style="display: none"/>
				<#else>-->
					<input id="submit-btn" type="button" class="layui-btn" value="确定" onclick="M.click()" />
				<#--</#if>-->
			</div>
		</div>
        </div>

	<#--充值-->
	<div class='simple_dlg_define' style="display: none;">
		<div class='pane' style='padding:16px'>
			<div style='padding:10px' class="layui-form-item">
				<label class="layui-form-label">金额:</label>
				<div class="layui-input-block price-item-list">
				</div>
			</div>
			<div style='padding:10px' class="layui-form-item is-show">
				<label class="layui-form-label">金额:</label>
				<div class="layui-input-block">
					<input type="number" class="number layui-input" value="0" placeholder="请输入充值金额" min="1" max="100000" id="dayNumber" min="1" oninput="if(value>100000)value=100000;if (value<1)value=1"/>
				</div>
			</div>
		</div>
	</div>

	<#--提现-->
	<div class='simple_dlg_define_2' style="display: none;">
		<div class='pane layui-form' lay-filter="withdrawal" style='padding:16px'>
			<div style='padding:10px' class="layui-form-item is-show">
				<label class="layui-form-label" style="width: 80px">金额:</label>
				<div class="layui-input-block">
					<input type="number" class="number layui-input" value="0" placeholder="请输入充值金额" min="1" max="100000" id="dayNumber" min="1" oninput="if(value>100000)value=100000;if (value<1)value=1"/>
				</div>
			</div>
			<div style='padding:10px' class="layui-form-item is-show">
				<label class="layui-form-label" style="width: 80px">银行卡:</label>
				<div class="layui-input-block">
					<select name="bankCard" class="bankCard form-control" >
						<#list bankCardList as bankCard>
							<option value="${bankCard.cardNumbers}">${bankCard.cardNumbers}</option>
						</#list>
					</select>
				</div>
			</div>
		</div>
	</div>

	<#--地址-->
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


	</body>
    <#include "../common/foot.ftl"/>
	<#include "../common/foot-js.ftl"/>

	<script>

		var M = {};
		M.tableIndex = ${tableIndex}
		M.pageSize = ${alipayPageBean.pageSize};//每页显示数量

		//支付记录分页
		M.alipayCurr = ${alipayPageBean.currentPage};//当前页码
		M.alipayCount = ${alipayPageBean.total};//总数量

		//地址
		M.localCurr = ${localPageBean.currentPage};
		M.localCount = ${localPageBean.total}

		//银行卡
		M.cardCurr = ${cardPageBean.currentPage};
		M.cardCount = ${cardPageBean.total}

		//提现
		M.withCurr = ${withPageBean.currentPage};
		M.withCount = ${withPageBean.total}

		//众筹
		M.proCurr = ${proPageBean.currentPage};
		M.proCount = ${proPageBean.total}

		//捐赠
		M.donCurr = ${donPageBean.currentPage};
		M.donCount = ${donPageBean.total}

		//新闻
		M.newsCurr = ${newsPageBean.currentPage};
		M.newsCount = ${newsPageBean.total}

		//收藏
		M.collCurr = ${collPageBean.currentPage};
		M.collCount = ${collPageBean.total}

		//回馈信息
		M.feedCurr = ${feedPageBean.currentPage};
		M.feedCount = ${feedPageBean.total}

		M.prices = [50, 100, 300, 600, 1280, 12800]; //充值金额
		M.index = -1; //默认选中
		M.money = 0; //充值金额

		M.setButton = function()
		{
			if(M.tableIndex == 0 || M.tableIndex == 1)
				$("#submit-btn").show();
			else
				$("#submit-btn").hide();
		}

		//初始化
		M.init = function()
		{
			M.setButton();
			var view = $(".price-item-list");
			view.html('');

			for(var i=0; i<M.prices.length; i++)
			{
				var span = '';
				if(i == M.index)
					span = '<span class="price-item price-item-active" index="'+i+'">￥'+M.prices[i]+'</span>';
				else
					span = '<span class="price-item" index="'+i+'">￥'+M.prices[i]+'</span>';

				view.append(span);
			}

			var span = '<span class="price-item price-item-active" data-target="1">其他</span>';
			view.append(span);

		}();

		//判断是哪个部分的确定
		M.click = function () {
			if(M.tableIndex == 0){
				M.updateInfo();
			}else if(M.tableIndex == 1){
				M.modificationPassword();
			}
		}

		//修改信息
		M.updateInfo = function()
		{
			var sex = $("#sex").val().trim();
			var name = $("#name").val().trim();

			if(msg.isEmpty(name))
			{
				errorMsg("请输入姓名");
				return ;
			}

			if(name.length < 2 || name.length > 18)
			{
				errorMsg("姓名必须在2~18位");
				return ;
			}

			$.ajax({
				url: 'update_info',
				type: 'POST',
				data: {sex: sex,name:name},
				dataType: 'json',
				success: function (data) {
					if (data.code == 0) {
						successMsg("修改成功");
						setInterval(function()
						{
							location.href = "index";
						}, 1000);
					}
					else {
						errorMsg(data.msg);
					}
				},
				error: function (data) {
					errorMsg('网络错误!');
				}
			});
		}

		//修改密码
		M.modificationPassword = function()
		{
			var password = $(".password").val();
			var newPassword = $(".newPassword").val().trim();
			var confirmPassword = $(".confirmPassword").val().trim();

			if(password.length == 0)
			{
				errorMsg("请输入旧密码");
				return ;
			}

			if(newPassword.length == 0)
			{
				errorMsg("请输入新密码");
				return ;
			}

			if(confirmPassword.length == 0)
			{
				errorMsg("请输入确认密码");
				return ;
			}

			if(newPassword != confirmPassword)
			{
				errorMsg("两次密码不一致");
				return ;
			}


			$.ajax({
				type: "POST",
				url: 'update_password',
				data: {password:password, newPassword:newPassword},
				dataType: 'json',
				cache: false,
				success: function (data) {
					if (data.code == 0) {
						successMsg("修改成功");
						setTimeout(function()
						{
							location.href = "index";
						}, 1000);
					}
					else
					{
						errorMsg(data.msg);
					}
				},
				error: function (data) {
					errorMsg('网络错误!');
				}
			});

		}


		var form = ''
		layui.use(['form','element', 'upload', 'laypage','rate'],function()
		{
			form = layui.form;
			var element = layui.element;
			var upload = layui.upload;
			var laypage = layui.laypage;
			var rate = layui.rate;

			//table的切换
			element.on('tab(docDemoTabBrief)', function(data){
				M.tableIndex = data.index;
				M.setButton();
			});

			//修改头像
			upload.render({
				elem: '#upload_headPic',
				url: '/upload/home_upload_photo', //改成您自己的上传接口,
				size: 1024 * 1,
				accept: 'images',
				done: function (res) {
					if (res.code == 0) {
						$.ajax({
							url: 'update_headPic',
							type: 'POST',
							data: {headPic: res.data},
							dataType: 'json',
							success: function (data) {
								if (data.code == 0) {
									$("#upload_headPic").attr("src", "/photo/view?filename=" + res.data);
									successMsg("上传成功")
								}
								else {
									errorMsg(data.msg);
								}
							},
							error: function (data) {
								errorMsg('网络错误!');
							}
						});
					}
				}
			});

			form.render('select','main')

			//新闻分页
			laypage.render({
				elem: 'newsPage'
				,count: M.newsCount
				,limit:M.pageSize
				,curr:M.newsCurr
				,jump: function(obj, first){
					//首次不执行
					if(!first){
						M.newsCurr = obj.curr;
						location.href="index?newsCurr="+obj.curr + "&tableIndex=" + M.tableIndex;
					}
				}
			});

			//众筹分页
			laypage.render({
				elem: 'proPage'
				,count: M.proCount
				,limit:M.pageSize
				,curr:M.proCurr
				,jump: function(obj, first){
					//首次不执行
					if(!first){
						M.proCurr = obj.curr;
						location.href="index?proCurr="+obj.curr + "&tableIndex=" + M.tableIndex;
					}
				}
			});

			//捐赠分页
			laypage.render({
				elem: 'donPage'
				,count: M.donCount
				,limit:M.pageSize
				,curr:M.donCurr
				,jump: function(obj, first){
					//首次不执行
					if(!first){
						M.donCurr = obj.curr;
						location.href="index?donCurr="+obj.curr + "&tableIndex=" + M.tableIndex;
					}
				}
			});

			//地址分页
			laypage.render({
				elem: 'localPage'
				,count: M.localCount
				,limit:M.pageSize
				,curr:M.localCurr
				,jump: function(obj, first){
					//首次不执行
					if(!first){
						M.localCurr = obj.curr;
						location.href="index?localCurr="+obj.curr + "&tableIndex=" + M.tableIndex;
					}
				}
			});

			//收藏
			laypage.render({
				elem: 'collPage'
				,count: M.collCount
				,limit:M.pageSize
				,curr:M.collCurr
				,jump: function(obj, first){
					//首次不执行
					if(!first){
						M.collCurr = obj.curr;
						location.href="index?collectCurr="+obj.curr + "&tableIndex=" + M.tableIndex;
					}
				}
			});

			//银行卡分页
			laypage.render({
				elem: 'cardPage'
				,count: M.cardCount
				,limit:M.pageSize
				,curr:M.cardCurr
				,jump: function(obj, first){
					//首次不执行
					if(!first){
						M.cardCurr = obj.curr;
						location.href="index?cardCurr="+obj.curr + "&tableIndex=" + M.tableIndex;
					}
				}
			});

			//充值分页
			laypage.render({
				elem: 'alipayPage'
				,count: M.alipayCount
				,limit:M.pageSize
				,curr:M.alipayCurr
				,jump: function(obj, first){
					//首次不执行
					if(!first){
						M.alipayCurr = obj.curr;
						location.href="index?aliCurr="+obj.curr + "&tableIndex=" + M.tableIndex;
					}
				}
			});

			//提现分页
			laypage.render({
				elem: 'withPage'
				,count: M.withCount
				,limit:M.pageSize
				,curr:M.withCurr
				,jump: function(obj, first){
					//首次不执行
					if(!first){
						M.withCurr = obj.curr;
						location.href="index?withCurr="+obj.curr + "&tableIndex=" + M.tableIndex;
					}
				}
			});

			//回馈分页
			laypage.render({
				elem: 'feedPage'
				,count: M.feedCount
				,limit:M.pageSize
				,curr:M.feedCurr
				,jump: function(obj, first){
					//首次不执行
					if(!first){
						M.feedCurr = obj.curr;
						location.href="index?feedCurr="+obj.curr + "&tableIndex=" + M.tableIndex;
					}
				}
			});

			element.tabChange('docDemoTabBrief', M.tableIndex.toString());
		});

		//充值
		M.recharge = function () {
			var recharge = $('.simple_dlg_define').html()
			layer.open({
				type:1,
				title:'充值',
				area: ['800px', 'auto'],
				content:recharge,
				btn:['确认充值','取消'],
				btn1: function (index, layero) {
					//充值金额
					var number = $(".number", layero).val();
					M.createOrder(number,index);
				},
				btn2: function (index, layero) {
					layer.close(index)
				},
				success: function (layero, index) {
					$(".price-item").click(function()
					{
						var thiz = $(this);
						var target = thiz.attr("data-target");
						var numberView = $(".number", layero);
						var activeView = $(".is-show", layero)
						if(target != null)
						{
							activeView.show(300);
							M.money = 0;
							numberView.val(0);
						}
						else
						{
							activeView.hide(300);
							var index = Number($(thiz).attr("index"));
							M.money = M.prices[index];
							numberView.val(M.money);
						}

						$(".price-item-active").removeClass("price-item-active");
						thiz.addClass("price-item-active")
					});
				}
			})
		}

		//创建订单
		M.createOrder = function( number,index)
		{
			if(msg.isEmpty(number))
			{
				errorMsg("请输入要充值的金额");
				return ;
			}

			var price = null;
			try
			{
				price = parseInt( number )
			}catch (e) {
				errorMsg("格式错误")
				return ;
			}

			if(price < 1)
			{
				errorMsg("请输入正整数");
				return ;
			}

			$.ajax({
				type: "POST",
				url: 'create_order',
				data: {totalAmount:price},
				dataType: 'json',
				cache: false,
				success: function (data) {
					if (data.code == 0) {
						M.toPay(data.data);
					}
					else
					{
						errorMsg(data.msg);
					}
				},
				error: function (data) {
					errorMsg('网络错误!');
				}
			});
			layer.close(index);

		}

		//支付
		M.toPay = function (data) {
			location.href = "/alipay/to_pay?outTradeNo=" + data.outTradeNo;
		}

		M.goPay = function (outTradeNo) {
			location.href = "/alipay/to_pay?outTradeNo=" + outTradeNo;
		}

		//申请提现
		M.withdraw = function () {
			var withdraw = $('.simple_dlg_define_2').html()
			layui.layer.open({
				type:1,
				title:'提现申请',
				content:withdraw,
				area:['600px','370px'],
				btn:['确认申请','取消'],
				btn1: function (index, layero) {
					//提现金额
					var number = $(".number", layero).val();
					var bankCard = $(".bankCard", layero).val();
					M.applyWithdrawal(number,bankCard,index);
				},
				btn2: function (index, layero) {
					layer.close(index)
				},success:function (layero,index) {
					form.render('select','withdrawal')
				}
			})
		}

		M.applyWithdrawal = function (number,bankCard,index) {
			if(msg.isEmpty(number))
			{
				errorMsg("请输入要提现的金额");
				return ;
			}

			if(msg.isEmpty(bankCard))
			{
				errorMsg("请选择银行卡");
				return ;
			}

			var price = null;
			try
			{
				price = parseInt( number )
			}catch (e) {
				errorMsg("格式错误")
				return ;
			}

			if(price < 1)
			{
				errorMsg("请输入正整数");
				return ;
			}

			$.ajax({
				type: "POST",
				url: 'apply_withdrawal',
				data: {money:price,bankCard:bankCard},
				dataType: 'json',
				cache: false,
				success: function (data) {
					if (data.code == 0) {
						successMsg("申请已提交");
						location.href = "/home/homeUser/index";
					}
					else
					{
						errorMsg(data.msg);
					}
				},
				error: function (data) {
					errorMsg('网络错误!');
				}
			});
			layer.close(index);
		}

		//添加银行卡
		M.addBackCard =function () {
			location.href = "/home/back_card/add";
		}

		//添加收件地址
		M.addLocations = function () {
			var locations = $('.simple_dlg_define_3').html()
			layer.open({
				type:1,
				title:'添加收货地址',
				content:locations,
				area:['800px','auto'],
				btn:['确认','取消'],
				btn1: function (index, layero) {
					var address = $(".address", layero).val().trim();
					var mobile = $('#mobile', layero).val().trim();
					M.addOneLocations(mobile,address,index)

				},
				btn2: function (index, layero) {
					layer.close(index)
				},
			})
		}

		M.addOneLocations = function (mobile,address,index){
			if(msg.isEmpty(mobile))
			{
				errorMsg("请输入手机号");
				return ;
			}
			if(!msg.isPhone(mobile)){
				errorMsg("手机号格式错误");
				return;
			}
			if(msg.isEmpty(address))
			{
				errorMsg("请输入地址");
				return ;
			}
			if(address.length < 2 || address.length > 100){
				errorMsg("地址需在2~100位");
				return ;
			}
			$.ajax({
				type: "POST",
				url: '/home/locations/add',
				data: {mobile:mobile,address:address},
				dataType: 'json',
				cache: false,
				success: function (data) {
					if (data.code == 0) {
						successMsg("添加成功");
						location.href = "/home/homeUser/index";
					}
					else
					{
						errorMsg(data.msg);
					}
				},
				error: function (data) {
					errorMsg('网络错误!');
				}
			});
			layer.close(index);

		}

		//编辑收件地址
		M.editLocation = function (localId,mobile,address){
			var locations = $('.simple_dlg_define_3').html();

			layer.open({
				type:1,
				title:'编辑收货地址',
				content:locations,
				area:['800px','auto'],
				btn:['确认','取消'],
				btn1: function (index, layero) {
					/*M.editOneLocations(mobile,address,index)*/
					var address1 = $(".address", layero).val().trim();
					var mobile1 = $('#mobile', layero).val().trim();
					var id = localId;
					M.editOneLocations(id,mobile1,address1,index)
				},
				btn2: function (index, layero) {
					layer.close(index)
				},
				success:function (layero, index) {
					$(".address", layero).val(address);
					$('#mobile', layero).val(mobile);
				}
			})
		}

		M.editOneLocations = function(id,mobile1,address1,index){
			if(msg.isEmpty(id))
			{
				errorMsg("请选择编辑的地址");
				return ;
			}
			if(msg.isEmpty(mobile1))
			{
				errorMsg("请输入手机号");
				return ;
			}
			if(!msg.isPhone(mobile1)){
				errorMsg("手机号格式错误");
				return;
			}
			if(msg.isEmpty(address1))
			{
				errorMsg("请输入地址");
				return ;
			}
			if(address1.length < 2 || address1.length > 100){
				errorMsg("地址需在2~100位");
				return ;
			}
			$.ajax({
				type: "POST",
				url: '/home/locations/edit',
				data: {id:id,mobile:mobile1,address:address1},
				dataType: 'json',
				cache: false,
				success: function (data) {
					if (data.code == 0) {
						successMsg("编辑成功");
						location.href = "/home/homeUser/index";
					}
					else
					{
						errorMsg(data.msg);
					}
				},
				error: function (data) {
					errorMsg('网络错误!');
				}
			});
			layer.close(index);
		}

		//删除地址  地址id
		M.deleteLocation = function (id) {
			$.ajax({
				type: "POST",
				url: '/home/locations/delete',
				data: {id:id},
				dataType: 'json',
				cache: false,
				success: function (data) {
					if (data.code == 0) {
						successMsg("删除成功");
						location.href = "/home/homeUser/index";
					}
					else
					{
						errorMsg(data.msg);
					}
				},
				error: function (data) {
					errorMsg('网络错误!');
				}
			});
		}

		//删除银行卡  银行卡id
		M.deleteCard = function(id){
			$.ajax({
				type: "POST",
				url: '/home/back_card/delete',
				data: {id:id},
				dataType: 'json',
				cache: false,
				success: function (data) {
					if (data.code == 0) {
						successMsg("删除成功");
						location.href = "/home/homeUser/index";
					}
					else
					{
						errorMsg(data.msg);
					}
				},
				error: function (data) {
					errorMsg('网络错误!');
				}
			});
		}

		//取消收藏
		M.cancelColl = function (id) {
			$.ajax({
				url:"/home/collect/delete",
				type:'POST',
				data:{id:id},
				dataType:'json',
				success:function(data){
					if(data.code == 0){
						successMsg("取消成功");
						location.href = "/home/homeUser/index";
					}else{
						errorMsg(data.msg);
					}
				},
				error:function(data){
					errorMsg("网络错误")
				}
			});
		}

		//项目提交申请
		M.submitProject = function (id) {
			$.ajax({
				url:"/home/project/submit_audit",
				type:'POST',
				data:{id:id},
				dataType:'json',
				success:function(data){
					if(data.code == 0){
						successMsg("已提交");
						location.href = "/home/homeUser/index";
					}else{
						errorMsg(data.msg+"，跳转到重新编辑");
						location.href = "/home/project/edit?id="+id;
					}
				},
				error:function(data){
					errorMsg("网络错误")
				}
			});
		}

		//编辑
		M.editProject = function (id) {
			location.href = "/home/project/edit?id="+id;
		}

		//确认接收
		M.ensureAccept = function (id) {
			$.ajax({
				type: "POST",
				url: '/home/accept/ensureAccept',
				data: {id:id},
				dataType: 'json',
				cache: false,
				success: function (data) {
					if (data.code == 0) {
						successMsg("确认成功");
						location.href = "/home/homeUser/index";
					}
					else
					{
						errorMsg(data.msg);
					}
				},
				error: function (data) {
					errorMsg('网络错误!');
				}
			})
		}

		//赠品管理  projectId
		M.feedAccept = function (projectId) {
			location.href = "/home/accept/list?projectId="+projectId;
		}
	</script>
</html>
