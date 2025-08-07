//
//  ProfileVC.swift
//  Myntra_Clone
//
//  Created by apple on 26/07/25.
//

import UIKit

class ProfileVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var profileDataTableView: UITableView!
    var headingArr = ["Orders","Help Center","Wishlist"]
    var imgArr = [UIImage(systemName: "square.3.layers.3d.middle.filled")!,UIImage(systemName: "person.wave.2")!,UIImage(systemName: "heart")!]
    var detailArr = ["Check your order status","Help regarding your recent purchases","Your most loved styles"]
    var secArr = ["FAQs","ABOUT US","TERMS OF USE","PRIVACY POLICY","GRIEVANCE REDRESSAL"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return headingArr.count + secArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row < headingArr.count){
            let cell = profileDataTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell
            cell.headlingLbl?.text = headingArr[indexPath.row]
            cell.detailsLbl?.text = detailArr[indexPath.row]
            cell.iconImg?.image = imgArr[indexPath.row]
            return cell
        }
        else{
            let secIndex = indexPath.row - headingArr.count
            let secCell = profileDataTableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as! profileSecTableViewCell
            secCell.headlingSecLbl?.text = secArr[secIndex]
            

            return secCell
            
        }
        
        
        
        
        
        
        
    }
}
