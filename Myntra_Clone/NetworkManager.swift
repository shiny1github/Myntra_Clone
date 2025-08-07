//
//  NetworkManager.swift
//  Myntra_Clone
//
//  Created by apple on 04/08/25.
//

import Foundation

struct HomeScreenDataModel:Decodable{
    let carousel : [String]
    let slider : [SliderItem]
    let browser : [BrowsingItem]                               ////==============================
}
struct AllCategories:Decodable {
    let Title: String
    let image : String
}
struct SliderItem:Decodable{
    let productName: String
    let imageURL: String
}
//==============================
struct BrowsingItem: Decodable{
    let browsProductImage : String
    let browsProduct : String
    let browsProductDetail : String
}
//==============================
extension HomeMainTableViewCell{
    func getAllCategoryApi(){
        let serviceUrl = URL(string: "https://688321c321fa24876a9cc7de.mockapi.io/All_Categories")
        let session = URLSession.shared
        let task = session.dataTask(with: serviceUrl!) { (serviceData, serviceResponse, serviceError) in
            if serviceError == nil{
                let httpResponse = serviceResponse as! HTTPURLResponse
                if (httpResponse.statusCode==200)
                {
                    do{
                        let decodedData  = try JSONDecoder().decode([AllCategories].self, from: serviceData!)
                        self.allCategoriesData = decodedData
                        DispatchQueue.main.async { [self] in
                                          mainColllectionView.reloadData()
                                          print("Categories loaded: \(self.allCategoriesData.count)")
                                      }
                    }catch{
                        print("parse error")
                    }
                    
                }
            }
        }
            task.resume()
        
    }
    
    func getCarouselApi(){
        let serviceUrl = URL(string: "https://raw.githubusercontent.com/shiny1github/myntra-json-api/main/Carousel.json"
)
        let session = URLSession.shared
        let task = session.dataTask(with: serviceUrl!) { (serviceData, serviceResponse, serviceError) in
            if serviceError == nil{
                let httpResonse = serviceResponse as! HTTPURLResponse
                if httpResonse.statusCode == 200{
                    do{
                        let decodedData = try JSONDecoder().decode(HomeScreenDataModel.self, from: serviceData!)
                        self.carouselData = decodedData.carousel
                        self.sliderData = decodedData.slider
                        self.browseData = decodedData.browser
                        DispatchQueue.main.async { [self] in
                            carouselColllectionView.reloadData()
                            sliderColllectionView.reloadData()
                            browsingColllectionView.reloadData()
                            print("carousel api loaded: \(carouselData.count)")
                            print("slider api loaded: \(sliderData.count)")
                            print("Browse api loaded: \(browseData.count)")
                        }
                        }catch{
                            print("parse error")
                        }
                        
                    }
                }
            }
        task.resume()
        }
    
  
    }
