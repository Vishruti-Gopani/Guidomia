//
//  CarDetailTableViewCell.swift
//  Guidomia
//
//  Created by Vish on 2022-12-03.
//

import UIKit

class CarDetailTableViewCell: UITableViewCell {

    private let detailView = ExpandDetailView()
    private let separatorView = SeparatorView()
    
    public var carModel: Cars? {
        didSet {
            self.configureDataFromModel()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureTopView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellContainerStackView: UIStackView = {
        var view = UIStackView()
        view.backgroundColor = UIColor(named: "LightGray")
        view.axis = .vertical
        return view
    }()
    
    let topView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(named: "LightGray")
        return view
    }()
    
   
    let carImage: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "Tacoma")
        return imageView
    }()

    let carNameText:UILabel = {
        var label = UILabel()
        label.text = "Car Name"
        label.textAlignment = .left
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    let carPriceText:UILabel = {
        var label = UILabel()
        label.text = "Car Price"
        label.textAlignment = .left
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    let carRating:UILabel = {
        var label = UILabel()
        label.text = "★ ★ ★ ★ ★"
        label.textAlignment = .left
        label.textColor = UIColor(named: "Orange")
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()

    func configureTopView(){
        self.addSubview(cellContainerStackView)
        cellContainerStackView.addArrangedSubview(topView)
        topView.addSubview(carImage)
        topView.addSubview(carNameText)
        topView.addSubview(carPriceText)
        topView.addSubview(carRating)
        cellContainerStackView.addArrangedSubview(detailView)
        cellContainerStackView.addArrangedSubview(separatorView)
        setTopViewConstraints()
    }
    
    func setTopViewConstraints(){
        
        cellContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        cellContainerStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        cellContainerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        cellContainerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        cellContainerStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: 0).isActive = true
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: cellContainerStackView.topAnchor, constant: 0).isActive = true
        topView.leadingAnchor.constraint(equalTo: cellContainerStackView.leadingAnchor, constant: 0).isActive = true
        topView.trailingAnchor.constraint(equalTo: cellContainerStackView.trailingAnchor, constant: 0).isActive = true
        topView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true

        carImage.translatesAutoresizingMaskIntoConstraints = false
        carImage.leadingAnchor.constraint(equalTo: cellContainerStackView.leadingAnchor, constant: 20).isActive = true
        carImage.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0).isActive = true
        carImage.widthAnchor.constraint(equalToConstant: 90).isActive = true
        carImage.bottomAnchor.constraint(equalTo: carRating.bottomAnchor, constant: 0).isActive = true
        
        carNameText.translatesAutoresizingMaskIntoConstraints = false
        carNameText.topAnchor.constraint(equalTo: carImage.topAnchor, constant: 0).isActive = true
        carNameText.leadingAnchor.constraint(equalTo: carImage.trailingAnchor, constant: 15).isActive = true
        carNameText.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0).isActive = true
        carNameText.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        carPriceText.translatesAutoresizingMaskIntoConstraints = false
        carPriceText.topAnchor.constraint(equalTo: carNameText.bottomAnchor, constant: 0).isActive = true
        carPriceText.leadingAnchor.constraint(equalTo: carImage.trailingAnchor, constant: 15).isActive = true
        carPriceText.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0).isActive = true
        carPriceText.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        carRating.translatesAutoresizingMaskIntoConstraints = false
        carRating.topAnchor.constraint(equalTo: carPriceText.bottomAnchor, constant: 0).isActive = true
        carRating.leadingAnchor.constraint(equalTo: carImage.trailingAnchor, constant: 15).isActive = true
        carRating.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0).isActive = true
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.bottomAnchor.constraint(equalTo: cellContainerStackView.bottomAnchor, constant: 0).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: cellContainerStackView.leadingAnchor, constant: 0).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: cellContainerStackView.trailingAnchor, constant: 0).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension CarDetailTableViewCell {
    
    private func configureDataFromModel() {
        carNameText.text = carModel?.getCarName()
        carPriceText.text = carModel?.getCarPrice()
        carRating.text = carModel?.getCarRating()
        carImage.image = carModel?.getCarImage()
        
        detailView.prosTitle.isHidden = carModel?.hideProsLabel() ?? false
        detailView.prosDetail.isHidden = detailView.prosTitle.isHidden
        if detailView.prosTitle.isHidden == false{
            if let prosArr = carModel?.prosList.filter({ $0.isEmpty == false }) {
                detailView.prosDetail.attributedText = NSAttributedString().showBulletText(array: prosArr)
            }
        }
        
        detailView.consTitle.isHidden = carModel?.hideConsLable() ?? false
        detailView.consDetail.isHidden = detailView.consTitle.isHidden
        if detailView.consTitle.isHidden == false{
            if let consArr = carModel?.consList.filter({ $0.isEmpty == false }) {
                detailView.consDetail.attributedText = NSAttributedString().showBulletText(array: consArr)
            }
        }
    }
    
    
    var isDetailViewHidden: Bool {
        return detailView.isHidden
    }
    
    func showDetailView() {
        detailView.isHidden = false
    }

    func hideDetailView() {
        detailView.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if isDetailViewHidden, selected {
            showDetailView()
        } else {
            hideDetailView()
        }
    }
}
