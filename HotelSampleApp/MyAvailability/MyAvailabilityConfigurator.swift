//
//  MyAvailabilityConfigurator.swift
//  HotelSampleApp
//
//  Created by Aditya Nand on 10/01/21.
//

import UIKit

enum MyAvailabilityConfigurator {
    static func makeScreen(hotelConfig: HotelConfiguration) -> MyAvailabilityVC {
        return MyAvailabilityVC(hotelConfig: hotelConfig)
    }
}
