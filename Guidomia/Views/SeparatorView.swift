//
//  SeparatorView.swift
//  Guidomia
//
//  Created by Vish on 2022-12-04.
//

import UIKit

class SeparatorView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        configureLineView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let lineView: UIView = {
        var view = UIView(frame: CGRect(x: 15, y: -2, width: UIScreen.main.bounds.size.width - 30 , height: 2))
        view.backgroundColor = UIColor(named: "Orange")
        return view
    }()
    
    func configureLineView(){
        addSubview(lineView)
        lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 6).isActive = true
    }
}
