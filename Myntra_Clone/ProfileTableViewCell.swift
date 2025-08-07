//
//  ProfileTableViewCell.swift
//  Myntra_Clone
//
//  Created by apple on 26/07/25.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var arrowImg: UIImageView!
    @IBOutlet weak var detailsLbl: UILabel!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var headlingLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}
