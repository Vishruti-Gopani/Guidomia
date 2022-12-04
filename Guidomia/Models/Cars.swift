//
//  Cars.swift
//  Guidomia
//
//  Created by Vish on 2022-12-04.
//

import Foundation
import UIKit

struct Cars: Codable{
    
    enum CodingKeys: String, CodingKey {
        case consList       = "consList"
        case customerPrice  = "customerPrice"
        case make           = "make"
        case marketPrice    = "marketPrice"
        case model          = "model"
        case prosList       = "prosList"
        case rating         = "rating"
    }
    
    var consList: [String]
    var customerPrice: Double
    var make: String
    var marketPrice: Double
    var model: String
    var prosList: [String]
    var rating: Int
    
    enum CarImages: String {
        
        case rangeRover = "Land Rover"
        case mercedes   = "Mercedes Benz"
        case toyota     = "Toyota"
        case bmw        = "BMW"
        case alpine     = "Alpine"

        public var pngImage: UIImage {
            
            var imageName: String!
            
            switch self {
            case .rangeRover:
                imageName = "Range_Rover"
            case .mercedes:
                imageName = "Mercedez_benz_GLC"
            case .toyota:
                imageName = "Tacoma"
            case .bmw:
                imageName = "BMW_330i"
            case .alpine:
                imageName = "Alpine_roadster"
            }
            return UIImage(named: imageName) ?? UIImage()
        }
    }
    
    func getCarImage() -> UIImage{
        
        switch CarImages(rawValue: make) {
        case .bmw :
            return CarImages.bmw.pngImage
        case .mercedes:
            return CarImages.mercedes.pngImage
        case .rangeRover:
            return CarImages.rangeRover.pngImage
        case .alpine:
            return CarImages.alpine.pngImage
        case .toyota:
            return CarImages.toyota.pngImage
        default:
            return UIImage()
        }
    }
    
    func getCarName() -> String {
        return make + Constants.space + model
    }
    
    func getCarPrice() -> String {
        let price = Int((customerPrice/1000))
        return Constants.price + String(price) + Constants.k
    }
    
    func getCarRating() -> String {
        var star = Constants.star
        var spaceStar = Constants.space + star
        for _ in 1..<rating {
            star.append(spaceStar)
        }
        return star
    }
}
