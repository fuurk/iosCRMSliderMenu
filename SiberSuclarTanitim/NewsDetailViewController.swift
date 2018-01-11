 //
//  HaberDetailViewController.swift
//  SiberSuclarTanitim
//
//  Created by 2016 on 28.11.2017.
//  Copyright © 2017 Kode. All rights reserved.
//

import UIKit
import SwiftyJSON

class NewsDetailViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var newsDetailCollectionView: UICollectionView!
    @IBOutlet weak var newsDetailDescription: UITextView!
    @IBOutlet weak var newsTitle: UILabel!
    var imageArray:[UIImage] = []
    var imagePathArray:[String] = []
    var id: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsDetailCollectionView.isPagingEnabled = true
        autoLayoutForCollectionView()
        populateView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (imageArray != nil) ? (imageArray.count) : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = newsDetailCollectionView.dequeueReusableCell(withReuseIdentifier: "haberCell", for: indexPath) as! NewsCell
        //cell.haberLabel.isHidden = true
        if imageArray.count >= indexPath.row {
            cell.setImageReal(image: imageArray[indexPath.row])
        }
        var rowIndex = indexPath.row
        let numberOfRecords:Int = self.imageArray.count - 1
        if (rowIndex < numberOfRecords){
            rowIndex = (rowIndex + 1)
        }
        else{
            rowIndex = 0
        }
        return cell
    }
    
    func autoLayoutForCollectionView() {
        if let layout = newsDetailCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let itemWidth = view.bounds.width
            let itemHeight = layout.itemSize.height
            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
            layout.invalidateLayout()
        } else {
            print("Error while trying to get collection view's layout.")
        }
    }
        
    func populateView(){
        print(liveServerIp + "/api/v1/News/GetNewsById/" + "\(id!)")
        HTTPConnectionHandler.sharedHandler.getDataFromService(httpMethod: .get, url: liveServerIp + "News/GetNewsById/" + "\(id!)", parameters: nil, completion: { (result) -> Void in
            if result == nil {
                self.showAlert(title: "Hata", text: "Lütfen bağlantınızı kontrol ediniz")
            }
            else {
                let res = JSON(result)
                if res != JSON.null {
                    self.newsTitle.text = res["resultSet"]["shortText"].rawString()
                    self.newsDetailDescription.text = res["resultSet"]["text"].rawString()
                    self.getImages(result: res)
                }
                else{
                    print("false")
                }
            }
        })
    }
    
    func getImages(result:JSON){
        for i in 0...result["resultSet"]["newsImages"].count - 1{
            HTTPConnectionHandler.sharedHandler.getImageFromService(imageUrl: liveImageServerIp + result["resultSet"]["newsImages"][i]["imagePath"].rawString()!, completion: {
                (result) -> Void in
                self.imageArray.append(result!)
               // let indexPath = IndexPath(item: i, section: 0)
               // self.haberDetayCollectionView.reloadItems(at:[indexPath])
                self.newsDetailCollectionView.reloadData()
            })
        }
    }
   
   

    
    
}
