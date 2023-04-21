//
//  LoginViewPresenter.swift
//  VIPERSampleDemo
//
//  Created by Kevin on 29/11/22.
//

import Foundation
import UIKit
 
class LoginViewPresenter : LoginviewToPresenterProtocol {

    var view: PresenterToLoginviewProtocol?
    var route: LoginPresenterToRouteProtocol?
    var interactor: LoginPresenterToInteractorProtocol?
    
    // Receview call from View to check user exist
    func getListData(param : User) {
        interactor?.getListData(param : param)
    }

    // Receview call from view for move to SignupViewController
    func showSignupViewController(nc: UINavigationController) {
        // Sned call to Route for move to SignupViewController
        route?.pushToSignupController(nc: nc)
    }
}

extension LoginViewPresenter : LoginInteractorToPresenterProtocol {
    
    // Recive response from interactor
    func fetchLoginData(message: String) {
        view?.showLoginData(message: message)
    }
    
    // Recive error from interactor
    func fetchError(message:String) {
        view?.showError(message: message)
    }
}
