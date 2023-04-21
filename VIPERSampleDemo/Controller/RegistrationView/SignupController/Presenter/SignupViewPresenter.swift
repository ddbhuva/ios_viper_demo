//
//  SignupViewPresenter.swift
//  VIPERSampleDemo
//
//  Created by Kevin on 29/11/22.
//

import Foundation
import UIKit
 
class SignupViewPresenter : SignupviewToPresenterProtocol {
  
    var view: PresenterToSignupviewProtocol?
    var route: SignupPresenterToRouteProtocol?
    var interactor: SignupPresenterToInteractorProtocol?
    
    // Receview call from View to check user exist
    func getListData(param : User) {
        interactor?.getListData(param : param)
    }
}

extension SignupViewPresenter : SignupInteractorToPresenterProtocol {
    
    // Recive response from interactor
    func fetchSignupData(message: String) {
        view?.showSignupData(message: message)
    }
    
    // Recive error from interactor
    func fetchError(message:String) {
        view?.showError(message: message)
    }
}
