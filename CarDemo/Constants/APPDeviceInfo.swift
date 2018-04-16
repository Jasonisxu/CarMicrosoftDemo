//
//  APPDeviceInfo.swift
//  CarDemo
//
//  Created by 刘旭 on 2018/4/16.
//  Copyright © 2018年 Jason. All rights reserved.
//

import Foundation

//应用程序信息
let APP_infoDictionary = Bundle.main.infoDictionary!
let APP_appDisplayName = APP_infoDictionary["CFBundleDisplayName"] //程序名称
let APP_majorVersion = APP_infoDictionary["CFBundleShortVersionString"]//主程序版本号
let APP_minorVersion = APP_infoDictionary["CFBundleVersion"]//版本号（内部标示）
let APP_appVersion = APP_infoDictionary as! String

//设备信息
let Device_iosVersion = UIDevice.current.systemVersion //iOS版本
let Device_identifierNumber = UIDevice.current.identifierForVendor //设备udid
let Device_systemName = UIDevice.current.systemName //设备名称
let Device_model = UIDevice.current.model //设备型号
let Device_modelName = UIDevice.current.name //设备具体型号
let Device_localizedModel = UIDevice.current.localizedModel //设备区域化型号如A1533
