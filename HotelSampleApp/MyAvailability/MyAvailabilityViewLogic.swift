//
//  MyAvailabilityViewLogic.swift
//  HotelSampleApp
//
//  Created by Aditya Nand on 14/01/21.
//

protocol SaveHoursData {
    func saveViewLogicData(weekDay: WeekDay, updatedHoursInformation: [HoursCellState])
}

class MyAvailabilityViewLogic {
    
    private var weekDays: [WeekDay]
    private var availableHours: [WeekDay: [HoursCellState]]
    
    init(weekDay: [WeekDay], availableHours: [WeekDay: [HoursCellState]]) {
        self.weekDays = weekDay
        self.availableHours = availableHours
    }
    
    func getWeekDay(row: Int) -> WeekDay {
        return weekDays[row]
    }
    
    func getWeekdaysCount() -> Int {
        return weekDays.count
    }
    
    func getWorkHoursOfDay(row: Int) -> [HoursCellState] {
        let weekDay = getWeekDay(row: row)
        for (key, value) in availableHours {
            if key == weekDay {
                return value
            }
        }
        return []
    }
    
    func saveUpdatedHoursState(weekDay: WeekDay, updatedHoursInformation: [HoursCellState]) {
        availableHours[weekDay] = updatedHoursInformation
    }
}
