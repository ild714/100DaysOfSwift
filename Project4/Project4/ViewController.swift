//
//  ViewController.swift
//  Project4
//
//  Created by Ильдар Нигметзянов on 20/07/2019.
//  Copyright © 2019 Learning with Swift. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView : WKWebView!
    var progressView : UIProgressView!
    var webSites = ["google.com","apple.com","hackingwithswift.com"]
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        let back = UIBarButtonItem(barButtonSystemItem: .rewind, target: webView, action: #selector(webView.goBack))
        
        let forward = UIBarButtonItem(barButtonSystemItem: .fastForward, target: webView, action: #selector(webView.goForward))
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        
        let progressButton = UIBarButtonItem(customView: progressView)
        
        toolbarItems = [back,spacer,progressButton,spacer,forward,refresh]
        navigationController?.isToolbarHidden = false
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        let url = URL(string:"https://" + webSites[0])!
        webView.load(URLRequest(url:url))
        webView.allowsBackForwardNavigationGestures = true
        
        
    }

    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        for webSite in webSites {
        ac.addAction(UIAlertAction(title: webSite, style: .default, handler: openPage))
            }
       
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(ac,animated: true)
    }
    
    func openPage(action : UIAlertAction) {
        guard let actionTitle = action.title else {return}
        guard let url = URL(string: "https://" + actionTitle) else { return }
        webView.load(URLRequest(url:url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        if let host = url?.host {
            for website in webSites {
                if host.contains(website) {
                    decisionHandler(.allow)
                    return
                } else {
                    let alert = UIAlertController(title: "Stop", message: "This cite is not allowed", preferredStyle: .actionSheet)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
                    present (alert,animated: true)
                }
            }
        }
        decisionHandler(.cancel)
    }
}

