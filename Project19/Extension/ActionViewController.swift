//
//  ActionViewController.swift
//  Extension
//
//  Created by Ильдар Нигметзянов on 17.11.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import UIKit
import MobileCoreServices

class ActionViewController: UIViewController {

    @IBOutlet weak var script: UITextView!

    var pageTtile = ""
    var pageURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
    
        let notificationCenter = NotificationCenter.default
        
        
        if let inputItem = extensionContext?.inputItems.first as? NSExtensionItem{
            if let itemProvided = inputItem.attachments?.first{
                    itemProvided.loadItem(forTypeIdentifier: kUTTypePropertyList as String){
                        [weak self] (dict,error) in
                        guard let itemDictionary = dict as? NSDictionary else {
                            return
                        }
                        guard let javaScriptValues = itemDictionary[NSExtensionJavaScriptPreprocessingResultsKey] as? NSDictionary else {return}
                       self?.pageTtile = javaScriptValues["title"] as? String ?? ""
                    self?.pageURL = javaScriptValues["URL"] as? String ?? ""
                        
                        DispatchQueue.main.async {
                            self?.title = self?.pageTtile
                        }
                }
            }
        }
        
    }

    @IBAction func done() {
        let item = NSExtensionItem()
        let argument: NSDictionary = ["customJavaScript": script.text]
        let webDictionary: NSDictionary = [NSExtensionJavaScriptFinalizeArgumentKey:argument]
        let customJavaScript = NSItemProvider(item: webDictionary, typeIdentifier: kUTTypePropertyList as String)
        item.attachments = [customJavaScript]
        extensionContext?.completeRequest(returningItems: [item])
        
    }

}
