//
//  HomeView.swift
//  RemindersApp
//
//  Created by Cliff Sharp on 2/22/23.
//

import SwiftUI

struct HomeView: View {
  
  @FetchRequest(sortDescriptors: [])
  private var myListResults: FetchedResults<MyList>
  
  @FetchRequest(sortDescriptors: [])
  private var searchResults: FetchedResults<Reminder>
  
  @State private var search: String = ""
  @State private var isPresented: Bool = false
  @State private var searching: Bool = false
  
  private var reminderStatsBuilder = ReminderStatsBuilder()
  @State private var reminderStatsValues = ReminderStatsValues()
  
  var body: some View {
    NavigationStack {
      VStack {
        ScrollView {
          
          HStack {
            ReminderStatsView(icon: "calendar", title: "Today", count: reminderStatsValues.todayCount)
            ReminderStatsView(icon: "tray.circle.fill", title: "All", count: reminderStatsValues.allCount)
          }
          HStack {
            ReminderStatsView(icon: "calendar.circle.fill", title: "Scheduled", count: reminderStatsValues.scheduledCount)
            ReminderStatsView(icon: "checkmark.circle.fill", title: "Completed", count: reminderStatsValues.completedCount)
          }
          
          MyListsView(myLists: myListResults)
          
          //Spacer()
          
          Button {
            isPresented = true
          } label: {
            Text("Add List")
              .frame(maxWidth: .infinity, alignment: .trailing)
              .font(.headline)
          }.padding()
        }
      }
      .sheet(isPresented: $isPresented) {
        NavigationView {
          AddNewListView { name, color in
            do {
              try ReminderService.saveMyList(name, color)
            } catch {
              print(error)
            }
          }
        }
      }
      .listStyle(.plain)
      .onChange(of: search, perform: { searchTerm in
        searching = !searchTerm.isEmpty ? true: false
        searchResults.nsPredicate = ReminderService.getRemindersBySearchTerm(search).predicate
      })
      .overlay(alignment: .center, content: {
        ReminderListView(reminders: searchResults)
          .opacity(searching ? 1.0: 0.0)
      })
      .onAppear {
        reminderStatsValues = reminderStatsBuilder.build(myListResults: myListResults)
      }
      .padding()
      .navigationTitle("Reminders")
    }.searchable(text: $search)
    
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
      .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
  }
}
