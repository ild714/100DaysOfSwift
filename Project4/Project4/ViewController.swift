//
//  ViewController.swift
//  Project4
//
//  Created by Ильдар Нигметзянов on 23.10.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate, UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openPage(action: websites[indexPath.row])
    }
    
    @IBOutlet weak var table: UITableView!
    var webView: WKWebView!
    var progressView: UIProgressView!
    var websites = ["apple.com","hackingwithswift.com","yandex.ru"]
    var web: ViewController!
    
    /*
    override func loadView(){
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        //table.delegate = self
        
        //let url = URL(string: "https://" + websites[0])!
        //webView.load(URLRequest(url:url))
        
        
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Open",style:.plain,target: self,action: #selector(openTapped))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(back1))
        
        let back = UIBarButtonItem(title: "Back", style: .plain, target: webView, action: #selector(webView.goBack))
        let forward = UIBarButtonItem(title: "Forward", style: .plain, target: webView, action: #selector(webView.goForward))
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        toolbarItems = [back,forward,spacer,progressButton,spacer,refresh]
        navigationController?.isToolbarHidden = false
        
        //webView.addObserver(self,forKeyPath: #keyPath(WKWebView.estimatedProgress),options:.new,context:nil)
    }

    @objc func back1() {
       loadView()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    /*
    @objc func openTapped() {
        let ac = UIAlertController(title:"Open page...",message: nil,preferredStyle: .actionSheet)
        for website in websites {
         ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
        }
        ac.addAction(UIAlertAction(title:"Cancel",style: .cancel))
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(ac,animated: true)
    }
    */
    func openPage(action: String){
        webView = WKWebView()
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        view = webView
        let url = URL(string: "https://" + action)!
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        
        if let host = url?.host {
            for website in websites {
                if host.contains(website){
                decisionHandler(.allow)
                return
                }
        }
//            let ac = UIAlertController(title: "The cite is blocked", message: nil, preferredStyle: .alert)
//            ac.addAction(UIAlertAction(title: "close", style: .cancel, handler: nil))
//            present(ac,animated: true)
    }
        decisionHandler(.cancel)
}

}
