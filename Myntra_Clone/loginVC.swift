//
//  loginVC.swift
//  Myntra_Clone
//
//  Created by apple on 09/08/25.
//

import UIKit

class loginVC: UIViewController {

    @IBOutlet weak var checkboxBtn: UIButton!
    @IBOutlet weak var numberBgView: UIView!
    
    let checkedImage = UIImage(named: "checkbox")! as UIImage
    let uncheckedImage = UIImage(systemName: "rectangle")! as UIImage
//    rectangle
        
        // Bool property
        var isChecked: Bool = false {
            didSet {
                if isChecked == true {
                    checkboxBtn.setBackgroundImage(checkedImage, for: UIControl.State.normal)
                } else {
                    checkboxBtn.setBackgroundImage(uncheckedImage, for: UIControl.State.normal)
                }
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberBgView.layer.borderWidth = 0.5
        numberBgView.layer.borderColor = UIColor.gray.cgColor
        self.isChecked = false
        
    }
    
    @IBAction func cancleBtn(_ sender: Any) {
        dismiss(animated: true , completion: nil)
    }
   
    @IBAction func loginBtnTap(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "VerifyOtpVC") as! VerifyOtpVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func checkBoxBtnTap(_ sender: UIButton) {
        sender.isSelected.toggle()
         // or, if using your custom isChecked:
         isChecked.toggle()
//        if sender == self {
//                    isChecked = !isChecked
//                }
    }
    

}
