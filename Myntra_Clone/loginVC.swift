//
//  loginVC.swift
//  Myntra_Clone
//
//  Created by apple on 09/08/25.
//

import UIKit
import FirebaseAuth

class loginVC: UIViewController {

    @IBOutlet weak var checkboxBtn: UIButton!
    @IBOutlet weak var numberBgView: UIView!
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var gotoOTP: UIButton!
    
    let checkedImage = UIImage(named: "checkbox")! as UIImage
    let uncheckedImage = UIImage(systemName: "rectangle")! as UIImage
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
        guard let phone = loginTF.text, !phone.isEmpty else {
              print("Enter valid phone number")
              return
          }
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        
          PhoneAuthProvider.provider().verifyPhoneNumber(phone, uiDelegate: nil) { id, error in
              if let error = error {
                  let nsError = error as NSError
                  print("=== Firebase verifyPhoneNumber ERROR ===")
                          print("localizedDescription:", nsError.localizedDescription)
                          print("domain:", nsError.domain)
                          print("code:", nsError.code)
                          print("userInfo:", nsError.userInfo)
                  
                  print("Error sending OTP:", error.localizedDescription)
                  return
              }
              UserDefaults.standard.set(id, forKey: "authVerificationID")
              print("OTP sent, verification ID saved.")
              self.gotoOTPFields()
          }
      }
      
@IBAction func getHelpBtnTap(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "helpVc") as! helpVc
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func checkBoxBtnTap(_ sender: UIButton) {
        sender.isSelected.toggle()
         isChecked.toggle()

    }
    func gotoOTPFields() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "VerifyOtpVC") as! VerifyOtpVC
        navigationController?.pushViewController(vc, animated: true)
    }

    

}
