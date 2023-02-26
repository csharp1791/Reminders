//
//  ReminderDetailView.swift
//  RemindersApp
//
//  Created by Cliff Sharp on 2/25/23.
//

import SwiftUI

struct ReminderDetailView: View {
  
  @Environment(\.dismiss) private var dismiss
  @Binding var reminder: Reminder
  @State var editConfig: ReminderEditConfig = ReminderEditConfig()
  
  var body: some View {
    NavigationView {
      VStack {
        List {
          Section {
            TextField("Title", text: $editConfig.title)
            TextField("Notes", text: $editConfig.notes ?? "")
          }
          
          Section {
            Toggle(isOn: $editConfig.hasDate) {
              Image(systemName: "calendar")
                .foregroundColor(.red)
            }
            
            if editConfig.hasDate {
              DatePicker("Select Date", selection: $editConfig.reminderDate ?? Date(), displayedComponents: .date)
            }
            
            Toggle(isOn: $editConfig.hasTime) {
              Image(systemName: "clock")
                .foregroundColor(.blue)
            }
            
            if editConfig.hasTime {
              DatePicker("Select Date", selection: $editConfig.reminderTime ?? Date(), displayedComponents: .hourAndMinute)
            }
          }
        }.listStyle(.insetGrouped)
      }.onAppear {
        editConfig = ReminderEditConfig(reminder: reminder)
      }
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text("Details")
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") {
            
          }
        }
        
        ToolbarItem(placement: .navigationBarLeading) {
          Button("Cancel") {
            dismiss()
          }
        }
        
      } //: TOOLBAR
    }
  }
}

struct ReminderDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ReminderDetailView(reminder: .constant(PreviewData.reminder))
  }
}
