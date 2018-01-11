//
//  BaseViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Furkan.
//  Copyright (c) 2015 Siber Suclarla Mucadele Daire Baskanligi. All rights reserved.
//

import UIKit
import Foundation

class BaseViewController: UIViewController, SlideMenuDelegate {
    
    
    final var liveServerIp1 = "http://192.168.4.38:5000/"
    final var liveServerIp = "http://192.168.1.139/api/Mobile/api/v1/"
    final var liveImageServerIp = "http://192.168.1.139/api/Mobile/"
    
    //Activity indicator for loading screen
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     Show customized activity indicator,
     actually add activity indicator to passing view
     
     @param uiView - add activity indicator to this view
     */
    func showActivityIndicator(uiView: UIView) {
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColorFromHex(rgbValue: 0xffffff, alpha: 0.3)
        
        loadingView.frame = CGRect(x:0, y:0, width:80, height:80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColorFromHex(rgbValue: 0x444444, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x:0.0, y:0.0, width:40.0, height:40.0)
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.center = CGPoint(x:loadingView.frame.size.width / 2, y:loadingView.frame.size.height / 2);
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    //Generic alert function to give user a feedback about what he did.
    func showAlert (title: String, text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //Alert for logout button just to make sure that user really wants to logout.
    func showAlertWithOptionLogout(title: String, text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Evet", style: .default, handler: { (action: UIAlertAction!) in
            UserDefaults.standard.set("", forKey: "userName")
            UserDefaults.standard.set("", forKey: "password")
            UserDefaults.standard.set(false, forKey: "isUserActive")
            self.openViewControllerBasedOnIdentifier("girisEkrani")
        }))
        alert.addAction(UIAlertAction(title: "Vazgeç", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Cancel button")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
     Hide activity indicator
     Actually remove activity indicator from its super view
     
     @param uiView - remove activity indicator from this view
     */
    func hideActivityIndicator(uiView: UIView) {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
    /*
     Define UIColor from hex value
     
     @param rgbValue - hex color value
     @param alpha - transparency level
     */
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    // Control function for user if he logged in before. Works when app realoads.
    func loginControl() {
        if UserDefaults.standard.value(forKey: "isUserActive") as? Bool == false {
            self.openViewControllerBasedOnIdentifier("girisEkrani")
        }
    }
    
    //Function for redirecting user based on his choice on menu
    func slideMenuItemSelectedAtIndex(_ index: Int32) {
        let topViewController : UIViewController = self.navigationController!.topViewController!
        print("View Controller is : \(topViewController) \n", terminator: "")
        switch(index){
        case 0:
            print("BaskanlikTanitim\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("BaskanlikTanitim")
            
            break
        case 1:
            print("DuyurularHaberler\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("DuyurularHaberler")
            
            break
            
        case 2:
            print("Faaliyetler\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("Faaliyetler")
            
            break
        case 3:
            print("Egitimler\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("Egitimler")
            
            break
        case 4:
            print("EtkinlikTakvimi\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("EtkinlikTakvimi")
            
            break
            //THIS FEATURE WILL BE ADDED LATER
            /* case 5:
             print("Rehber\n", terminator: "")
             
             self.openViewControllerBasedOnIdentifier("Rehber")
             
             break */
        case 5:
            print("YemekMenusu\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("YemekMenusu")
            
            break
        case 6:
            print("ServisRehberi\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("ServisRehberi")
            
            break
        case 7:
            print("HavaDurumu\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("HavaDurumu")
            
            break
        case 8:
            print("Öneri-İstek\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("istekOneri")
            
            break
        default:
            print("default\n", terminator: "")
        }
    }
    
    //Opens desired view controller based on its identifier, if that VC is already on top, it returns nothing.
    func openViewControllerBasedOnIdentifier(_ strIdentifier:String){
        let destViewController : UIViewController = self.storyboard!.instantiateViewController(withIdentifier: strIdentifier)
        
        let topViewController : UIViewController = self.navigationController!.topViewController!
        
        if (topViewController.restorationIdentifier! == destViewController.restorationIdentifier!){
            print("Same VC")
        } else {
            if strIdentifier == "girisEkrani" {
                self.navigationController!.pushViewController(destViewController, animated: false)
            }
            else {
                self.navigationController!.pushViewController(destViewController, animated: true)
            }
        }
    }
    
    //Generic function to add slide menu button on top left corner.
    func addSlideMenuButton(){
        let btnShowMenu = UIButton(type: UIButtonType.system)
        btnShowMenu.setImage(self.defaultMenuImage(), for: UIControlState())
        btnShowMenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnShowMenu.addTarget(self, action: #selector(BaseViewController.onSlideMenuButtonPressed(_:)), for: UIControlEvents.touchUpInside)
        let customBarItem = UIBarButtonItem(customView: btnShowMenu)
        self.navigationItem.leftBarButtonItem = customBarItem;
        
        let btnLogout = UIButton(type: UIButtonType.system)
        btnLogout.setImage(#imageLiteral(resourceName: "ic_account_circle_black_24dp"), for: UIControlState())
        btnLogout.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        btnLogout.addTarget(self, action: #selector(BaseViewController.onLogoutButtonPressed(_:)), for: UIControlEvents.touchUpInside)
        let customLogoutItem = UIBarButtonItem(customView: btnLogout)
        self.navigationItem.rightBarButtonItem = customLogoutItem;
    }
    
    //Generic function to animate tableview in different VCs.
    func animateTable(tableView: UITableView) {
        
        tableView.reloadData()
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        var index = 0
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.75, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil) 
            index += 1
        }
    }

    
    func defaultMenuImage() -> UIImage {
        var defaultMenuImage = UIImage()
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 22), false, 0.0)

        UIColor.black.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 3, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 10, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 17, width: 30, height: 1)).fill()
        
        UIColor.white.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 4, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 11,  width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 18, width: 30, height: 1)).fill()
        
        defaultMenuImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        return defaultMenuImage;
    }
    
    //Controls if menu is already opened, closes if menu is open and opens if it is not
    @objc func onSlideMenuButtonPressed(_ sender : UIButton){
        if (sender.tag == 10)
        {
            // To Hide Menu If it already there
            self.slideMenuItemSelectedAtIndex(-1);
            sender.tag = 0;
            let viewMenuBack : UIView = view.subviews.last!
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                viewMenuBack.removeFromSuperview()
            })
            return
        }
        
        sender.isEnabled = false
        sender.tag = 10
        
        let menuVC : MenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuVC.btnMenu = sender
        menuVC.delegate = self
        self.view.addSubview(menuVC.view)
        self.addChildViewController(menuVC)
        menuVC.view.layoutIfNeeded()
        
        menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            sender.isEnabled = true
        }, completion:nil)
    }
    
    @objc func onLogoutButtonPressed(_ sender: UIButton){
        
        showAlertWithOptionLogout(title: "Çıkış", text: "Çıkış yapmak istediğinizden emin misiniz?")
    }
    
    public func setLoading(_ isLoading: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
    }
    
}

// Extension is written for supporting substring method
extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}

