//
//  PreviewData.swift
//  RemindersApp
//
//  Created by Cliff Sharp on 2/24/23.
//

import Foundation
import CoreData

class PreviewData {
  
  static var myList: MyList {
    let viewContext = CoreDataProvider.shared.persistentContainer.viewContext
    let request = MyList.fetchRequest()
    return (try? viewContext.fetch(request).first) ?? MyList()
  }
  
}
