//
//  HomeMainTableViewCell.swift
//  Myntra_Clone
//
//  Created by apple on 05/08/25.
//

import UIKit

class HomeMainTableViewCell: UITableViewCell {
    @IBOutlet weak var mainColllectionView: UICollectionView!
    @IBOutlet weak var carouselColllectionView: UICollectionView!
    @IBOutlet weak var sliderColllectionView: UICollectionView!
    @IBOutlet weak var browsingColllectionView: UICollectionView!
    var allCategoriesData = [AllCategories]()
    var carouselData: [String] = []
    var sliderData: [SliderItem] = []
    var browseData: [BrowsingItem] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        mainColllectionView.delegate = self
        mainColllectionView.dataSource = self
        carouselColllectionView.dataSource = self
        carouselColllectionView.delegate = self
        sliderColllectionView.delegate = self
        sliderColllectionView.dataSource = self
        browsingColllectionView.dataSource = self
        browsingColllectionView.delegate = self


        

        getAllCategoryApi()
        getCarouselApi()
        

    }
}
extension HomeMainTableViewCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            if kind == UICollectionView.elementKindSectionHeader{
                let headerview = mainColllectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerCell", for: indexPath) as? hearderReusableView
                print("collectionView headerCell Done")
                return headerview!
            }
        
        return UICollectionReusableView()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainColllectionView {
            return  allCategoriesData.count - 1  // -1 for headerCell
        } else if collectionView == carouselColllectionView {
            return carouselData.count
        } else if collectionView == sliderColllectionView {
            return sliderData.count
        } else if collectionView == browsingColllectionView {
            return browseData.count
        }
         return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainColllectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! main_CollectionViewCell
            let category = allCategoriesData[indexPath.item]
            cell.titleLbl.text = category.Title
            cell.fasion_ImgView.loadImage(from: category.image)
            print("collectionView carouselCell Done")
            return cell
            
        } else if collectionView == carouselColllectionView {
            let carouselCell = carouselColllectionView.dequeueReusableCell(withReuseIdentifier: "carouselCell", for: indexPath) as! carouselCell
            let urlString = carouselData[indexPath.item]
            carouselCell.carouselImg?.loadImage(from: urlString)
            return carouselCell
            
        } else if collectionView == sliderColllectionView {
                let sliderCell = sliderColllectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath) as! sliderCell
//            let sliderIndex = indexPath.item - carouselData.count    //Index out of range
//            let slider = sliderData[sliderIndex]
//            if indexPath.item < sliderData.count {
                    let slider = sliderData[indexPath.item]
                    sliderCell.sliderImg?.loadImage(from: slider.imageURL)
            sliderCell.sliderContentNameLbl?.text = slider.productName
                print("collectionView sliderCell Done")
                return sliderCell
        } else if collectionView == browsingColllectionView {
            let browsingCell = browsingColllectionView.dequeueReusableCell(withReuseIdentifier: "BrowsingCell", for: indexPath) as! BrowsingCell
            let browse = browseData[indexPath.item]
            browsingCell.productImg?.loadImage(from: browse.browsProductImage)
            browsingCell.productLbl?.text = browse.browsProduct
            browsingCell.productDetailLbl.text  = browse.browsProductDetail
            
            return browsingCell
        }
            
        return UICollectionViewCell()
        }
       
    }


//
extension HomeMainTableViewCell:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == mainColllectionView {
            let size = (mainColllectionView.frame.size.width-10)/4
            return CGSize(width: size, height: 145)
            
        }
        else if collectionView == carouselColllectionView {
            return CGSize(width: 400, height: 280)
            }
        else if collectionView == sliderColllectionView {
            let size = (sliderColllectionView.frame.size.width)/4
                return CGSize(width: size, height: 120)
        }
        else if collectionView == browsingColllectionView {
//            let size = (browsingColllectionView.frame.size.width)/2
            return CGSize(width: 180, height: 280)
        }
        return CGSize(width: 150, height: 150)
        }
        
        
    

}
