//
//  ViewController.swift
//  Guidomia
//
//  Created by Vish on 2022-12-03.
//

import UIKit

class CarListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    // TableView
    private let tableView :UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.detailCellIdentifier)
        tableView.register(tableHeaderView.self,
                           forHeaderFooterViewReuseIdentifier: Constants.headerCellIdentifier)
        tableView.backgroundColor = UIColor(named: "Orange")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        NavigationHelper().setupNavigationBar(navigationController: navigationController)
        NavigationHelper().showCustomizedNavigationTitle(navigationItem: navigationItem, title: Constants.navigationTitle)
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    private let models = ["A", "B", "C", "D"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.detailCellIdentifier, for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                                                                Constants.headerCellIdentifier) as! tableHeaderView
       return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.headerViewHeight
    }


}

