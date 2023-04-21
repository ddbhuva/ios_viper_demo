//
//  SignupViewInteractor.swift
//  VIPERSampleDemo
//
//  Created by Kevin on 29/11/22.
//

import Foundation
import UIKit
import CoreData

class SignupViewInteractor : SignupPresenterToInteractorProtocol {
   
    var presenter: SignupInteractorToPresenterProtocol?
    
    // Reference to managed object contaxt
    var contaxt = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var item : [Signup]?
    
    func getListData(param:User) {
        
        let addNewUser = Signup(context: contaxt)
        
        // Fetch store record
        do{
            self.item = try contaxt.fetch(Signup.fetchRequest())
        }
        catch{
        }
        
        let data = self.item?.firstIndex(where: {$0.email == param.email})
        
        // Check Email in already exist or not
        if let indx = data{
            if self.item?[indx].email == param.email{
                // Send response Error to presenter
                self.presenter?.fetchError(message: Messages.emailAlreadyExist)
            }else{
                // Send response Error to presenter
                self.presenter?.fetchError(message: Messages.error)
            }
        }else{
            addNewUser.firstname = param.fName
            addNewUser.lastname = param.lName
            addNewUser.email = param.email
            addNewUser.password = param.password
           
            // Save this Data
            do{
                // Send response to Presenter
                try self.contaxt.save()
                self.presenter?.fetchSignupData(message: Messages.signupSuccess)
            }
            catch{
                // Send response Error to presenter
                self.presenter?.fetchError(message: Messages.error)
            }
        }
    }
}
