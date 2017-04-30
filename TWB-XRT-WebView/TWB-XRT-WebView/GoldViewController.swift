//
//  ViewController.swift
//  TWB-XRT-WebView
//
//  Created by Chang Ming-hsuan on 1/30/17.
//  Copyright © 2017 Chang Ming-hsuan. All rights reserved.
//

import UIKit

class GoldViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var goldWebView: UIWebView!
    
    @IBAction func reloadPage(_ sender: Any) {
        goldWebView.reload()
    }
    
    @IBAction func backPage(_ sender: Any) {
        if goldWebView.canGoBack {
            goldWebView.goBack()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goldWebView.delegate = self
        
        let botGoldURL = URL(string: "http://rate.bot.com.tw/gold?Lang=zh-TW")
        let botGoldURLRequest = URLRequest(url: botGoldURL!)
        goldWebView.loadRequest(botGoldURLRequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        var javascript = "jQuery('.H1_div_ctrl').remove();"
        javascript += "jQuery('.dl-horizontal').replaceWith('<br />');"
        javascript += "jQuery('.container p')[0].remove();"
        
        goldWebView.stringByEvaluatingJavaScript(from: javascript)
    }
    
}
