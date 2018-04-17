//
//  WKWebViewController.swift
//  YiDao
//
//  Created by Wicrenet_Jason on 2017/12/11.
//  Copyright © 2017年 Wicrenet_Jason. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController {

    var bodyStr: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
    }
    
    func addLoadUrlAction(urlString: String) {
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        self.webView.load(request)
    }
    
    func addHtmlAction(contentString: String) {
        bodyStr = contentString

        let path = Bundle.main.path(forResource: "info-detail", ofType: "html")
        // 获得html内容
        do {
            let html = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
            // 加载js
            webView.loadHTMLString(html, baseURL: Bundle.main.bundleURL)
        } catch { }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK:Lazy
    lazy var webView: WKWebView = {
       let v = WKWebView.init(frame: CGRect(x: 0, y: 0, w: SCREEN_WIDTH, h: self.view.h))
        v.navigationDelegate = self
        view.addSubview(v)
        return v
    }()
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WKWebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        if bodyStr != "" {
            let jscript = String("document.getElementById('content').innerHTML=\"") + bodyStr + String("\";")
            // 调用JS代码
            webView.evaluateJavaScript(jscript) { (object, error) in
                printLog(jscript)
            }
        }
       
    }
}
