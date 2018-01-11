//
//  ViewController.swift
//  WebView_servis_rehberi
//
//  Created by alimurat_mac on 28.11.2017.
//  Copyright © 2017 alimurat_mac. All rights reserved.
//

import UIKit
import WebKit
import SwiftyJSON

class BusRoutesViewController: BaseViewController, UIPickerViewDataSource, UIPickerViewDelegate, WKUIDelegate, WKNavigationDelegate {
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var webView: WKWebView!
    var routeDictJson: JSON!
    var routeDict = [String : String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), configuration: webConfiguration)
       
        webView.navigationDelegate = self
        //webView.uiDelegate = self
        view = webView
        
        view.addSubview(pickerView)
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.isOpaque = true
        setupPickerLayout()
        getAddressesFromServer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.showActivityIndicator(uiView: self.view)
        self.pickerView.isUserInteractionEnabled = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.hideActivityIndicator(uiView: self.view)
        self.pickerView.isUserInteractionEnabled = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.hideActivityIndicator(uiView: self.view)
        self.pickerView.isUserInteractionEnabled = true
        self.showAlert(title: "Uyarı", text: "Bir hata oluştu. Lütfen tekrar deneyiniz.")
    }
    func setupWebViewLayout () {
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        webView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func setupPickerLayout () {
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        pickerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        pickerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
       
    }

    // returns the number of 'columns' to display.
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    // returns the # of rows in each component..
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return routeDict.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var adresler = Array(routeDict.keys)
        populateWebView(url: routeDict[adresler[0]]!)
        return adresler[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var urlArray = Array(routeDict.values)
        populateWebView(url: urlArray[row])
    }
    
    func populateWebView(url: String) {
        
        let url = URL(string: url)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    func getAddressesFromServer () {
        
        HTTPConnectionHandler.sharedHandler.getDataFromService(httpMethod: .get, url: liveServerIp + "BusRoute/GetBusRoutes", parameters: nil, completion: { (result) -> Void in
            if result == nil {
                self.showAlert(title: "Hata", text: "Lütfen bağlantınızı kontrol ediniz")
            }
            else {
                let res = JSON(result!)
                if res != JSON.null {
                    self.routeDictJson = res["resultSet"]
                    
                    for i in 0...(self.routeDictJson?.count)!-1 {
                        self.routeDict[self.routeDictJson[i]["name"].rawString()!] = self.routeDictJson[i]["locationLink"].rawString()!
                    }
                    self.pickerView.reloadAllComponents()
                }
                else{
                    print("false")
                }
            }
            self.hideActivityIndicator(uiView: self.view)
        })
        
        
    }
    
}


