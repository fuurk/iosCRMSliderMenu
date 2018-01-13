//
//  BaskanlikTanitim.swift
//  AKSwiftSlideMenu
//
//  Created by MAC-186 on 4/8/16.
//  Copyright © 2016 Kode. All rights reserved.
//

import UIKit
import SwiftyJSON

class DepartmentIntroductionViewController: BaseViewController {
    
    // Since there are two http operations in this VC, a controller var named isActivityFinished is provided just to make sure
    // that both http operations are finished when indicator is dismissed.
    var isActivityFinished: Int = 0
    var imagePath: String?
    
    @IBOutlet weak var introductionText: UITextView!
    @IBOutlet weak var introductionEmblem: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginControl()
        //addSlideMenuButton() // Since this VC is always on top of VC stack, slide menu button should be in this VC.
        populateView()
        //checkIfUserIsLoggedIn() //Since it is first VC that should be loaded, login control is made here.
        DepartmentIntroduction()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    //MARK: Populating View
    func populateViewWithData (data: JSON){
        self.introductionText.attributedText = self.convertToAttributedString(htmlString: (data["resultSet"]["text"].rawString())!)
    }
    
    func populateView (){
        
        if isActivityFinished == 0{
            showActivityIndicator(uiView: self.view)
        }
        isActivityFinished -= 1
        HTTPConnectionHandler.sharedHandler.getDataFromService(httpMethod: .get, url: liveServerIp + "Presidental/GetPresidental", parameters: nil, completion: { (result) -> Void in
            if result == nil {
                self.showAlert(title: "Hata", text: "Lütfen bağlantınızı kontrol ediniz")
            }
            else {
                let res = JSON(result)
                if res != JSON.null {
                    self.populateViewWithData(data: res)
                    self.getImage(imagePath: res["resultSet"]["presidentialImages"][0]["imagePath"].rawString()!)
                    print(result)
                }
                else{
                    print("false")
                }
            }
            self.isActivityFinished += 1
            if self.isActivityFinished == 0{
                self.hideActivityIndicator(uiView: self.view)
            }
        })
    }
    
    func getImage (imagePath: String) {
        
        if isActivityFinished == 0 {
            showActivityIndicator(uiView: self.view)
        }
        isActivityFinished -= 1
        HTTPConnectionHandler.sharedHandler.getImageFromService(imageUrl: liveImageServerIp + imagePath, completion: {
            (result) -> Void in
            if result == nil {
                self.showAlert(title: "Hata", text: "Lütfen bağlantınızı kontrol ediniz")
            }
            else {
                let image = result
                if image != nil {
                    self.introductionEmblem.image = image
                } else {
                    print("false")
                }
                self.isActivityFinished += 1
                if self.isActivityFinished >= 0{
                    self.hideActivityIndicator(uiView: self.view)
                }
            }
        })
    }
    
    func checkIfUserIsLoggedIn(){
        if UserDefaults.standard.value(forKey: "isUserActive") as? Bool == false {
            self.openViewControllerBasedOnIdentifier("girisEkrani")
        }
        else {
            populateView()
        }
    }
    
    //Will be implemented. 
    func initSwipeGesture(){
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.backGesture(sender:)))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        //for initial commit
    }
    
    @objc func backGesture(sender:UISwipeGestureRecognizer?) {
        let x = self.onSlideMenuButtonPressed(_:)
        print(x)
    }
    
    func convertToAttributedString(htmlString: String) -> NSAttributedString {
        let htmlData = NSString(string: htmlString).data(using: String.Encoding.unicode.rawValue)
        let options = [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html]
        let attributedString = try! NSAttributedString(data: htmlData!, options: options, documentAttributes: nil)
        return attributedString
    }
    
    // MARK: AutoLayout
    func DepartmentIntroduction() {
        introductionEmblem.translatesAutoresizingMaskIntoConstraints = false
        introductionEmblem.contentMode = .scaleToFill
        introductionEmblem.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        introductionEmblem.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        introductionEmblem.bottomAnchor.constraint(equalTo: introductionText.topAnchor).isActive = true
        introductionEmblem.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        
        introductionText.translatesAutoresizingMaskIntoConstraints = false
        introductionText.topAnchor.constraint(equalTo: introductionEmblem.bottomAnchor).isActive = true
        introductionText.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        introductionText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        introductionText.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}
