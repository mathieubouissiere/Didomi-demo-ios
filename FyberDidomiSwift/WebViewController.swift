//
//  WebViewController.swift
//  FyberDidomiSwift
//
//  Created by Mathieu Bouissiere on 09/07/2019.
//  Copyright © 2019 AKB. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    //@IBOutlet  var webView:WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = WKWebView()
        webView.navigationDelegate = self
        
        let originY: CGFloat = self.navigationController!.navigationBar.frame.maxY
        print("Navigation bar heigh:", originY)
        let url = URL(string: "https://www.google.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        webView.backgroundColor = UIColor.red
        webView.frame = CGRect.init(x: 0, y: originY, width: self.view.frame.width, height: self.view.frame.height-originY)
        self.view.addSubview(webView)
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
