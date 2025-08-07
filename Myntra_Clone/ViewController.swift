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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreenMainTableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
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



    









