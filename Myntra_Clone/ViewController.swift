//
//  ViewController.swift
//  Myntra_Clone
//
//  Created by apple on 25/07/25.
//MARK: Apis - NetworkManager.swift
//

import UIKit

class ViewController: UIViewController {
    var allCategoriesArray: [AllCategories] = []
    var carouselDataArray: [String] = []
    var sliderData: [SliderItem] = []
    @IBOutlet weak var homeScreenMainTableView: UITableView!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var locationIcon: UIImageView!
    @IBOutlet weak var deliveryLbl: UILabel!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var notifyBtn: UIButton!
    @IBOutlet weak var wishListBtn: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreenMainTableView.reloadData()
     }
    override func viewWillAppear(_ animated: Bool) {
        if #available(iOS 11.0, *) {
            homeScreenMainTableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }

//        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func wishListBtnTap(_ sender: UIButton) {
            }
    
    @IBAction func notifyBtnTap(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NotificationVC")
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func ProfileBtnTap(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC
        navigationController?.pushViewController(vc!, animated: true)
       
               }
    
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeScreenMainTableView.dequeueReusableCell(withIdentifier: "HomeMainTableViewCell", for: indexPath) as! HomeMainTableViewCell
        
        print("tableview Done")
        return cell
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1800
    }
}






    









