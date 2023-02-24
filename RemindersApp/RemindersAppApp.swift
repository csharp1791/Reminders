//
//  RemindersAppApp.swift
//  RemindersApp
//
//  Created by Cliff Sharp on 2/22/23.
//

import SwiftUI

@main
struct RemindersAppApp: App {
  var body: some Scene {
    WindowGroup {
      HomeView()
        .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
    }
  }
}
