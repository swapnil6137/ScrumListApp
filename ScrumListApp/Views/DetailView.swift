//
//  DetailView.swift
//  TaskAsyncLetExample
//
//  Created by Swapnil Shinde on 14/07/24.
//

import SwiftUI

struct DetailView: View {
   @Binding var scrum : DailyScrum
    
    @State private var editingScrum = DailyScrum.emptyScrum
    
    @State private var isPresentingEditView = false
    
    var body: some View {
        List{
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                    .foregroundColor(.accentColor)
                }
                HStack{
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack{
                    Label("Theme", systemImage: "paintpalette")
                }
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees){attendee in
                    Label(attendee.name, systemImage: "person")
                    
                }
            }
            
            Section(header: Text("History")) {
                if scrum.history.isEmpty{
                    Label("No meetings yet", systemImage: "calender.badge.exclamationmark")
                }
                ForEach(scrum.history){ history in
                    
                    HStack{
                        Image(systemName: "calender")
                        Text(history.date, style: .date)
                    }
                    
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar{
            Button("Edit"){
                isPresentingEditView = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isPresentingEditView, content: {
            NavigationStack{
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel"){
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done"){
                                isPresentingEditView = false
                                scrum = editingScrum
                            }
                        }
                    }
            }
            
        })
    }
}

#Preview {
    NavigationStack{
        DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
