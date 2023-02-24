//
//  MyList+CoreDataProperties.swift
//  RemindersApp
//
//  Created by Cliff Sharp on 2/22/23.
//

import Foundation
import UIKit
import CoreData

extension MyList {
  
  @nonobjc public class func fetchRequest ( ) -> NSFetchRequest<MyList> {
    return NSFetchRequest<MyList> (entityName: "MyList")
  }
  
  @NSManaged public var name: String
  @NSManaged public var color: UIColor
  @NSManaged public var reminders: NSSet?
}

extension MyList: Identifiable {

}

extension MyList {
  
  @objc(addRemindersObject:)
  @NSManaged public func addToReminders(_ value: Reminder)
  
  @objc(removeRemindersObject:)
  @NSManaged public func removeFromReminders(_ value: Reminder)

  @objc(addReminders:)
  @NSManaged public func addToReminders(_ value: NSSet)

  @objc(removeReminders:)
  @NSManaged public func removeFromReminders(_ value: NSSet)

}
