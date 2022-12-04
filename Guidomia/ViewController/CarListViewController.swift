//
//  ViewController.swift
//  Guidomia
//
//  Created by Vish on 2022-12-03.
//

import UIKit

class CarListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var selectedIndex: IndexPath?
    var viewModel: CarViewModel?
  
    // TableView configuration
    private let tableView :UITableView = {
        let tableView = UITableView()
        tableView.register(CarDetailTableViewCell.self, forCellReuseIdentifier: Constants.detailCellIdentifier)
        tableView.register(tableHeaderView.self,
                           forHeaderFooterViewReuseIdentifier: Constants.headerCellIdentifier)
        tableView.backgroundColor = UIColor(named: "Orange")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel = CarViewModel()
        
        NavigationHelper().setupNavigationBar(navigationController: navigationController)
        NavigationHelper().showCustomizedNavigationTitle(navigationItem: navigationItem, title: Constants.navigationTitle)
        
        view.addSubview(tableView)
        setTableViewConstraints()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setTableViewConstraints(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.carModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.detailCellIdentifier, for: indexPath) as! CarDetailTableViewCell
        cell.carModel = viewModel?.carModel?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.headerCellIdentifier) as! tableHeaderView
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3) {
            self.tableView.performBatchUpdates(nil)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = self.tableView.cellForRow(at: indexPath) as? CarDetailTableViewCell {
            cell.hideDetailView()
        }
    }
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.headerViewHeight
    }
}

