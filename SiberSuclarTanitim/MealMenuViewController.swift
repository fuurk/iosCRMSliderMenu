//
//  YemekMenusuViewController.swift
//  SiberSuclarTanitim
//
//  Created by 2016 on 21.11.2017.
//  Copyright © 2017 Kode. All rights reserved.
//

import UIKit
import SwiftyJSON

class MealMenuViewController: BaseViewController, UITextViewDelegate, UITableViewDelegate, UITableViewDataSource, UITabBarDelegate {
    
    
    var allMeals: JSON?
    var bufferMeal: JSON?
    @IBOutlet weak var mealTableView: UITableView?
    @IBOutlet weak var mealTabBar: UITabBar?
    var tabBarArray = [UITabBarItem] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateMenu()
        self.mealTabBar?.delegate = self
        self.mealTableView?.delegate = self
        self.mealTableView?.dataSource = self
        self.mealTableView?.allowsSelection = false
        self.mealTableView?.isScrollEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (bufferMeal != nil) ? (bufferMeal?.count)! : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "yemekCell", for: indexPath) as! MealCell
        populateMealCell(cell:cell, row: indexPath.row)
        //table bg images set
        tableView.backgroundView = UIImageView(image: UIImage(named: "table_view_bg")!)
        cell.backgroundView = UIImageView(image: UIImage(named: "yemek_button_bg")!)
        return cell
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        populateTableWithMeal(meal: item.title!)
    }
    
    func populateMealCell(cell: MealCell, row: Int){
        cell.mealName.text = bufferMeal![row]["productName"].rawString()
        cell.mealPrice.text = bufferMeal![row]["price"].rawString()
        cell.mealType.text = bufferMeal![row]["foodCategoryName"].rawString()
        
    }
    
    func populateTableWithMeal(meal: String){
        for i in 0...allMeals!.count {
            if allMeals![i]["mealName"].rawString() == meal {
                bufferMeal = allMeals![i]["foodProducts"]
                mealTableView?.reloadData()
                return
            }
        }
    }
    
    func populateMenu(){
        HTTPConnectionHandler.sharedHandler.getDataFromService(httpMethod: .get, url: liveServerIp + "FoodMenu/GetFoodMenuByToday", parameters: nil, completion: { (result) -> Void in
            if result == nil {
                self.showAlert(title: "Hata", text: "Lütfen bağlantınızı kontrol ediniz")
            }
            else {
                let res = JSON(result!)
                if res != JSON.null {
                    self.allMeals = res["resultSet"]["foodMealTimeProducts"]
                    if self.allMeals?.count != 0 {
                        self.populateTabs()
                        self.populateTableWithMeal(meal: self.allMeals![0]["mealName"].rawString()!)
                    }
                }
                else{
                    print("false")
                }
            }
            self.hideActivityIndicator(uiView: self.view)
        })
    }
    
    func populateTabs() {
        for i in allMeals! {
            let newTabBar = UITabBarItem.init(title: i.1["mealName"].rawString(), image: nil, selectedImage: nil)
            self.tabBarArray.append(newTabBar)
        }
        self.mealTabBar?.setItems(tabBarArray, animated: false)
        self.mealTabBar?.selectedItem = self.mealTabBar?.items![0]
    }
    
    
}
