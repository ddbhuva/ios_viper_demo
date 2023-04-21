//
//  LoginViewProtocol.swift
//  VIPERSampleDemo
//
//  Created by Kevin on 29/11/22.
//

import Foundation
import UIKit

// MARK: View -> Presenter

protocol LoginviewToPresenterProtocol : AnyObject {
    
    var view : PresenterToLoginviewProtocol? {get set}
    var route : LoginPresenterToRouteProtocol? {get set}
    var interactor : LoginPresenterToInteractorProtocol? {get set}
    
    func getListData(param : User)
    func showSignupViewController(nc:UINavigationController)
}

// MARK: Presenter -> View

protocol PresenterToLoginviewProtocol : AnyObject {
    
    func showLoginData(message:String)
    func showError(message:String)
    
}

// MARK: Presenter -> Interactor

protocol LoginPresenterToInteractorProtocol : AnyObject {
    
    var presenter : LoginInteractorToPresenterProtocol? {get set}
    func getListData(param : User)
    
}

// MARK: Interactor -> Presenter

protocol LoginInteractorToPresenterProtocol : AnyObject {
    
    func fetchLoginData(message:String)
    func fetchError(message:String)
    
}

// MARK: Presenter -> Route/Wirefram

protocol LoginPresenterToRouteProtocol : AnyObject {
    
    static func createListModule(loginView:LoginViewController)
    func pushToSignupController(nc:UINavigationController)
}
