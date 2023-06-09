//
//  RemindersAppApp.swift
//  RemindersApp
//
//  Created by Cliff Sharp on 2/22/23.
//

import SwiftUI
import UserNotifications

@main
struct RemindersAppApp: App {

  init() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
      if granted {
        // notification is granted
      } else {
        // display message to the user
      }
    }
  }

  var body: some Scene {
    WindowGroup {
      HomeView()
        .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
    }
  }
}

