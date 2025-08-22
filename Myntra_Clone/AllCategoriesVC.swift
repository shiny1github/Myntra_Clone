//
//  AllCategoriesVC.swift
//  Myntra_Clone
//
//  Created by apple on 22/08/25.
//

import UIKit

class AllCategoriesVC: UIViewController {
    @IBOutlet weak var sidebarTableView: UITableView!
    
    var categorySideData : [CategorySideItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getCategorySideApi()
        sidebarTableView.dataSource = self
        sidebarTableView.delegate = self
        
    }
    
    


}
extension AllCategoriesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorySideData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sidebarTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategorySidebarTableViewCell
        let category = categorySideData[indexPath.item]
        cell.sideImg?.loadImage(from: category.sideImageURL)
        cell.sideLbl?.text = category.categoryTitle
        return cell
    }
    
}
