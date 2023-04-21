//
//  ListViewPresenter.swift
//  VIPERSampleDemo
//
//  Created by Kevin on 29/11/22.
//

import Foundation
import UIKit

class ListViewPresenter : ListviewToPresenterProtocol {
   
    var view: PresenterToListviewProtocol?
    var route: ListPresenterToRouteProtocol?
    var interactor: ListPresenterToInteractorProtocol?
    
    // Receview call from View To get data
    func getListData() {
        interactor?.getListData()
    }
}

extension ListViewPresenter : ListInteractorToPresenterProtocol {
  
    // Recive response from interactor
    func fetchListData(data: ListDataModel) {
        // send response to view
        view?.showListData(data: data)
    }
    
    // Recive error from interactor
    func fetchError(message: String) {
        // send error to view
        view?.showError(message: message)
    }
}
