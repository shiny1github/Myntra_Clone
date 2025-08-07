//
//  carouselCell.swift
//  Myntra_Clone
//
//  Created by apple on 04/08/25.
//

import UIKit

class carouselCell: UICollectionViewCell {
    @IBOutlet weak var carouselImg: UIImageView!
    @IBOutlet weak var bannerImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        carouselImg.layer.cornerRadius = 20
        carouselImg.clipsToBounds = true
        carouselImg.layer.borderWidth = 1
        carouselImg.layer.borderColor = UIColor.gray.cgColor
        
        
    }
}



extension UIImageView {
    func loadImage(from urlString: String, placeholder: UIImage? = nil) {
        self.image = placeholder
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL string: \(urlString)")
            return
        }

        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let downloadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = downloadedImage
                }
            } else {
                print("Failed to load image from URL: \(urlString)")
            }
        }
    }
}
