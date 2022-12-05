//
//  ViewController.swift
//  Guidomia
//
//  Created by Vish on 2022-12-03.
//

import UIKit

class CarListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, textFieldDelegates {
   
    private var selectedIndex: IndexPath?
    var viewModel: CarViewModel?
    var isFiltering: Bool = false
    
    var filterData = [Cars]() {
        didSet {
            tableView.reloadData()
        }
    }
  
    // TableView configuration
    private let tableView :UITableView = {
        let tableView = UITableView()
        tableView.register(CarDetailTableViewCell.self, forCellReuseIdentifier: Constants.detailCellIdentifier)
        tableView.register(tableHeaderView.self,
                           forHeaderFooterViewReuseIdentifier: Constants.headerCellIdentifier)
        tableView.backgroundColor = UIColor(named: "LightGray")
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
    
    override func viewWillAppear(_ animated: Bool) {
        if let carModelObj = viewModel?.carModel, !carModelObj.isEmpty{
            var index = IndexPath.init(row: 0, section: 0)
            tableView.selectRow(at: index, animated: true, scrollPosition: .bottom)
        }
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
        if isFiltering{
            return filterData.count
        }
        return viewModel?.carModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.detailCellIdentifier, for: indexPath) as! CarDetailTableViewCell
        let car = isFiltering ? filterData[indexPath.row] : viewModel?.carModel?[indexPath.row]
        cell.carModel = car
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.headerCellIdentifier) as! tableHeaderView
        view.delegate = self
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.2) {
            self.tableView.performBatchUpdates(nil)
        }
        tableView.scrollToRow(at: indexPath, at: .none, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = self.tableView.cellForRow(at: indexPath) as? CarDetailTableViewCell {
            cell.hideDetailView()
        }
        tableView.scrollToRow(at: indexPath, at: .none, animated: true)
    }
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.headerViewHeight
    }
    
    // Methods for search textfields delegates
    
    func didTapOnMakeField(makeString: String) {
        if let data = viewModel?.carModel, makeString.count > 0 {
            isFiltering = true
            filterData = data.filter({(dataString: Cars) -> Bool in
                return (dataString.make.range(of: makeString, options: .caseInsensitive) != nil)
            })
            
        } else {
            isFiltering = false
            filterData = viewModel?.carModel ?? []
        }
    }
    
    func didTapOnModelField(modelString: String) {
        if let data = viewModel?.carModel, modelString.count > 0 {
            isFiltering = true
            filterData = data.filter({(dataString: Cars) -> Bool in
                return (dataString.model.range(of: modelString, options: .caseInsensitive) != nil)
            })
            
        } else {
            isFiltering = false
            filterData = viewModel?.carModel ?? []
        }
    }
}

