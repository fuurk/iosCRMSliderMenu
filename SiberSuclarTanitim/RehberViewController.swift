//
//  RehberViewController.swift
//  SiberSuclarTanitim
//
//  Created by 2016 on 21.11.2017.
//  Copyright © 2017 Kode. All rights reserved.
//

import UIKit
import SwiftyJSON

class RehberViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    private struct Const {
        static let cellReuseID = "RehberCell"
    }
    @IBOutlet weak var searcBarRehber: UISearchBar!
    @IBOutlet weak var RehberTableView: UITableView!
    var contactsArray: JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getContactsFromServer()
        
        setupRehberTableView()
        
        RehberTableView.delegate = self
        RehberTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentCell = tableView.cellForRow(at: indexPath) as! ContactCell!
        tableView.deselectRow(at: indexPath, animated: true)
        let rehberCellDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "rehberCellDetail") as! RehberCellDetailViewController!
        passDataToDetailView(rehberCellDetailViewController: rehberCellDetailViewController!, cell: currentCell!)
        navigationController?.pushViewController(rehberCellDetailViewController!, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (contactsArray != nil) ? (contactsArray?.count)! : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Const.cellReuseID, for: indexPath) as! ContactCell
        populateContact(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func getContactsFromServer(){
        showActivityIndicator(uiView: self.view)
        HTTPConnectionHandler.sharedHandler.getDataFromServiceAsArray(url: "https://api.myjson.com/bins/grdyv", parameters: nil,
                                                 completion: { (result) -> Void in
                                                    print(result)
                                                    self.contactsArray = JSON(result)
                                                    //let x = self.contactsArray?.arrayValue.map({$0["name"].stringValue})
                                                    self.RehberTableView.reloadData()
                                                    self.hideActivityIndicator(uiView: self.view)
                                                    super.setLoading(false)
        })
        
    }
    
    func populateContact(cell: ContactCell, indexPath: IndexPath){
        
        cell.name.text? = contactsArray![indexPath.row]["adi"].rawString()!
        cell.surname.text? = contactsArray![indexPath.row]["soyadi"].rawString()!
        cell.duty.text? = contactsArray![indexPath.row]["gorevi"].rawString()!
        cell.internalNo = contactsArray![indexPath.row]["dahili"].rawString()!
        cell.email = contactsArray![indexPath.row]["eposta"].rawString()!
        cell.gsm = contactsArray![indexPath.row]["gsm"].rawString()!
        //cell.sicil = contactsArray![indexPath.row]["soyadi"].rawData()
        cell.branchOffice = contactsArray![indexPath.row]["sube"].rawString()!
        cell.rank = contactsArray![indexPath.row]["rutbe"].rawString()!
    }
    
    
    func passDataToDetailView(rehberCellDetailViewController: RehberCellDetailViewController, cell: ContactCell){
        rehberCellDetailViewController.adiData = cell.name.text
        rehberCellDetailViewController.soyadilData = cell.surname.text
        rehberCellDetailViewController.goreviData = cell.duty.text
        rehberCellDetailViewController.dahiliData = cell.internalNo
        rehberCellDetailViewController.gsmData = cell.gsm
        rehberCellDetailViewController.subeData = cell.branchOffice
        rehberCellDetailViewController.rutbeData = cell.rank
        //rehberCellDetailViewController.sicilData = cell.sicil
        rehberCellDetailViewController.epostaData = cell.email
    }
    
    func setupRehberTableView () {
        RehberTableView.translatesAutoresizingMaskIntoConstraints = false

        RehberTableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        RehberTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        RehberTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        RehberTableView.topAnchor.constraint(equalTo: searcBarRehber.bottomAnchor).isActive = true
    }

}
