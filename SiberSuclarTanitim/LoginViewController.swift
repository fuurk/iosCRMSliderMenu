//
//  LoginViewController.swift
//  SiberSuclarTanitim
//
//  Created by 2016 on 4.12.2017.
//  Copyright © 2017 Kode. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoginViewController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var cyberEmblem: UIImageView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginPasswordLabel: UILabel!
    @IBOutlet weak var userNameField: UITextField!
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        if (userNameField.text == "" || passwordField.text == ""){
            showAlert(title: "Hata", text: "Lütfen tüm alanları doldurunuz.")
        }
        else {
            login()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.setHidesBackButton(true, animated: true)
        passwordField.isSecureTextEntry = true
        self.navigationItem.hidesBackButton = true
        cyberEmblem.loadGif(name: "siberLogoTurn")
        loginLayout()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        userNameField.delegate = self
        userNameField.returnKeyType = .done
        passwordField.delegate = self
        passwordField.returnKeyType = .done
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func login (){
        
        showActivityIndicator(uiView: self.view)
        var paramDict = ["userName": self.userNameField.text!, "password": self.passwordField.text!]
        HTTPConnectionHandler.sharedHandler.getDataFromService(httpMethod: .post, url: liveServerIp + "LDAP/Login", parameters: paramDict, completion: { (result) -> Void in
            if result != nil {
                print(result!)
                let res = JSON(result!)
                if res != JSON.null && res["isSuccess"] == true {
                    self.setCredentialsForAutoLogin(name: self.userNameField.text!, password: self.passwordField.text!, isLoggedIn: true)
                    self.openViewControllerBasedOnIdentifier("BaskanlikTanitim")
                }
                else{
                    self.showAlert(title: "Uyarı", text: "Kullanıcı adı veya şifre hatalı.")
                }
            }
            
            self.hideActivityIndicator(uiView: self.view)
        })
    }
    func setCredentialsForAutoLogin(name: String, password: String, isLoggedIn: Bool){
        
        UserDefaults.standard.set(name, forKey: "userName")
        UserDefaults.standard.set(password, forKey: "password")
        UserDefaults.standard.set(isLoggedIn, forKey: "isUserActive")
    }
    func loginLayout()
    {
        cyberEmblem.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        loginPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        cyberEmblem.widthAnchor.constraint(equalToConstant: 150).isActive = true
        cyberEmblem.heightAnchor.constraint(equalToConstant: 150).isActive = true
        cyberEmblem.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cyberEmblem.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
       
        userNameLabel.centerYAnchor.constraint(equalTo: cyberEmblem.bottomAnchor, constant: 20).isActive = true
        userNameLabel.leftAnchor.constraint(equalTo: userNameField.leftAnchor).isActive = true
        
        userNameField.widthAnchor.constraint(equalToConstant: 277).isActive = true
        userNameField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userNameField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userNameField.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor).isActive = true
        
        loginPasswordLabel.centerYAnchor.constraint(equalTo: userNameField.bottomAnchor, constant: 20).isActive = true
        loginPasswordLabel.leftAnchor.constraint(equalTo: passwordField.leftAnchor).isActive = true
        
        passwordField.widthAnchor.constraint(equalToConstant: 277).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordField.topAnchor.constraint(equalTo: loginPasswordLabel.bottomAnchor).isActive = true
        
        loginButton.widthAnchor.constraint(equalToConstant: 277).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20).isActive = true
        
    }
    
    
}
