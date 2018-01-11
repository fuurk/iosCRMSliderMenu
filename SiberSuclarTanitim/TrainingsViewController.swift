//
//  EgitimlerViewController.swift
//  SiberSuclarTanitim
//
//  Created by 2016 on 21.11.2017.
//  Copyright © 2017 Kode. All rights reserved.
//

import UIKit
import SwiftyJSON

class TrainingsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var trainings: JSON?
    
    @IBOutlet weak var trainingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trainingsTableView.delegate = self
        trainingsTableView.dataSource = self
        getEducationsFromService()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable(tableView: trainingsTableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (trainings != nil) ? (trainings?.count)! : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "egitimCell", for: indexPath) as! TrainingCell
        cell.titleLabel.text = trainings![indexPath.row]["title"].rawString()!
        cell.dateLabel.text = trainings![indexPath.row]["startDate"].rawString()!.substring(to: 10)
        cell.hourLabel.text = trainings![indexPath.row]["startTime"].rawString()!
        setCellAttributes(cell: cell, indexPath: indexPath)
        //table background images setup
        tableView.backgroundView = UIImageView(image: UIImage(named: "table_view_bg")!)
        cell.backgroundView = UIImageView(image: UIImage(named: "table_button_bg")!)
    
        return cell
    }
    
    func setCellAttributes(cell: TrainingCell?, indexPath: IndexPath) {
        
        cell?.title = trainings![indexPath.row]["title"].rawString()!
        cell?.detailText = trainings![indexPath.row]["text"].rawString()!
        cell?.startDate = trainings![indexPath.row]["startDate"].rawString()!.substring(to: 10)
        cell?.endDate = trainings![indexPath.row]["endDate"].rawString()!.substring(to: 10)
        cell?.totalTime = trainings![indexPath.row]["totalEducationTime"].rawString()!
        cell?.locationLink = trainings![indexPath.row]["locationLink"].rawString()!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = trainingsTableView.cellForRow(at: indexPath) as! TrainingCell!
        tableView.deselectRow(at: indexPath, animated: true)
        let trainingPopUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "egitimPopUp") as! TrainingPopUpViewController!
        trainingPopUpViewController?.trainingText = (cell?.detailText)!
        trainingPopUpViewController?.trainingTitle = (cell?.title)!
        trainingPopUpViewController?.trainingStart = (cell?.startDate)!
        trainingPopUpViewController?.trainingEnd = (cell?.endDate)!
        trainingPopUpViewController?.trainingHour = (cell?.totalTime)!
        trainingPopUpViewController?.trainingLocation = (cell?.locationLink)!
        self.addChildViewController(trainingPopUpViewController!)
        trainingPopUpViewController?.view.frame = self.view.frame
        self.view.addSubview((trainingPopUpViewController?.view)!)
        trainingPopUpViewController?.didMove(toParentViewController: self)
    }
    
    func getEducationsFromService() {
        showActivityIndicator(uiView: self.view)
        HTTPConnectionHandler.sharedHandler.getDataFromService(httpMethod: .get, url: liveServerIp + "Education/GetEducations", parameters: nil, completion: { (result) -> Void in
            if result == nil {
                self.showAlert(title: "Hata", text: "Lütfen bağlantınızı kontrol ediniz")
            }
            else {
                print(result)
                let res = JSON(result)
                if res != JSON.null {
                    self.trainings = res["resultSet"]
                    self.trainingsTableView.reloadData()
                    self.animateTable(tableView: self.trainingsTableView)
                }
                else{
                    print("false")
                }
            }
            self.hideActivityIndicator(uiView: self.view)
        })
    }
   
}
