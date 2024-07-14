//
//  MeetingView.swift
//  TaskAsyncLetExample
//
//  Created by Swapnil Shinde on 11/07/24.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        ProgressView(value: 5, total: 15)
        HStack{
            VStack(alignment: .leading) {
                Text("Seconds Elaspsed")
                Label("300", systemImage: "hourglass.tophalf.fill")
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("Seconds Remaining")
                Label("600", systemImage: "hourglass.tophalf.fill")
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("10 minutes")
        Circle()
            .strokeBorder(lineWidth: 24)
        HStack{
            Text("Speaker 1 of 3")
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "forward.fill")
            })
            .accessibilityLabel("Next Speaker")
            
        }
        .padding()
    }
       
}

#Preview {
    MeetingView()
}
