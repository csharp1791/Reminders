//
//  Date+Extensions.swift
//  RemindersApp
//
//  Created by Cliff Sharp on 2/25/23.
//

import Foundation

extension Date {
  
  var isToday: Bool {
    let calendar = Calendar.current
    return calendar.isDateInToday(self)
  }
  
  var isTomorrow: Bool {
    let calender = Calendar.current
    return calender.isDateInTomorrow(self)
  }
  
  var dateComponents: DateComponents {
    Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: self)
  }
  
}
