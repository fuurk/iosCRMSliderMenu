//
//  DuyurularHaberler.swift
//  AKSwiftSlideMenu
//
//  Created by MAC-186 on 4/8/16.
//  Copyright © 2016 Kode. All rights reserved.
//

import UIKit
import SwiftyJSON

class NewsAnnouncements: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    private struct Const {
        static let haberCellReuseID = "haberCell"
        static let duyuruCellReuseID = "duyuruCell"
    }
    
    struct ImageWithId {
        var image: UIImage
        var id: Int
        init(id: Int, image: UIImage) {
            self.id = id
            self.image = image
        }
    }
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var announcements: UIImageView!
    @IBOutlet weak var newsCollectionView: UICollectionView!
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var announcementsTableView: UITableView!
    @IBOutlet weak var announcementsLabel: UILabel!
    
    var newsArray: JSON!
    var imageArray: [ImageWithId] = []
    var announcementsArray: JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        announcementsTableView.delegate = self
        announcementsTableView.dataSource = self
        newsCollectionView.isPagingEnabled = true
        autoLayoutForCollectionView()
        populateNews()
        populateAnnouncements()
        setupNewsCollection()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable(tableView: announcementsTableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: NewsCollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (newsArray != nil) ? (newsArray?.count)! : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentCell = newsCollectionView.cellForItem(at: indexPath) as! NewsCell!
        let haberCellDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "haberDetail") as! NewsDetailViewController!
        haberCellDetailViewController?.id = currentCell?.id
        
        navigationController?.pushViewController(haberCellDetailViewController!, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = newsCollectionView.dequeueReusableCell(withReuseIdentifier: Const.haberCellReuseID, for: indexPath) as! NewsCell
        cell.newsLabel.text = self.newsArray[indexPath.row]["shortText"].rawString()
        cell.id = self.newsArray[indexPath.row]["id"].int
        if self.imageArray.count != 0 {
            for i in 0...self.imageArray.count - 1 {
                if self.imageArray[i].id == indexPath.row {
                    cell.setImageReal(image: imageArray[i].image)
                }
            }
        }
        var rowIndex = indexPath.row
        let numberOfRecords:Int = self.newsArray.count - 1
        if (rowIndex < numberOfRecords){
            rowIndex = (rowIndex + 1)
        }
        else{
            rowIndex = 0
        }
        return cell
    }
    
    func autoLayoutForCollectionView() {
        if let layout = newsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let itemWidth = view.bounds.width
            let itemHeight = layout.itemSize.height
            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
            layout.invalidateLayout()
        } else {
            print("Error while trying to get collection view's layout.")
        }
    }
    
    //MARK: AnnouncementTableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = announcementsTableView.dequeueReusableCell(withIdentifier: Const.duyuruCellReuseID, for: indexPath) as! AnnouncementCell
        if self.announcementsArray.count > indexPath.row{
            cell.announcementLabel.text = self.announcementsArray["resultSet"][indexPath.row]["title"].rawString()
            cell.date = self.announcementsArray["resultSet"][indexPath.row]["createDate"].rawString()
            cell.detailText = self.announcementsArray["resultSet"][indexPath.row]["text"].rawString()
        }
        // table background image set
        tableView.backgroundView = UIImageView(image: UIImage(named: "table_view_bg")!)
        cell.backgroundView = UIImageView(image: UIImage(named: "table_button_bg")!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (announcementsArray != nil) ? (announcementsArray?["resultSet"].count)! : 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = announcementsTableView.cellForRow(at: indexPath) as! AnnouncementCell!
        tableView.deselectRow(at: indexPath, animated: true)
        let announcementPopUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "duyuruPopUp") as! AnnouncementPopUpViewController!
        announcementPopUpViewController?.announcementText = (cell?.detailText)!
        announcementPopUpViewController?.announcementTitle = (cell?.announcementLabel.text)!
        self.addChildViewController(announcementPopUpViewController!)
        announcementPopUpViewController?.view.frame = self.view.frame
        self.view.addSubview((announcementPopUpViewController?.view)!)
        announcementPopUpViewController?.didMove(toParentViewController: self)
    }

    func populateNews() {
        HTTPConnectionHandler.sharedHandler.getDataFromService(httpMethod: .get, url: liveServerIp + "News/GetNews", parameters: nil, completion: { (result) -> Void in
            if result == nil {
                self.showAlert(title: "Hata", text: "Lütfen bağlantınızı kontrol ediniz")
            }
            else {
                let res = JSON(result)
                if res != JSON.null {
                    self.newsArray = res["resultSet"]
                    self.getAndUpdateNewsImage()
                    self.newsCollectionView.reloadData()
                    //self.animateTable(tableView: self.duyuruTableView)
                }
                else{
                    print("false")
                }
            }
        })
    }

    func getAndUpdateNewsImage(){
        for i in 0...self.newsArray.count - 1{
            print(i)
            HTTPConnectionHandler.sharedHandler.getImageFromService(imageUrl: liveImageServerIp + self.newsArray[i]["imagePath"].rawString()!, completion: { (result) -> Void in
                let imageStruct = ImageWithId(id: i, image: result!)
                self.imageArray.append(imageStruct)
                let indexPath = IndexPath(item: i, section: 0)
                self.newsCollectionView.reloadItems(at:[indexPath])
            })
        }
    }
    
    func populateAnnouncements(){
        HTTPConnectionHandler.sharedHandler.getDataFromService(httpMethod: .get, url: liveServerIp + "Announcement/GetAnnouncementes", parameters: nil, completion: { (result) -> Void in
            if result == nil {
                self.showAlert(title: "Hata", text: "Lütfen bağlantınızı kontrol ediniz")
            }
            else {
                let res = JSON(result)
                if res != JSON.null {
                    self.announcementsArray = res
                    self.announcementsTableView.reloadData()
                }
                else{
                    print("false")
                }
            }
        })
    }

    //MARK: Autolayout
    func setupNewsCollection() {
        
        newsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        announcements.translatesAutoresizingMaskIntoConstraints = false
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        
        newsImage.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        newsImage.heightAnchor.constraint(equalToConstant: 88).isActive = true
        newsImage.bottomAnchor.constraint(equalTo: newsCollectionView.topAnchor).isActive = true
        
        announcements.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        announcements.heightAnchor.constraint(equalToConstant: 72).isActive = true
        announcements.topAnchor.constraint(equalTo: newsCollectionView.bottomAnchor).isActive = true
        
        newsCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        newsCollectionView.heightAnchor.constraint(equalToConstant: 168).isActive = true
        
        newsCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newsCollectionView.bottomAnchor.constraint(equalTo: announcements.topAnchor).isActive = true
      
        announcementsTableView.rowHeight = 80
       
        
    }
}
