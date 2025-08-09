//
//  loginVC.swift
//  Myntra_Clone
//
//  Created by apple on 09/08/25.
//

import UIKit

class loginVC: UIViewController {

    @IBOutlet weak var numberBgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        numberBgView.layer.borderWidth = 0.5
        numberBgView.layer.borderColor = UIColor.gray.cgColor
    }
    
    @IBAction func cancleBtn(_ sender: Any) {
        dismiss(animated: true , completion: nil)
    }
    
    @IBAction func loginBtnTap(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "VerifyOtpVC") as! VerifyOtpVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
