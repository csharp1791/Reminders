//
//  ReminderService.swift
//  RemindersApp
//
//  Created by Cliff Sharp on 2/23/23.
//

import Foundation
import UIKit
import CoreData

class ReminderService {
  
  static var viewContext: NSManagedObjectContext {
    CoreDataProvider.shared.persistentContainer.viewContext
  }
  
  static func save() throws {
    try viewContext.save()
  }
  
  static func saveMyList(_ name: String, _ color: UIColor) throws {
    let myList = MyList(context: viewContext)
    myList.name = name
    myList.color = color
    try save()
  }
  
  static func saveReminderToMyList(myList: MyList, reminderTitle: String) throws {
    let reminder = Reminder(context: viewContext)
    reminder.title = reminderTitle
    myList.addToReminders(reminder)
    try? save()
  }
}
