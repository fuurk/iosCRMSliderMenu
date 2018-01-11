//
//  RehberCellDetailViewController.swift
//  SiberSuclarTanitim
//
//  Created by 2016 on 27.11.2017.
//  Copyright © 2017 Kode. All rights reserved.
//

import UIKit

class RehberCellDetailViewController: BaseViewController {
    
    var sicilData: String?
    var rutbeData: String?
    var adiData: String?
    var soyadilData: String?
    var subeData: String?
    var goreviData: String?
    var gsmData: String?
    var dahiliData: String?
    var epostaData: String?
    
    @IBOutlet weak var personelPhoto: UIImageView!
    
    @IBOutlet weak var sicil: UILabel!
    @IBOutlet weak var rutbe: UILabel!
    @IBOutlet weak var adi: UILabel!
    @IBOutlet weak var soyadi: UILabel!
    @IBOutlet weak var sube: UILabel!
    @IBOutlet weak var gorevi: UILabel!
    @IBOutlet weak var gsm: UILabel!
    @IBOutlet weak var dahili: UILabel!
    @IBOutlet weak var eposta: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initLabels (){
        adi.text = adiData
        soyadi.text = soyadilData
        gorevi.text = goreviData
        rutbe.text = rutbeData
        sube.text = subeData
        gsm.text = gsmData
        sicil.text = sicilData
        dahili.text = dahiliData
        eposta.text = epostaData
    }
    
}
