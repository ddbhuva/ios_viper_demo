//
//  LoginViewRoute.swift
//  VIPERSampleDemo
//
//  Created by Kevin on 29/11/22.
//

import Foundation
import UIKit

class LoginViewRoute: LoginPresenterToRouteProtocol {
    
    static func createListModule(loginView: LoginViewController) {
        
        let presenter : LoginviewToPresenterProtocol & LoginInteractorToPresenterProtocol = LoginViewPresenter()
        
        loginView.presenter = presenter
        loginView.presenter?.route = LoginViewRoute()
        loginView.presenter?.view = loginView
        loginView.presenter?.interactor = LoginViewInteractor()
        loginView.presenter?.interactor?.presenter = presenter
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }

    // Recive call from Presenter for move to SignupViewController
    func pushToSignupController(nc navigationController: UINavigationController) {
        let signupView = LoginViewRoute.mainstoryboard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        SignupViewRoute.createListModule(signupView: signupView)
        navigationController.pushViewController(signupView,animated: true)
    }
}
