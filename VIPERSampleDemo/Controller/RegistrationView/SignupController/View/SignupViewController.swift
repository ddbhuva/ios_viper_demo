//
//  SignupViewController.swift
//  VIPERSampleDemo
//
//  Created by Kevin on 29/11/22.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var presenter : SignupviewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view == view {
            self.view.endEditing(true)
        }
    }
    
    @IBAction func btnActSignup(_ sender: Any) {
        checkValidations()
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func btnActAlreadyHaveAccount(_ sender: Any) {
        self.popVC()
    }
}

extension SignupViewController {
    
    // Check validation
    func checkValidations() {
        
        if !CheckValidation.shared.validateName(text: txtFirstName.text!) {
            if txtFirstName.text != ""{
                showAlert(title: "Message",message: Messages.fNameV)
            }else{
                showAlert(title: "Message",message: Messages.fName)
            }
        }else if !CheckValidation.shared.validateName(text: txtLastName.text!) {
            if txtLastName.text != ""{
                showAlert(title: "Message",message: Messages.lNameV)
            }else{
                showAlert(title: "Message",message: Messages.lName)
            }
        }else if !CheckValidation.shared.validateEmail(text: txtEmail.text!) {
            if txtEmail.text != ""{
                showAlert(title: "Message",message: Messages.emailV)
            }else{
                showAlert(title: "Message",message: Messages.email)
            }
        }else if !CheckValidation.shared.validatePassword(text: txtPassword.text!) {
            if txtPassword.text != ""{
                showAlert(title: "Message",message: Messages.passwordV)
            }else{
                showAlert(title: "Message",message: Messages.password)
            }
        }else{
            callSignupView()
        }
    }
    
    // Add new user
    func callSignupView() {
        
        let fName = txtFirstName.text ?? ""
        let lName = txtLastName.text ?? ""
        let email = txtEmail.text ?? ""
        let password = txtPassword.text ?? ""
        
        let users : User = User(fName: fName,lName: lName,email: email,password: password)
        
        // Send call to presenter for check user exist
        presenter?.getListData(param: users)
    }
}

//MARK:- Retrive Data from PresenterView
extension SignupViewController : PresenterToSignupviewProtocol {
    
    // Recive response from presenter
    func showSignupData(message:String) {
        
        UserDefaults.setObject(value: true, key: UDFKey.isUserLogin)
        
        // Set ListViewVontroller as a Root viewcontroller
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.callListViewController()
    }
    
    // Recive error from presenter
    func showError(message: String) {
        self.showAlert(title: "Message",message: message)
    }
}

// MARK:- UITextFieldDelegate
extension SignupViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == txtFirstName {
            txtLastName.becomeFirstResponder()
        } else if textField == txtLastName {
            txtEmail.becomeFirstResponder()
        } else if textField == txtEmail {
            txtPassword.becomeFirstResponder()
        } else if textField == txtPassword {
            textField.resignFirstResponder()
        }

        return true
    }
}
