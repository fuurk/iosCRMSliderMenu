//
//  RehberCell.swift
//  SiberSuclarTanitim
//
//  Created by 2016 on 22.11.2017.
//  Copyright © 2017 Kode. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    @IBOutlet weak var myView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var dutyLabel: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var surname: UILabel!
    @IBOutlet weak var duty: UILabel!
    
    var internalNo: String?
    var email: String?
    var gsm: String?
    var employeeNo: Int?
    var rank: String?
    var branchOffice: String?
}
