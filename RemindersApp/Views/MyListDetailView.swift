//
//  MyListDetailView.swift
//  RemindersApp
//
//  Created by Cliff Sharp on 2/24/23.
//

import SwiftUI

struct MyListDetailView: View {
  
  let myList: MyList
  
  @State private var openAddReminder: Bool = false
  @State private var title: String = ""
  
  private var isFormValid: Bool {
    !title.isEmpty
  }
  
  var body: some View {
    VStack {
      
      // display list of reminders
      
      HStack {
        Image(systemName: "plus.circle.fill")
        Button("New Reminder") {
          openAddReminder = true
        }
      }.foregroundColor(.blue)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }.alert("New Reminder", isPresented: $openAddReminder) {
      TextField("", text: $title)
      Button("Cancel", role: .cancel) {}
      Button("Done") {
        if isFormValid {
          do {
            try ReminderService.saveReminderToMyList(myList: myList, reminderTitle: title)
          } catch {
            print("save reminder error: \(error.localizedDescription)")
          }
        }
      }
    }
  }
}

struct MyListDetailView_Previews: PreviewProvider {
  static var previews: some View {
    MyListDetailView(myList: PreviewData.myList)
  }
}
