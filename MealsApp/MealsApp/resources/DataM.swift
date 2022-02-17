//
//  Data.swift
//  MealsApp
//
//  Created by Владимир Данилович on 16.02.22.
//

import Foundation
import UIKit

class DataM {
    private init() {
        foods = [Food(name: "Суп", price: 5.0, image: UIImage(named: "Суп")),
            Food(name: "Спагетти", price: 10.0, image: UIImage(named: "Спагетти")),
            Food(name: "Пицца", price: 15.0, image: UIImage(named: "Пицца"))]
    }

    static let shared = DataM()

    var foods: [Food]
}

