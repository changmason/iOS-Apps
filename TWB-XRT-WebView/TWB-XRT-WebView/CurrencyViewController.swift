//
//  ViewController.swift
//  TWB-XRT-WebView
//
//  Created by Chang Ming-hsuan on 1/30/17.
//  Copyright © 2017 Chang Ming-hsuan. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var currencyWebView: UIWebView!
    
    @IBAction func reloadPage(_ sender: Any) {
        currencyWebView.reload()
    }

    @IBAction func backPage(_ sender: Any) {
        if currencyWebView.canGoBack {
            currencyWebView.goBack()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyWebView.delegate = self
        
        let botXrtURL = URL(string: "http://rate.bot.com.tw/xrt?Lang=zh-TW")
        let botXrtURLRequest = URLRequest(url: botXrtURL!)
        currencyWebView.loadRequest(botXrtURLRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        var javascript = "jQuery('.H1_div_ctrl').remove();"
        javascript += "jQuery('.dl-horizontal').replaceWith('<br />');"
        javascript += "jQuery('.container p')[0].remove();"
        javascript += "jQuery('p.text-info').html(jQuery('p.text-info').html().replace(/牌價最新掛牌時間：/, '掛牌時間：'+jQuery('span.time').text()));"
        javascript += "jQuery('span.time').remove();"
        javascript += "jQuery('p#rate-toggles button').last().click();"
        
        currencyWebView.stringByEvaluatingJavaScript(from: javascript)
    }

}

