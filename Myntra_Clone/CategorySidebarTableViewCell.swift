//
//  CategorySidebarTableViewCell.swift
//  Myntra_Clone
//
//  Created by apple on 22/08/25.
//

import UIKit

class CategorySidebarTableViewCell: UITableViewCell {
    @IBOutlet weak var sideImg : UIImageView!
    @IBOutlet weak var sideLbl : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sideImg.layer.cornerRadius = 15
        sideImg.clipsToBounds = true
    }

  

}
