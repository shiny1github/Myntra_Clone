//
//  profileSecTableViewCell.swift
//  Myntra_Clone
//
//  Created by apple on 26/07/25.
//

import UIKit

class profileSecTableViewCell: UITableViewCell {
    @IBOutlet weak var headlingSecLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.separatorInset = UIEdgeInsets(top: 0, left: 1000, bottom: 0, right: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
