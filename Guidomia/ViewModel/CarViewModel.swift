//
//  CarViewModel.swift
//  Guidomia
//
//  Created by Vish on 2022-12-04.
//

import Foundation

class CarViewModel{
    public var carModel : [Cars]?
    
    init() {
        carModel = loadDataFromJsonFile(filename: Constants.carList)
    }
    
    func loadDataFromJsonFile(filename fileName: String) -> [Cars]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Cars].self, from: data)
                return jsonData
            } catch {
                print("Error:\(error)")
            }
        }
        return nil
    }
    
}
