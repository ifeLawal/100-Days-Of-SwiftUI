//
//  PropertyExtensions.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 7/6/24.
//

import Foundation

extension String {
    func formattedDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let date = dateFormatter.date(from: self) {
            return date.formattedMonthDay()
        } else {
            return nil
        }
    }
    
    func formattedTime() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let date = dateFormatter.date(from: self) {
            return date.formattedTime()
        } else {
            return nil
        }
    }
}

extension Date {
    func formattedMonthDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd"
        return dateFormatter.string(from: self)
    }
    
    func formattedTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
}
