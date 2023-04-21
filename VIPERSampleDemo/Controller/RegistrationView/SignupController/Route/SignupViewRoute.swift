//
//  SignupViewRoute.swift
//  VIPERSampleDemo
//
//  Created by Kevin on 29/11/22.
//

import Foundation
import UIKit

class SignupViewRoute: SignupPresenterToRouteProtocol {
    

    static func createListModule(signupView: SignupViewController) {
        
        let presenter : SignupviewToPresenterProtocol & SignupInteractorToPresenterProtocol = SignupViewPresenter()
        
        signupView.presenter = presenter
        signupView.presenter?.route = SignupViewRoute()
        signupView.presenter?.view = signupView
        signupView.presenter?.interactor = SignupViewInteractor()
        signupView.presenter?.interactor?.presenter = presenter
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}

