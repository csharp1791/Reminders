//
//  ReminderEditConfig.swift
//  RemindersApp
//
//  Created by Cliff Sharp on 2/26/23.
//

import Foundation

struct ReminderEditConfig {
  var title: String = ""
  var notes: String?
  var isCompleted: Bool = false
  var hasDate: Bool = false
  var hasTime: Bool = false
  var reminderDate: Date?
  var reminderTime: Date?
  
  init() { }
  
  init (reminder: Reminder) {
    title = reminder.title ?? ""
    notes = reminder.notes
    isCompleted = reminder.isCompleted
    reminderDate = reminder.reminderDate
    reminderTime = reminder.reminderTime
    hasDate = reminder.reminderDate != nil
    hasTime = reminder.reminderTime != nil
  }
}
