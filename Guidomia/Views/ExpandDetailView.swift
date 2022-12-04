//
//  ExpandDetailView.swift
//  Guidomia
//
//  Created by Vish on 2022-12-04.
//

import UIKit

class ExpandDetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let containerStackView: UIStackView = {
        var view = UIStackView()
        view.backgroundColor = UIColor(named: "LightGray")
        view.axis = .vertical
        return view
    }()
    
    let prosTitle:UILabel = {
        var label = UILabel()
        label.text = "Pros:"
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    let prosDetail:UILabel = {
        var label = UILabel()
        label.text = "Pros: Detail......"
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    let consTitle:UILabel = {
        var label = UILabel()
        label.text = "Cons:"
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    let consDetail:UILabel = {
        var label = UILabel()
        label.text = "Cons: Detail......."
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()

    
    func configureViews() {
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(prosTitle)
        containerStackView.addArrangedSubview(prosDetail)
        containerStackView.addArrangedSubview(consTitle)
        containerStackView.addArrangedSubview(consDetail)
        setViewsConstraints()
        
    }
    
    func setViewsConstraints(){
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        containerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }

}
