//
//  MyAvailabilityModel.swift
//  HotelSampleApp
//
//  Created by Aditya Nand on 12/01/21.
//

import UIKit

enum HoursCellState {
    case Unavailable
    case Available
    case Assigned
    
    func getColor() -> UIColor {
        switch self {
        case .Unavailable:
            return UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        case .Available:
            return UIColor(red: 0, green: 1, blue: 0, alpha: 0.5)
        case .Assigned:
            return UIColor(red: 1, green: 1, blue: 0, alpha: 0.5)
        }
    }
}

enum UserType: Equatable {
    case Employer
    case Employee
}
