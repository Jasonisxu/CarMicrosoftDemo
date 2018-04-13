//
//  ApiPath.swift
//  YiDao
//
//  Created by Wicrenet_Jason on 2017/10/16.
//  Copyright © 2017年 Wicrenet_Jason. All rights reserved.
//

import Foundation

//let BaseUrl = "http://wise-yidao-service.ketongtx.com" //内网开发

let BaseUrl = "http://beta.dlm.ed58.net"


let MAIN_URL                               = "/wise-yidao/rs/client/"
/****************************API_URL接口**********************************/
//测试
let URL_Test                               = "ClientCategory/listCache"

/****************************图片上传**********************************/
let URL_ClientUpload                         = "ClientUpload"

/****************************登录**********************************/
//发送验证码
let URL_LoginCode                          = "ClientUserLogin/sendLoginSmsCode"
//登录
let URL_Login                              = "ClientUserLogin/mobileLogin"

/****************************下单页面**********************************/
//货品类别
let URL_ListCache                          = "ClientCategory/listCache"
//保价服务
let URL_SupportList                        = "ClientSupportValue/list"
//历史地址
let URL_History_AddressList                = "ClientAddress/list"

/****************************个人信息**********************************/
//个人信息
let URL_Customer                           = "ClientCustomer/my"
//更新信息
let URL_CustomerUpdate                           = "ClientCustomer/update"

/****************************身份验证**********************************/
//提交认证
let URL_CertificationAdd                           = "ClientCertification/add"

/****************************订单**********************************/
//下单
let URL_OrderAdd                           = "ClientOrder/add"
//再次支付
let URL_OrderRepay                           = "ClientOrder/repay"
//发单列表
let URL_OrderList                           = "ClientOrder/list"
//撤销未支付订单
let URL_CancelOrder                        = "ClientOrder/canceled"

/****************************接单**********************************/
//等待接单列表
let URL_OrderTakingList                    = "ClientOrder/orderTakingList"
//接单按钮
let URL_OrderTaking                   = "ClientOrder/orderTaking"
//订单id获取订单详情
let URL_ByID                          = "ClientOrder/byId"
//已接单订单列表
let URL_OrderTakedList                    = "ClientOrder/orderTakedList"
//获取真实手机号
let URL_OrderRealPhone                    = "ClientOrder/realPhone"
//重新发送取货码
let URL_OrderDeliverLockerCode                   = "ClientOrder/deliverLockerCode"
//验证取货码
let URL_OrderDeliverSuccess                  = "ClientOrder/deliverSuccess"
//重新发送收货码
let URL_OrderPickupLockerCode                   = "ClientOrder/pickupLockerCode"
//验证收货码
let URL_OrderPickupSuccess                    = "ClientOrder/pickupSuccess"
//上传取货凭证
let URL_OrderUploadDeliverImgs                   = "ClientOrder/uploadDeliverImgs"
//确认送达
let URL_OrderArrivalSuccess                  = "ClientOrder/arrivalSuccess"
//无法配送
let URL_OrderUnableToDeliver                = "ClientOrder/unableToDeliver"


/****************************评价**********************************/
//查询某用户被评价列表 收到的评价
let URL_ReviewSearchUserReviewList                 = "ClientReview/searchUserReviewList"
//添加评价
let URL_AddOrderEvaluation                         = "ClientReview/add"
//发出的评价
let URL_ReviewSentList                               = "ClientReview/myReviewList"

/****************************钱包**********************************/
//账户查询
let URL_WalletAccount                         = "wallet/account"
//账户交易明细
let URL_WalletLogs                             = "wallet/logs"
//充值
let URL_WalletRecharge                         = "wallet/recharge"
//钱包支付订单接口
let URL_WalletPay                       = "wallet/pay"

/****************************提现账户**********************************/
//新增用户提现账户
let URL_WdrAccAdd                         = "WdrAcc/add"
//设置账户为默认提现账户
let URL_WdrAccDefaults                         = "WdrAcc/defaults"
//删除
let URL_WdrAccDelete                         = "WdrAcc/delete"
//用户提现账户列表
let URL_WdrAccList                        = "WdrAcc/list"
//修改用户提现账户
let URL_WdrAccUpdate                        = "WdrAcc/update"

/****************************提现**********************************/
//提现申请
let URL_WdrApplyAdd                         = "wdrApply/add"

/****************************设置支付密码 / 获取驿道客服电话**********************************/
//发送短信验证码
let URL_GetCode                           = "setting/password/code"
//设置密码
let URL_SetPwd                               = "setting/password/set"
//获取驿道客服电话
let URL_GetServiceCall                        = "setting/call"


/****************************骑士学院**********************************/
//培训主题列表
let URL_TrainList                          = "ClientTrainTheme/list"
//培训考试试题
let URL_ClientTrainQuestionList                          = "ClientTrainQuestion/list"
//答题完成
let URL_ClientTrainQuestionDone                          = "ClientTrainQuestion/done"
//查询培训练习
let URL_ClientTrainDataList                          = "ClientTrainData/list"

/****************************意见反馈**********************************/
let URL_FeedBack                                      = "ClientComments/add"

/****************************投诉举报**********************************/
//原因
let URL_ClientComplaintReasonList                          = "ClientComplaintReason/list"
//新增投诉，举报
let URL_ClientComplaintAdd                        = "ClientComplaint/add"

/****************************规则**********************************/
//获取所有文章规则
let URL_EssayList                        = "essay/list"
//根据types获取文章
let URL_EssayOne                        = "essay/one"















