//
//  hearderReusableView.swift
//  Myntra_Clone
//
//  Created by apple on 25/07/25.
//

import UIKit

class hearderReusableView: UICollectionReusableView {
        
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var locationIcon: UIImageView!
    @IBOutlet weak var deliveryLbl: UILabel!
    
    @IBOutlet weak var searchTF: UITextField!
   
    @IBOutlet weak var profileBtn: UIButton!
    @IBAction func ProfileBtnTap(_ sender: UIButton) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
//        navigationController?.pushViewController(vc, animated: true)
        
    }
}
