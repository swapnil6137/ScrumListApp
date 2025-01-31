//
//  DetailEditView.swift
//  TaskAsyncLetExample
//
//  Created by Swapnil Shinde on 14/07/24.
//

import SwiftUI

struct DetailEditView: View {
   // @State private var scrum = DailyScrum.emptyScrum
    @Binding var scrum : DailyScrum
    @State private var newAttendeeName = ""
    var body: some View {
        Form{
            Section(header: Text("Meeting Information")) {
                TextField("Title", text: $scrum.title)
                HStack{
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $scrum.theme)
            }
            Section(header:  Text("Attendees")){
                ForEach(scrum.attendees){ attendee in
                    Text(attendee.name)
                }
                .onDelete(perform: { indexSet in
                    scrum.attendees.remove(atOffsets: indexSet)
                })
                HStack{
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                        
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    })
                    .disabled(newAttendeeName.isEmpty)
                    
                }
            }
        }
    }
}

#Preview {
    DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
}
