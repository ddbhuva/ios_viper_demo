//
//  ListViewController.swift
//  VIPERSampleDemo
//
//  Created by Kevin on 29/11/22.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter : ListviewToPresenterProtocol?
    var listDataModel : ListDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ListViewRoute.createListModule(listview: self)
        
        setupView()
        setupTableview()
    }
    
    func setupView() {
        // Send call to presenter for get data
        presenter?.getListData()
    }
    
    func setupTableview(){
        tableView.register(ListDataTableCell.nib, forCellReuseIdentifier: ListDataTableCell.reuseIdentifier)
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.popVC()
    }
}

extension ListViewController : PresenterToListviewProtocol {
  
    // Recive response from presenter
    func showListData(data: ListDataModel) {
        self.listDataModel = data
        self.tableView.reloadData()
    }
    
    // Recive error from presenter
    func showError(message: String) {
        self.showAlert(message: message)
    }
}

//MARK:- Call UITableView Delegate & Datasource
extension ListViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDataModel?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ListDataTableCell.reuseIdentifier) as! ListDataTableCell
        
        let data = listDataModel?.data?[indexPath.row]
        
        cell.lblTitle.text = data?.categoryName ?? ""
        
        cell.imgVIew.download(from: data?.imagePath ?? "")
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
