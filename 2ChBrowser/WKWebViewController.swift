//
//  WKWebViewController.swift
//  2ChBrowser
//
//  Created by Shigeo Sakamoto on 2017/02/11.
//  Copyright © 2017年 Shigeo Sakamoto. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    var data:(name:String, url:String)?

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let myURL = URL(string: (data?.url)!) {
            let myRequest = URLRequest(url: myURL)

            webView.load(myRequest)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
