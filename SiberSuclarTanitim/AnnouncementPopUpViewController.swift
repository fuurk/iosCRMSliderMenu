//
//  DuyuruPopUpViewController.swift
//  SiberSuclarTanitim
//
//  Created by 2016 on 29.11.2017.
//  Copyright © 2017 Kode. All rights reserved.
//

import UIKit

class AnnouncementPopUpViewController: BaseViewController {
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var announcementTitleLabel: UILabel!
    @IBOutlet weak var announcementTextLabel: UITextView!
    var announcementTitle: String = ""
    var announcementText: String = ""
    
    @IBAction func exitButton(sender: AnyObject){
        self.view.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTexts(title: announcementTitle, text: announcementText)
        view.backgroundColor = UIColor.clear
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.frame
        self.view.insertSubview(blurEffectView, at: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func setTexts(title: String, text: String){
        announcementTitleLabel.text = title
        announcementTextLabel.text = text
    }
}
