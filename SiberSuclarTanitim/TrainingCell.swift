//
//  EgitimCell.swift
//  SiberSuclarTanitim
//
//  Created by 2016 on 22.12.2017.
//  Copyright © 2017 Kode. All rights reserved.
//

import UIKit

class TrainingCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    
    var title: String?
    var detailText: String?
    var startDate: String?
    var endDate: String?
    var totalTime: String?
    var locationLink: String?
}
