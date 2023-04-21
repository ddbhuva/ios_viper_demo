//
//  ListViewProtocol.swift
//  VIPERSampleDemo
//
//  Created by Kevin on 29/11/22.
//

import Foundation
import UIKit

// MARK: View -> Presenter

protocol ListviewToPresenterProtocol : AnyObject {
    
    var view : PresenterToListviewProtocol? {get set}
    var route : ListPresenterToRouteProtocol? {get set}
    var interactor : ListPresenterToInteractorProtocol? {get set}
    
    func getListData()
}

// MARK: Presenter -> View

protocol PresenterToListviewProtocol : AnyObject {
    
    func showListData(data: ListDataModel)
    func showError(message: String)
    
}

// MARK: Presenter -> Interactor

protocol ListPresenterToInteractorProtocol : AnyObject {
    
    var presenter : ListInteractorToPresenterProtocol? {get set}
    func getListData()
    
}

// MARK: Interactor -> Presenter

protocol ListInteractorToPresenterProtocol : AnyObject {
    
    func fetchListData(data: ListDataModel)
    func fetchError(message:String)
    
}

// MARK: Presenter -> Route/Wirefram

protocol ListPresenterToRouteProtocol : AnyObject {
    
    static func createListModule(listview: ListViewController)
    
}
