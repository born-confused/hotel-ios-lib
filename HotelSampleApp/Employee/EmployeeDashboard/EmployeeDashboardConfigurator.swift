//
//  EmployeeDashboardConfigurator.swift
//  HotelSampleApp
//
//  Created by Aditya Nand on 09/01/21.
//

import UIKit

enum EmployeeDashboardConfigurator {
    static func makeScreen() -> UIViewController {
        let unavailableWeekday: [HoursCellState] = [.Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable, .Unavailable]
        return EmployeeDashboardVC(unavailableWeekday: unavailableWeekday)
    }
}
