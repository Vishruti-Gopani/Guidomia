//
//  CarDetailTableViewCell.swift
//  Guidomia
//
//  Created by Vish on 2022-12-03.
//

import UIKit

class CarDetailTableViewCell: UITableViewCell {

    private let detailView = ExpandDetailView()
    private let separatorView = SeparatorView(frame: CGRect(x: 15, y: 10, width: UIScreen.main.bounds.size.width - 30 , height: 5))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureTopView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellContainerStackView: UIStackView = {
        var view = UIStackView()
        view.backgroundColor = .white
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
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "Tacoma")
        return imageView
    }()

    let carNameText:UILabel = {
        var label = UILabel()
        label.text = "Car Tacoma"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    let carPriceText:UILabel = {
        var label = UILabel()
        label.text = "Car Tacoma"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    let carRating:UILabel = {
        var label = UILabel()
        label.text = "★ ★ ★ ★ ★"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()

    func configureTopView(){
        self.addSubview(cellContainerStackView)
        cellContainerStackView.addArrangedSubview(topView)
        topView.addSubview(carImage)
        topView.addSubview(carNameText)
        topView.addSubview(carPriceText)
        topView.addSubview(carRating)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        cellContainerStackView.addArrangedSubview(detailView)
        //cellContainerStackView.addArrangedSubview(separatorView)
        setTopViewConstraints()
    }
    
    func setTopViewConstraints(){
        
        cellContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        cellContainerStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        cellContainerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        cellContainerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        cellContainerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: cellContainerStackView.topAnchor, constant: 0).isActive = true
        topView.leadingAnchor.constraint(equalTo: cellContainerStackView.leadingAnchor, constant: 0).isActive = true
        topView.trailingAnchor.constraint(equalTo: cellContainerStackView.trailingAnchor, constant: 0).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        carImage.translatesAutoresizingMaskIntoConstraints = false
        carImage.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 30).isActive = true
        carImage.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0).isActive = true
        carImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        carImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        carNameText.translatesAutoresizingMaskIntoConstraints = false
        carNameText.topAnchor.constraint(equalTo: carImage.topAnchor, constant: 0).isActive = true
        carNameText.leadingAnchor.constraint(equalTo: carImage.trailingAnchor, constant: 30).isActive = true
        carNameText.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0).isActive = true
        
        carPriceText.translatesAutoresizingMaskIntoConstraints = false
        carPriceText.topAnchor.constraint(equalTo: carNameText.bottomAnchor, constant: 0).isActive = true
        carPriceText.leadingAnchor.constraint(equalTo: carImage.trailingAnchor, constant: 30).isActive = true
        carPriceText.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0).isActive = true
        
        carRating.translatesAutoresizingMaskIntoConstraints = false
        carRating.topAnchor.constraint(equalTo: carPriceText.bottomAnchor, constant: 0).isActive = true
        carRating.leadingAnchor.constraint(equalTo: carImage.trailingAnchor, constant: 30).isActive = true
        carRating.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0).isActive = true
        
//        separatorView.translatesAutoresizingMaskIntoConstraints = false
//        separatorView.leadingAnchor.constraint(equalTo: cellContainerStackView.leadingAnchor, constant: 0).isActive = true
//        separatorView.trailingAnchor.constraint(equalTo: cellContainerStackView.trailingAnchor, constant: 0).isActive = true
//        separatorView.bottomAnchor.constraint(equalTo: cellContainerStackView.bottomAnchor, constant: 0).isActive = true

    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension CarDetailTableViewCell {
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
