//
//  EtkinlikTakvimiViewController.swift
//  SiberSuclarTanitim
//
//  Created by 2016 on 21.11.2017.
//  Copyright © 2017 Kode. All rights reserved.
//

import UIKit
import FSCalendar
import SwiftyJSON

class EventsCalendarViewController: BaseViewController, FSCalendarDelegate, FSCalendarDataSource, UITableViewDataSource, UITableViewDelegate {
    
    private struct Const {
        static let cellReuseID = "etkinlikCell"
    }
    @IBOutlet weak var eventsTableView: UITableView!
    private weak var calendar: FSCalendar!
    
    var eventsForSelectedDate = [[String]]()
    var eventsArray: JSON?
    var eventsDateArray = [String]()
    
    fileprivate lazy var dateFormatter2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCalendar()
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        eventsTableView.isUserInteractionEnabled = false
        eventsTableView.isScrollEnabled = true
        
        eventsTableView.backgroundView = UIImageView(image: UIImage(named: "table_view_bg")!)
        getEventsFromServer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsForSelectedDate.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(eventsForSelectedDate[indexPath.row][1].count + 20)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventsTableView.dequeueReusableCell(withIdentifier:"etkinlikCell", for: indexPath) as! EventCell
        if eventsForSelectedDate.count != 0 {
            cell.eventName?.text = eventsForSelectedDate[indexPath.row][0]
            cell.eventLocation?.text = eventsForSelectedDate[indexPath.row][1]
            cell.eventLocation?.lineBreakMode = .byWordWrapping
            cell.eventLocation?.numberOfLines = 0;
        }
        //table background images setup
        tableView.backgroundView = UIImageView(image: UIImage(named: "table_view_bg")!)
        cell.backgroundView = UIImageView(image: UIImage(named: "yemek_button_bg")!)
        return cell
    }
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        eventsForSelectedDate.removeAll()
        let dateString = self.dateFormatter2.string(from: date)
        var tempEventArray = [String]()
        if eventsArray!["resultSet"].count != 0 {
            for i in 0...eventsArray!["resultSet"].count - 1 {
                if eventsArray!["resultSet"][i]["eventDate"].rawString()!.substring(to: 10) == dateString {
                    tempEventArray.append(eventsArray!["resultSet"][i]["title"].rawString()!)
                    tempEventArray.append(eventsArray!["resultSet"][i]["text"].rawString()!)
                    eventsForSelectedDate.append(tempEventArray)
                    tempEventArray.removeAll()
                }
            }
            //etkinlikTableView.reloadData()
            animateTable(tableView: eventsTableView)
        }
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let dateString = self.dateFormatter2.string(from: date)
        if self.eventsDateArray.contains(dateString){
            return 1
        }
        return 0
    }
    
    func initCalendar (){
        let height: CGFloat = UIDevice.current.model.hasPrefix("iPad") ? 400 : 300
        let calendar = FSCalendar(frame: CGRect(x: 0, y: self.navigationController!.navigationBar.frame.maxY, width: self.view.bounds.width, height: height))
        calendar.dataSource = self
        calendar.delegate = self
        calendar.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        self.view.addSubview(calendar)
        self.calendar = calendar
    }
    
    func getEventsFromServer(){
        showActivityIndicator(uiView: self.view)
        HTTPConnectionHandler.sharedHandler.getDataFromService(httpMethod: .get, url: liveServerIp + "Event/GetEvents", parameters: nil, completion: { (result) -> Void in
            if result == nil {
                self.showAlert(title: "Hata", text: "Lütfen bağlantınızı kontrol ediniz")
            }
            else {
                let res = JSON(result)
                if res != JSON.null {
                    self.eventsArray = res
                    //var tempValueArray = [String] ()
                    if res["resultSet"].count != 0 {
                        for i in 0...res["resultSet"].count - 1 {
                            self.eventsDateArray.append(res["resultSet"][i]["eventDate"].rawString()!.substring(to: 10))
                        }
                        //to make that array unique
                        self.eventsDateArray = Array(Set(self.eventsDateArray))
                        self.calendar.reloadData()
                    }
                }
                else{
                    print("false")
                }
            }
            self.hideActivityIndicator(uiView: self.view)
        })
    }
    
    
    
    
}
