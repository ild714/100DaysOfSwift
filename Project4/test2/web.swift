//
//  web.swift
//  test2
//
//  Created by Ильдар Нигметзянов on 02/09/2019.
//  Copyright © 2019 Nigmetzyanov Ildar. All rights reserved.
//

import UIKit
import WebKit

class web: UIViewController, WKNavigationDelegate {

    var websites = ["apple.com","hackingwithswift.com","google.com"]
    var webView: WKWebView!
    var text: String!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://" + text)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
    }
    

    
   

}
