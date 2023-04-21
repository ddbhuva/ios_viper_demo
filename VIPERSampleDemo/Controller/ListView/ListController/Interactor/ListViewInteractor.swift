//
//  ListViewInteractor.swift
//  VIPERSampleDemo
//
//  Created by Kevin on 29/11/22.
//

import Foundation
import UIKit
import ProgressHUD

class ListViewInteractor : NSObject, ListPresenterToInteractorProtocol {
  
    // Define network Status for check network connection
    var networkStatus = Reach().connectionStatus()
    
    override init() {
        super.init()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.networkStatusChanged(_:)), name: NSNotification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
        Reach().monitorReachabilityChanges()
    }
    
    // Internet monitor status
    @objc func networkStatusChanged(_ notification: Notification) {
        self.networkStatus = Reach().connectionStatus()
    }
    
    var presenter: ListInteractorToPresenterProtocol?
    
    // Check internet reachability
    func getListData() {
        
        switch networkStatus {
        case .Offline:
            // Send internet offline Error to presenter
            presenter?.fetchError(message: Messages.networkUnavailable)
        case .Online:
            callGetListData()
        case .Unknown:
            break
        }
    }
}

// Call Api
extension ListViewInteractor {
    
    func callGetListData() {
      
        ProgressHUD.show()
        nm.dataservide.request(.resource) { result in
            ProgressHUD.dismiss()
            switch result {
                
            case let .success(response):
                if let listDataModel = try? JSONDecoder().decode(ListDataModel.self, from: response.data) {
                    
                    if  listDataModel.status == "success" {
                        // Send response to Presenter
                        self.presenter?.fetchListData(data: listDataModel)
                    }else{
                        // Send response Error to presenter
                        self.presenter?.fetchError(message: listDataModel.message ?? "")
                    }
                }else{
                    // Send technical Error to presenter
                    self.presenter?.fetchError(message: Messages.technicalIssue)
                }
            case let .failure(error):
                // Send local Error to presenter
                self.presenter?.fetchError(message: error.localizedDescription)
            }
        }
    }
}
