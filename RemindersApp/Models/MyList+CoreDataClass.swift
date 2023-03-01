//
//  MyList+CoreDataClass.swift
//  RemindersApp
//
//  Created by Cliff Sharp on 2/22/23.
//

import Foundation
import CoreData

@objc(MyList)
public class MyList: NSManagedObject {
  
  var remindersArray: [Reminder] {
    reminders?.allObjects.compactMap { ($0 as! Reminder) } ?? []
  }
}
