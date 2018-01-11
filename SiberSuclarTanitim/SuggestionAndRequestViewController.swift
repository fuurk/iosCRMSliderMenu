//
//  IstekOneriViewController.swift
//  SiberSuclarTanitim
//
//  Created by 2016 on 14.12.2017.
//  Copyright © 2017 Kode. All rights reserved.
//

import UIKit
import SwiftyJSON

class SuggestionAndRequestViewController: BaseViewController {
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!
    @IBOutlet weak var requestLabel: UILabel!
    @IBOutlet weak var subjectTextField: UITextField?
    @IBOutlet weak var requestTextView: UITextView?
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        requestTextView?.layer.borderWidth = 0.5
        requestTextView?.layer.borderColor = borderColor.cgColor
        requestTextView?.layer.cornerRadius = 5.0
        suggestionLayout()
    }
    
    override func didReceiveMemoryWarning() {
        super.viewDidLoad()
    }
    
    @IBAction func sendButton(_ sender: Any) {
        if (subjectTextField?.text == "" || requestTextView?.text == "") {
            showAlert(title: "Hata", text: "Lütfen tüm alanları doldurunuz.")
        }
        else {
            self.showActivityIndicator(uiView: self.view)
            let paramDict = ["UserId": UserDefaults.standard.value(forKey: "userName"), "title": self.subjectTextField?.text!, "text": self.requestTextView?.text!]
            HTTPConnectionHandler.sharedHandler.getDataFromService(httpMethod: .post, url: liveServerIp + "Suggestion/AddSuggestion", parameters: paramDict, completion: { (result) -> Void in
                if result == nil {
                    self.showAlert(title: "Hata", text: "Lütfen bağlantınızı kontrol ediniz")
                }
                else {
                    print(result!)
                    let res = JSON(result!)
                    if res["isSuccess"] == true {
                        self.showAlert(title: "Öneri", text: "Öneri - İsteğiniz başarılı bir şekilde ulaştı.")
                        self.subjectTextField?.text = ""
                        self.requestTextView?.text = ""
                    }
                    else {
                        self.showAlert(title: "Hata", text: "Bir hata oluştu. Lütfen tekrar deneyiniz.")
                    }
                }
                self.hideActivityIndicator(uiView: self.view)
            })
        }
    }
    
    func suggestionLayout()
    {
        requestLabel.translatesAutoresizingMaskIntoConstraints = false
        subjectLabel.translatesAutoresizingMaskIntoConstraints = false
        suggestionLabel.translatesAutoresizingMaskIntoConstraints = false
        subjectTextField?.translatesAutoresizingMaskIntoConstraints = false
        requestTextView?.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        
        requestLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        requestLabel.heightAnchor.constraint(equalToConstant: 58).isActive = true
        requestLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        requestLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        
        subjectLabel.topAnchor.constraint(equalTo: requestLabel.bottomAnchor, constant: 15).isActive = true
        subjectLabel.leftAnchor.constraint(equalTo: (subjectTextField?.leftAnchor)!).isActive = true
        
        suggestionLabel.topAnchor.constraint(equalTo: (subjectTextField?.bottomAnchor)!, constant: 15).isActive = true
        suggestionLabel.leftAnchor.constraint(equalTo: (requestTextView?.leftAnchor)!).isActive = true
        
        subjectTextField?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        subjectTextField?.widthAnchor.constraint(equalToConstant: 343).isActive = true
        subjectTextField?.heightAnchor.constraint(equalToConstant: 30).isActive = true
        subjectTextField?.topAnchor.constraint(equalTo: subjectLabel.bottomAnchor).isActive = true
        
        requestTextView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        requestTextView?.widthAnchor.constraint(equalToConstant: 343).isActive = true
        requestTextView?.heightAnchor.constraint(equalToConstant: 180).isActive = true
        requestTextView?.topAnchor.constraint(equalTo: suggestionLabel.bottomAnchor).isActive = true
        
        sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sendButton.topAnchor.constraint(equalTo: (requestTextView?.bottomAnchor)!, constant:15).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 183).isActive = true
    }
}
