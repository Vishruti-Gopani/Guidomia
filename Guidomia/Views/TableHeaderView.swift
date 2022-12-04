//
//  TableHeaderView.swift
//  Guidomia
//
//  Created by Vish on 2022-12-03.
//

import Foundation
import UIKit


class tableHeaderView : UITableViewHeaderFooterView{
    
    let stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.backgroundColor = .gray
        return stackView
    }()

    let image: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "Tacoma")
        return imageView
    }()

    let title:UILabel = {
        var label = UILabel()
        label.text = "Car Tacoma"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()

    let filterContainerView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        return view
    }()

    let filterStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.backgroundColor = .gray
        stackView.layer.cornerRadius = Constants.stackVCornerRadius;
        stackView.layer.masksToBounds = true;
        return stackView
    }()

    let filterTitle:UILabel = {
        var label = UILabel()
        label.text = Constants.filterLabel
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()

    let makeTextField:UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .white
        tf.layer.cornerRadius = Constants.tfCornerRadius;
        tf.placeholder = Constants.makeTFPH
        tf.layer.masksToBounds = true;
        return tf
    }()

    let modelTextField:UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .white
        tf.layer.cornerRadius = Constants.tfCornerRadius;
        tf.layer.masksToBounds = true;
        tf.placeholder = Constants.modelTFPH
        return tf
    }()


    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureTopView()
        configureFilterView()
    }

    func configureTopView() {
        contentView.addSubview(stackView)
        stackView.addSubview(image)
        image.addSubview(title)
        setTopViewConstarints()
    }

    func configureFilterView(){
        stackView.addSubview(filterContainerView)
        filterContainerView.addSubview(filterStackView)
        filterStackView.addSubview(filterTitle)
        filterStackView.addSubview(makeTextField)
        filterStackView.addSubview(modelTextField)
        setFilterViewConstraints()
    }

    func setTopViewConstarints(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 400).isActive = true

        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0).isActive = true
        image.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0).isActive = true
        image.trailingAnchor.constraint(equalTo:stackView.trailingAnchor, constant: 0).isActive = true
        image.heightAnchor.constraint(equalToConstant:200.0).isActive = true

        title.translatesAutoresizingMaskIntoConstraints = false
        title.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: 0).isActive = true
        title.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 25).isActive = true
        title.trailingAnchor.constraint(equalTo:image.trailingAnchor, constant: 0).isActive = true
        title.heightAnchor.constraint(equalToConstant:50.0).isActive = true
    }

    func setFilterViewConstraints(){
        filterContainerView.translatesAutoresizingMaskIntoConstraints = false
        filterContainerView.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 0).isActive = true
        filterContainerView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0).isActive = true
        filterContainerView.trailingAnchor.constraint(equalTo:stackView.trailingAnchor, constant: 0).isActive = true
        filterContainerView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0).isActive = true

        filterStackView.translatesAutoresizingMaskIntoConstraints = false
        filterStackView.topAnchor.constraint(equalTo: filterContainerView.topAnchor, constant: 20).isActive = true
        filterStackView.leadingAnchor.constraint(equalTo: filterContainerView.leadingAnchor, constant: 20).isActive = true
        filterStackView.trailingAnchor.constraint(equalTo:filterContainerView.trailingAnchor, constant: -20).isActive = true
        filterStackView.bottomAnchor.constraint(equalTo: filterContainerView.bottomAnchor, constant: -20).isActive = true

        filterTitle.translatesAutoresizingMaskIntoConstraints = false
        filterTitle.topAnchor.constraint(equalTo: filterStackView.topAnchor, constant: 0).isActive = true
        filterTitle.leadingAnchor.constraint(equalTo: filterStackView.leadingAnchor, constant: 20).isActive = true
        filterTitle.trailingAnchor.constraint(equalTo:filterStackView.trailingAnchor, constant: -20).isActive = true
        filterTitle.heightAnchor.constraint(equalToConstant:50.0).isActive = true

        makeTextField.translatesAutoresizingMaskIntoConstraints = false
        makeTextField.topAnchor.constraint(equalTo: filterTitle.bottomAnchor, constant: 0).isActive = true
        makeTextField.leadingAnchor.constraint(equalTo: filterStackView.leadingAnchor, constant: 20).isActive = true
        makeTextField.trailingAnchor.constraint(equalTo:filterStackView.trailingAnchor, constant: -20).isActive = true
        makeTextField.heightAnchor.constraint(equalToConstant:30.0).isActive = true

        modelTextField.translatesAutoresizingMaskIntoConstraints = false
        modelTextField.topAnchor.constraint(equalTo: makeTextField.bottomAnchor, constant: 20).isActive = true
        modelTextField.leadingAnchor.constraint(equalTo: filterStackView.leadingAnchor, constant: 20).isActive = true
        modelTextField.trailingAnchor.constraint(equalTo:filterStackView.trailingAnchor, constant: -20).isActive = true
        modelTextField.heightAnchor.constraint(equalToConstant:30.0).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
