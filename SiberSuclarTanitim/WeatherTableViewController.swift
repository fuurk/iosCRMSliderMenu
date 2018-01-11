//
//  WeatherTableViewController.swift
//  Hava_Durumu_son
//
//  Created by alimurat_mac on 4.12.2017.
//  Copyright © 2017 alimurat_mac. All rights reserved.
//

import UIKit
import CoreLocation
import Foundation

class WeatherTableViewController: UITableViewController, ModernSearchBarDelegate {
    
    @IBOutlet weak var modernSearchBar: ModernSearchBar!
    
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    var forecastData = [Weather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modernSearchBar.delegateModernSearchBar = self
        updateWeatherForlocation(location: "Ankara")  //uygulama açıldığı anda görüntülünecek yerin bilgilerini ayarladık
        let suggestionList = merkezler
        self.modernSearchBar.setDatas(datas: suggestionList)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        if let locationString = searchBar.text, !locationString.isEmpty {
            // sadece searchBar içinde bir değer olduğunda çalışacak ve yeni yerin hava durumunu update edecek
            
            updateWeatherForlocation(location: locationString)
            self.navigationItem.title = "\(locationString) Hava Durumu"
        }
    }
    //////////////////////////////////////
    ///Called if you use String suggestion list
    func onClickItemSuggestionsView(item: String) {
        print("User touched this item: "+item)
        
        
        updateWeatherForlocation(location: item)
        self.navigationItem.title = "\(item) Hava Durumu"
        self.modernSearchBar.text = item
        
        modernSearchBar.resignFirstResponder() //item seçildiği an tekrar autocomplete penceresini sakladık
    }
    
    ///Called if you use Custom Item suggestion list
    func onClickItemWithUrlSuggestionsView(item: ModernSearchBarModel) {
        print("User touched this item: "+item.title+" with this url: "+item.url.description)
    }
    
    ///Called when user touched shadowView
    func onClickShadowView(shadowView: UIView) {
        print("User touched shadowView")
    }
    ////////////////////////////////////
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Text did change, what i'm suppose to do ?")
    }
    
    func updateWeatherForlocation (location: String) {
        self.showActivityIndicator(uiView: self.view)
        self.modernSearchBar.isUserInteractionEnabled = false
        CLGeocoder().geocodeAddressString(location) {(placemarks:[CLPlacemark]?, error: Error?) in
            if error == nil {
                if let location = placemarks?.first?.location {
                    Weather.forecast(withLocation: location.coordinate, completion: { (results: [Weather]?) in
                        if let weatherData = results {
                            self.forecastData = weatherData
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                self.animateTable()
                            }
                        }
                        self.hideActivityIndicator(uiView: self.view)
                        self.modernSearchBar.isUserInteractionEnabled = true
                    })
                }
            }
            else {
                self.hideActivityIndicator(uiView: self.view)
                self.modernSearchBar.isUserInteractionEnabled = true
                self.animateTable()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return forecastData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        
        return " "
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let date = Calendar.current.date(byAdding: .day, value: indexPath.section, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "tr_TU")
        dateFormatter.dateFormat = "dd MMMM yyyy"
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let weatherObject = forecastData[indexPath.section]
        
        cell.imageView?.image = UIImage(named: weatherObject.icon)
        cell.textLabel?.text = "\(dateFormatter.string(from: date!))"
        cell.detailTextLabel?.text = "\(Int(weatherObject.temperature))˚C  \(weatherObject.summary)"
        
        return cell
    }
    
    // This class should be derived from BaseViewController. Activity indicator is re implemented here since any of BaseViewController's features can not be reached.
    
    //TODO: RE-IMPLEMENT this class. It should be derived from BaseViewController.
    
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
    
    func hideActivityIndicator(uiView: UIView) {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    func animateTable() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        
        let tableViewHeight = tableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
    
}

