//
//  ReminderListView.swift
//  RemindersApp
//
//  Created by Cliff Sharp on 2/24/23.
//

import SwiftUI

struct ReminderListView: View {
  
  @State private var showReminderDetail: Bool = false
  let reminders: FetchedResults<Reminder>
  @State private var selectedReminder: Reminder?
  
  private func reminderCheckedChanged(reminder: Reminder, isCompleted: Bool) {
    var editConfig = ReminderEditConfig(reminder: reminder)
    editConfig.isCompleted = isCompleted
    
    do {
      let _ = try ReminderService.updateReminder(reminder: reminder, editConfig: editConfig)
    } catch {
      print(error)
    }
  }
  
  private func isReminderSelected(_ reminder: Reminder) -> Bool {
    selectedReminder?.objectID == reminder.objectID
  }
  
  var body: some View {
    VStack {
      List(reminders) { reminder in
        ReminderCellView(reminder: reminder, isSelected: isReminderSelected(reminder)) { event in
          switch event {
          case .onSelect(let reminder):
            selectedReminder = reminder
          case .onCheckedChange(let reminder, let isCompleted):
            reminderCheckedChanged(reminder: reminder, isCompleted: isCompleted)
          case .onInfo:
            showReminderDetail = true
          }
        }
      }
    }.sheet(isPresented: $showReminderDetail) {
      ReminderDetailView(reminder: Binding($selectedReminder)!)
    }
  }
}

/*
 struct ReminderListView_Previews: PreviewProvider {
 static var previews: some View {
 ReminderListView()
 }
 } */
