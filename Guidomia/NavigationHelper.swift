//
//  NavigationHelper.swift
//  Guidomia
//
//  Created by Vish on 2022-12-03.
//

import Foundation
import UIKit

class NavigationHelper {
    
    func setupNavigationBar(navigationController:UINavigationController?){
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "Orange")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func showCustomizedNavigationTitle(navigationItem : UINavigationItem, title:String){
        let titlelabel = UILabel(frame: CGRect(x: 15, y: 15, width: 400, height: 50))
        titlelabel.text = title.uppercased()
        titlelabel.textColor = .white
        titlelabel.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
        titlelabel.backgroundColor = UIColor.clear
        titlelabel.textAlignment = .left
        navigationItem.titleView = titlelabel
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: nil)
    }
}
