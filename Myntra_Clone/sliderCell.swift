//
//  sliderCell.swift
//  Myntra_Clone
//
//  Created by apple on 04/08/25.
//

import UIKit

class sliderCell: UICollectionViewCell {
    @IBOutlet weak var sliderImg:UIImageView!
    @IBOutlet weak var sliderContentNameLbl:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        sliderImg.layer.cornerRadius = 15
        sliderImg.clipsToBounds = true
        
    }
}
