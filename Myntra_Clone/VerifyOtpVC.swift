//
//  VerifyOtpVC.swift
//  Myntra_Clone
//
//  Created by apple on 09/08/25.
//

import UIKit
import FirebaseAuth

class VerifyOtpVC: UIViewController {
    @IBOutlet weak var digit1TF: UITextField!
    @IBOutlet weak var digit2TF: UITextField!
    @IBOutlet weak var digit3TF: UITextField!
    @IBOutlet weak var digit4TF: UITextField!
    @IBOutlet weak var digit5TF: UITextField!
    @IBOutlet weak var digit6TF: UITextField!
    private let spinner = UIActivityIndicatorView(style: .medium)
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        setupSpinner()
        
    }
    private func setupSpinner() {
            spinner.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(spinner)

            // Center the spinner in the view
            NSLayoutConstraint.activate([
                spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        }

        private func showSpinner() {
            spinner.startAnimating()
        }

        private func hideSpinner() {
            spinner.stopAnimating()
            spinner.removeFromSuperview()
        }

    
    @IBAction func passwordBtnTap(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "passwordLoginVC") as! passwordLoginVC
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func getHelpBtnTap(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "helpVc") as! helpVc
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupTextFields() {
            let fields = [digit1TF, digit2TF, digit3TF, digit4TF, digit5TF, digit6TF]
            fields.forEach { tf in
                tf?.keyboardType = .numberPad
                if #available(iOS 12.0, *) {
                    tf?.textContentType = .oneTimeCode
                }
                tf?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            }
        }

        @objc private func textFieldDidChange(_ textField: UITextField) {
            // Auto move to next field
            if let text = textField.text, text.count == 1 {
                switch textField {
                case digit1TF: digit2TF.becomeFirstResponder()
                case digit2TF: digit3TF.becomeFirstResponder()
                case digit3TF: digit4TF.becomeFirstResponder()
                case digit4TF: digit5TF.becomeFirstResponder()
                case digit5TF: digit6TF.becomeFirstResponder()
                case digit6TF:
                    digit6TF.resignFirstResponder()
                    verifyCode()
                default: break
                }
            }
        }

        private func verifyCode() {
            showSpinner()

            let code = [digit1TF, digit2TF, digit3TF, digit4TF, digit5TF, digit6TF]
                        .compactMap { $0?.text }
                        .joined()
            guard let id = UserDefaults.standard.string(forKey: "authVerificationID") else {
                print("No verification ID found")
                return
            }
            let credential = PhoneAuthProvider.provider().credential(
                withVerificationID: id,
                verificationCode: code
            )
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Error verifying OTP:", error.localizedDescription)
                    return
                }
                print("✅ Auth successful! UID:", authResult?.user.uid ?? "N/A")
                // Navigate to your main app
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let VC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                let vc = UINavigationController(rootViewController: VC)
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .coverVertical
                self.present(vc, animated: true)
                        
            }
        }
    }
    
    

