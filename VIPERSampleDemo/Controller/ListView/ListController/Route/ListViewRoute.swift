//
//  ListViewRoute.swift
//  VIPERSampleDemo
//
//  Created by Kevin on 29/11/22.
//

import Foundation
import UIKit

class ListViewRoute: ListPresenterToRouteProtocol {
   
    static func createListModule(listview: ListViewController) {
        
        let presenter : ListviewToPresenterProtocol & ListInteractorToPresenterProtocol = ListViewPresenter()
        
        listview.presenter = presenter
        listview.presenter?.route = ListViewRoute()
        listview.presenter?.view = listview
        listview.presenter?.interactor = ListViewInteractor()
        listview.presenter?.interactor?.presenter = presenter
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }

}
