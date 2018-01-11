//
//  EgitimPopUpViewController.swift
//  SiberSuclarTanitim
//
//  Created by 2016 on 29.11.2017.
//  Copyright © 2017 Kode. All rights reserved.
//

import UIKit

class TrainingPopUpViewController: BaseViewController {
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var trainingTitleLabel: UILabel!
    @IBOutlet weak var trainingStartDateLabel: UILabel!
    @IBOutlet weak var trainingEndDateLabel: UILabel!
    @IBOutlet weak var trainingStartHourLabel: UILabel!
    @IBOutlet weak var trainingTotalTimeLabel: UILabel!
    
    @IBOutlet weak var trainingTextLabel: UITextView!
    
    var trainingTitle: String = ""
    var trainingText: String = ""
    var trainingStart: String = ""
    var trainingEnd: String = ""
    var trainingHour: String = ""
    var trainingTotalTime: String = ""
    var trainingLocation: String = ""
    
    @IBAction func exitButton(sender: AnyObject){
        self.view.removeFromSuperview()
    }
    
    @IBAction func goToMapButton(sender: AnyObject){
        let egitimLocationViewController = self.storyboard?.instantiateViewController(withIdentifier: "EgitimLocation") as! EgitimLocationViewController!
        
        egitimLocationViewController?.locationUrl = trainingLocation
        self.navigationController!.pushViewController(egitimLocationViewController!, animated: false)
       
        /*self.addChildViewController(egitimLocationViewController!)
        egitimLocationViewController?.view.frame = self.view.frame
        self.view.addSubview((egitimLocationViewController?.view)!)
        egitimLocationViewController?.didMove(toParentViewController: self)*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTexts(title: trainingTitle, text: trainingText, baslangic: trainingStart, bitis: trainingEnd, saat: trainingHour, toplamSure: trainingTotalTime)
        view.backgroundColor = UIColor.clear
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.frame
        self.view.insertSubview(blurEffectView, at: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func setTexts(title: String, text: String, baslangic: String, bitis: String, saat: String, toplamSure: String){
        trainingTitleLabel.text = title
        trainingTextLabel.text = text
        trainingEndDateLabel.text = bitis
        trainingStartDateLabel.text = baslangic.substring(to: 10)
        trainingStartHourLabel.text = saat
        //egitimToplamSureLabel.text = toplamSure
    }
    
    
    
}

