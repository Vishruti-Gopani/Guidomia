//
//  TableHeaderView.swift
//  Guidomia
//
//  Created by Vish on 2022-12-03.
//

import Foundation
import UIKit

protocol textFieldDelegates{
    func didTapOnMakeField(makeString: String)
    func didTapOnModelField(modelString: String)
}

class tableHeaderView : UITableViewHeaderFooterView{
    
    var delegate: textFieldDelegates?
    
    let stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.backgroundColor = UIColor(named: "DarkGray")
        return stackView
    }()

    // Top Image View configuration
    let image: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "Tacoma")
        return imageView
    }()
    
    let modelText:UILabel = {
        var label = UILabel()
        label.text = Constants.modelText
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 27, weight: .heavy)
        label.textColor = .white
        return label
    }()

    let headLineText:UILabel = {
        var label = UILabel()
        label.text = Constants.headLine
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    //Filter UI view configuration

    let filterContainerView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        return view
    }()

    let filterStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.backgroundColor = UIColor(named: "DarkGray")
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
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor(named: "DarkGray"),
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .medium)
        ]
        tf.attributedPlaceholder = NSAttributedString(string: "Placeholder Text", attributes:attributes)
        tf.backgroundColor = .white
        tf.layer.cornerRadius = Constants.tfCornerRadius;
        tf.placeholder = Constants.makeTFPH
        tf.layer.masksToBounds = true;
        tf.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return tf
    }()

    let modelTextField:UITextField = {
        var tf = UITextField()
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor(named: "DarkGray"),
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .medium)
        ]
        tf.attributedPlaceholder = NSAttributedString(string: "Placeholder Text", attributes:attributes)
        tf.backgroundColor = .white
        tf.layer.cornerRadius = Constants.tfCornerRadius;
        tf.layer.masksToBounds = true;
        tf.placeholder = Constants.modelTFPH
        tf.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
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
        image.addSubview(modelText)
        image.addSubview(headLineText)
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
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 400).isActive = true

        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo:stackView.trailingAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant:200.0).isActive = true
        
        modelText.translatesAutoresizingMaskIntoConstraints = false
        modelText.bottomAnchor.constraint(equalTo: headLineText.topAnchor).isActive = true
        modelText.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 15).isActive = true
        
        headLineText.translatesAutoresizingMaskIntoConstraints = false
        headLineText.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -20).isActive = true
        headLineText.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 15).isActive = true
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
        filterStackView.trailingAnchor.constraint(greaterThanOrEqualTo: filterContainerView.trailingAnchor, constant: -20).isActive = true
        filterStackView.bottomAnchor.constraint(equalTo: filterContainerView.bottomAnchor, constant: -20).isActive = true

        filterTitle.translatesAutoresizingMaskIntoConstraints = false
        filterTitle.topAnchor.constraint(equalTo: filterStackView.topAnchor, constant: 0).isActive = true
        filterTitle.leadingAnchor.constraint(equalTo: filterStackView.leadingAnchor, constant: 20).isActive = true
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
    
    //textfiled delegates to filter cars
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if textField == makeTextField{
            self.delegate?.didTapOnMakeField(makeString: textField.text ?? "")
            modelTextField.text = ""
        }else{
            self.delegate?.didTapOnModelField(modelString: textField.text ?? "")
            makeTextField.text = ""
        }
    }
}

