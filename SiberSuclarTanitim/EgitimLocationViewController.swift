//
//  EgitimLocationViewController.swift
//  SiberSuclarTanitim
//
//  Created by 2016 on 6.01.2018.
//  Copyright © 2018 Kode. All rights reserved.
//

import Foundation
import WebKit
import UIKit

class EgitimLocationViewController: BaseViewController, WKUIDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    var locationUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), configuration: webConfiguration)
        webView.navigationDelegate = self
        view = webView
        if locationUrl != nil {
            populateWebView(urlString: locationUrl!)
        } else {
            showAlert(title: "Hata", text: "Bir Hata Oluştu. Lütfen tekrar deneyin.")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.showActivityIndicator(uiView: self.view)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.hideActivityIndicator(uiView: self.view)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.hideActivityIndicator(uiView: self.view)
        self.showAlert(title: "Uyarı", text: "Bir hata oluştu. Lütfen tekrar deneyiniz.")
    }
    func setupWebViewLayout () {
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        webView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func populateWebView(urlString: String) {
            let urlStringWithDecentForm = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let url = URL(string: urlStringWithDecentForm!)
            let request = URLRequest(url: url!)
            webView.load(request)
    }
    
}
