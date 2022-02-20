//
//  Model.swift
//  MealsApp
//
//  Created by Владимир Данилович on 16.02.22.
//

import Foundation
import UIKit

struct Food {
    var name: String
    var price: Double
    var image: UIImage?
    
    var ratingArray: [Reviews] = []
    
    var ratingStar: String {
        if let rating = rating {
            return String(repeating: "⭐️", count: Int(rating.rounded(.up)))
        } else {
            return "Нет отзывов"
        }
    }
    
    var rating: Double? {
        if ratingArray.isEmpty {
            return nil
        } else {
            var sum: Double = 0
            for rewiev in ratingArray {
                sum += rewiev.mark
            }
            return sum / Double(ratingArray.count)
        }
    }
}

struct Reviews {
    
    private let date = Date()
    
    let text: String
    let mark: Double
    
    var rating: String {
        String(repeating: "⭐️", count: Int(mark.rounded(.up)))
    }
    
    var dateStr: String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.YYYY HH:mm:ss"
        dateFormater.locale = Locale(identifier: "ru_Ru")
        return dateFormater.string(from: date)
    }
}
