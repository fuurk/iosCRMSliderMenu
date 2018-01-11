//
//  FaaliyetlerViewController.swift
//  SiberSuclarTanitim
//
//  Created by 2016 on 20.11.2017.
//  Copyright © 2017 Kode. All rights reserved.
//

import UIKit
import SwiftyJSON

class ActivitiesViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    private struct Const {
        static let cellReuseID = "faaliyetCell"
    }
    var activities: JSON?
    
    @IBOutlet weak var activitiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activitiesTableView.delegate = self
        activitiesTableView.dataSource = self
        // Do any additional setup after loading the view.
        getActivitiesFromService()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animateTable(tableView: activitiesTableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: ActivitiesTableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (activities != nil) ? (activities?.count)! : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "faaliyetCell", for: indexPath) as! ActivityCell
        populateActivityCells(cell:cell, row: indexPath.row)
        
        // table bg images set
        tableView.backgroundView = UIImageView(image: UIImage(named: "table_view_bg")!)
        cell.backgroundView = UIImageView(image: UIImage(named: "table_button_bg")!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        goToDetailPage(indexPath: indexPath)
    }
    
    //MARK: Populating View
    
    // After getting activities from service, this func revokes tableView's reloadData() function to populate view.
    func getActivitiesFromService() {
        showActivityIndicator(uiView: self.view)
        HTTPConnectionHandler.sharedHandler.getDataFromService(httpMethod: .get, url: liveServerIp + "Activity/GetActivities", parameters: nil, completion: { (result) -> Void in
            if result == nil {
                self.showAlert(title: "Hata", text: "Lütfen bağlantınızı kontrol ediniz")
            }
            else{
                let res = JSON(result)
                if res != JSON.null {
                    self.activities = res["resultSet"]
                    //self.faaliyetTableView.reloadData()
                    self.animateTable(tableView: self.activitiesTableView)
                }
                else{
                    print("false")
                }
                self.hideActivityIndicator(uiView: self.view)
            }
        })
    }
    
    func populateActivityCells(cell: ActivityCell, row: Int){
        cell.titleLabel.text = self.activities![row]["name"].rawString()
        cell.dateLabel.text = self.activities![row]["activityDate"].rawString()
        cell.locationLabel.text = self.activities![row]["shortText"].rawString()
        cell.description1 = self.activities![row]["text"].rawString()
    }
    
    func goToDetailPage(indexPath: IndexPath) {
        let activityPopUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "duyuruPopUp") as! AnnouncementPopUpViewController!
        let cell = activitiesTableView.cellForRow(at: indexPath) as! ActivityCell!
        activityPopUpViewController?.announcementTitle = (cell?.titleLabel.text)!
        activityPopUpViewController?.announcementText = (cell?.description1)!
        self.addChildViewController(activityPopUpViewController!)
        activityPopUpViewController?.view.frame = self.view.frame
        self.view.addSubview((activityPopUpViewController?.view)!)
        activityPopUpViewController?.didMove(toParentViewController: self)
    }
    
}


