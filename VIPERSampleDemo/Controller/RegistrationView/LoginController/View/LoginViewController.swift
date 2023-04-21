//
//  LoginViewController.swift
//  VIPERSampleDemo
//
//  Created by Kevin on 29/11/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var presenter : LoginviewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginViewRoute.createListModule(loginView: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view == view {
            self.view.endEditing(true)
        }
    }
    
    @IBAction func btnActSignin(_ sender: Any) {
        checkValidations()
    }
    
    @IBAction func btnActCreateAccount(_ sender: Any) {
        // Send call to Presenter for move to SignupViewController
        presenter?.showSignupViewController(nc: navigationController!)
    }
}

extension LoginViewController {
    
    // Check validation
    func checkValidations() {
        
        if !CheckValidation.shared.validateEmail(text: txtEmail.text!) {
            if txtEmail.text != ""{
                showAlert(title: "Message",message: Messages.emailV)
            }else{
                showAlert(title: "Message",message: Messages.email)
            }
        }else if txtPassword.text == "" {
            showAlert(title: "Message",message: Messages.password)
        }else{
            callLoginView()
        }
    }
    
    // Add new user
    func callLoginView() {
        
        let email = txtEmail.text ?? ""
        let password = txtPassword.text ?? ""
        
        let users : User = User(email: email,password: password)
        
        // Send call to presenter for check user exist
        presenter?.getListData(param: users)
    }
}

//MARK:- Retrive Data from PresenterView
extension LoginViewController : PresenterToLoginviewProtocol {
    
    // Recive response from presenter
    func showLoginData(message:String) {
        
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
extension LoginViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

     if textField == txtEmail {
            txtPassword.becomeFirstResponder()
        } else if textField == txtPassword {
            textField.resignFirstResponder()
        }

        return true
    }
}
