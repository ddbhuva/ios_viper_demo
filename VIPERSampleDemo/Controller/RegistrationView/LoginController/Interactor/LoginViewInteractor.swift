//
//  LoginViewInteractor.swift
//  VIPERSampleDemo
//
//  Created by Kevin on 29/11/22.
//

import Foundation
import UIKit
import CoreData

class LoginViewInteractor : LoginPresenterToInteractorProtocol {
   
    var presenter: LoginInteractorToPresenterProtocol?
    
    // Reference to managed object contaxt
    var contaxt = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var item : [Signup]?
    
    func getListData(param:User) {
        
        do{
            self.item = try contaxt.fetch(Signup.fetchRequest())
            
            let data = self.item?.firstIndex(where: {$0.email == param.email})
            
            // Compare exist user record
            if let indx = data{
                if self.item?[indx].email == param.email && self.item?[indx].password == param.password{
                    // Send response to Presenter
                    self.presenter?.fetchLoginData(message: Messages.loginSuccess)
                }else{
                    // Send response Error to presenter
                    self.presenter?.fetchError(message: Messages.loginError)
                }
            }else{
                // Send response Error to presenter
                self.presenter?.fetchError(message: Messages.loginError)
            }
        }
        catch{
            // Send response Error to presenter
            self.presenter?.fetchError(message: Messages.loginError)
        }
    }
}
