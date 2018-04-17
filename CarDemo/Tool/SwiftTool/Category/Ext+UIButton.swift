//
//  Ext+UIButton.swift
//  CarDemo
//
//  Created by 刘旭 on 2018/4/17.
//  Copyright © 2018年 Jason. All rights reserved.
//

import UIKit

extension UIButton {
    
    /// 倒计时
    ///
    /// - parameter timeLine: 倒计时总时间
    /// - parameter title: 还没倒计时的title
    /// - parameter mainBGColor: 还没倒计时的背景颜色
    /// - parameter mainTitleColor: 还没倒计时的文字颜色
    /// - parameter countBGColor: 倒计时中的背景颜色
    /// - parameter countTitlecolor: 倒计时中的文字颜色
    /// - parameter handle: 点击按钮的事件
    /// - returns: void
    
    func startTimer( _ timeLine: Int, title: String, mainBGColor: UIColor, mainTitleColor: UIColor, countBGColor: UIColor, countTitleColor: UIColor, handle: (() -> Void)?) {
        var time = timeLine
        // 先创建一个默认队列
        let queue = DispatchQueue.global(qos: .default)
        
        // 再创建一个用户事件 source 倒计时
        let timer = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags(rawValue: UInt(0)), queue: queue)
        
        // 把timer设置进去
        /**
         start参数控制计时器第一次触发的时刻。参数类型是 dispatch_time_t，这是一个opaque类型，我们不能直接操作它。我们得需要 dispatch_time 和  dispatch_walltime 函数来创建它们。另外，常量  DISPATCH_TIME_NOW 和 DISPATCH_TIME_FOREVER 通常很有用。
         interval参数没什么好解释的。
         leeway参数比较有意思。这个参数告诉系统我们需要计时器触发的精准程度。所有的计时器都不会保证100%精准，这个参数用来告诉系统你希望系统保证精准的努力程度。如果你希望一个计时器没五秒触发一次，并且越准越好，那么你传递0为参数。另外，如果是一个周期性任务，比如检查email，那么你会希望每十分钟检查一次，但是不用那么精准。所以你可以传入60，告诉系统60秒的误差是可接受的。
         */
        timer.schedule(deadline: DispatchTime.now(),
                       repeating: .seconds(1),
                       leeway: .seconds(0)
        )
        
        // 内建事件
        timer.setEventHandler {[weak self] () -> Void in
            if let strongSelf = self {
                
                if time == 1 {
                    
                    // 只能用这种方式取消
                    timer.cancel()
                    // 刷新UI要回到主线程
                    DispatchQueue.main.async(execute: { () -> Void in
                        
                        strongSelf.backgroundColor = mainBGColor
                        strongSelf.setTitleColor(mainTitleColor, for: UIControlState())
                        strongSelf.setTitle(title, for: UIControlState())
                        strongSelf.isUserInteractionEnabled = true // 这里不要用enable
                        
                    })
                    
                } else {
                    //                    let content = "重新获取" + "（\((time - 1) % 60)s）"
                    let content = "\((time - 1) % 60)s"
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        
                        strongSelf.backgroundColor = countBGColor
                        strongSelf.setTitleColor(countTitleColor, for: UIControlState())
                        strongSelf.setTitle(content, for: UIControlState())
                        //                    self.titleLabel?.text = content
                        strongSelf.isUserInteractionEnabled = false // 这里不要用enable
                        
                    })
                    
                }
                
            }
            
            time -= 1
            
        }
        
        // 启动
        timer.resume()
        
        if handle != nil {
            handle!()
        }
        
    }
    
    
    
    // 图片和title位置的变化
    @objc func set(image anImage: UIImage?, title: String,
                   titlePosition: UIViewContentMode, additionalSpacing: CGFloat, state: UIControlState){
        self.imageView?.contentMode = .center
        self.setImage(anImage, for: state)
        
        positionLabelRespectToImage(title: title, position: titlePosition, spacing: additionalSpacing)
        
        self.titleLabel?.contentMode = .center
        self.setTitle(title, for: state)
    }
    
    private func positionLabelRespectToImage(title: String, position: UIViewContentMode,
                                             spacing: CGFloat) {
        let imageSize = self.imageRect(forContentRect: self.frame)
        let titleFont = self.titleLabel?.font!
        let titleSize = title.size(withAttributes: [NSAttributedStringKey.font: titleFont!])
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch (position){
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                                       right: -(titleSize.width * 2 + spacing))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }

}
