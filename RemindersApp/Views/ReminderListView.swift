//
//  ReminderListView.swift
//  RemindersApp
//
//  Created by Cliff Sharp on 2/24/23.
//

import SwiftUI

struct ReminderListView: View {
  
  let reminders: FetchedResults<Reminder>
  
  var body: some View {
    List(reminders) { reminder in
      ReminderCellView(reminder: reminder)
    }
  }
}

/*
 struct ReminderListView_Previews: PreviewProvider {
 static var previews: some View {
 ReminderListView()
 }
 } */
