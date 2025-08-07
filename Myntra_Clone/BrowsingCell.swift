//
//  BrowsingCell.swift
//  Myntra_Clone
//
//  Created by apple on 06/08/25.
//

import UIKit

class BrowsingCell: UICollectionViewCell {
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var heartImg: UIImageView!
    @IBOutlet weak var productLbl: UILabel!
    @IBOutlet weak var productDetailLbl: UILabel!
    override func awakeFromNib() {
        productImg.layer.cornerRadius = 15
        productImg.layer.borderWidth = 1
        productImg.layer.borderColor = UIColor.gray.cgColor
        productImg.clipsToBounds = true
    }
    
}
