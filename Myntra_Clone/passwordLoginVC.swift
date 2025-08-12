//
//  passwordLoginVC.swift
//  Myntra_Clone
//
//  Created by apple on 09/08/25.
//

import UIKit

class passwordLoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func getHelpBtnTap(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "helpVc") as! helpVc
        navigationController?.pushViewController(vc, animated: true)
    }

   

}
