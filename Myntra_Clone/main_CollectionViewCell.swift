//
//  main_CollectionViewCell.swift
//  Myntra_Clone
//
//  Created by apple on 25/07/25.
//

import UIKit

class main_CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containnerView: UIView!
    @IBOutlet weak var fasion_ImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Make top corners of the image view rounded ,layerMinXMinYCorner and layerMaxXMinYCorner for top x left and top y  rightside
        fasion_ImgView.clipsToBounds = true
        fasion_ImgView.layer.cornerRadius = 50
        fasion_ImgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

}
