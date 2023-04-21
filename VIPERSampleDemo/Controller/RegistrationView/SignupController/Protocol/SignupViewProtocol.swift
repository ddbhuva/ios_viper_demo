//
//  SignupViewProtocol.swift
//  VIPERSampleDemo
//
//  Created by Kevin on 29/11/22.
//

import Foundation
import UIKit

// MARK: View -> Presenter

protocol SignupviewToPresenterProtocol : AnyObject {
    
    var view : PresenterToSignupviewProtocol? {get set}
    var route : SignupPresenterToRouteProtocol? {get set}
    var interactor : SignupPresenterToInteractorProtocol? {get set}
    
    func getListData(param : User)
}

// MARK: Presenter -> View

protocol PresenterToSignupviewProtocol : AnyObject {
    
    func showSignupData(message:String)
    func showError(message:String)
    
}

// MARK: Presenter -> Interactor

protocol SignupPresenterToInteractorProtocol : AnyObject {
    
    var presenter : SignupInteractorToPresenterProtocol? {get set}
    func getListData(param : User)
    
}

// MARK: Interactor -> Presenter

protocol SignupInteractorToPresenterProtocol : AnyObject {
    
    func fetchSignupData(message:String)
    func fetchError(message:String)
    
}

// MARK: Presenter -> Route/Wirefram

protocol SignupPresenterToRouteProtocol : AnyObject {
    
    static func createListModule(signupView: SignupViewController)
    
}
