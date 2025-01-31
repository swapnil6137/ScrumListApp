//
//  CardView.swift
//  TaskAsyncLetExample
//
//  Created by Swapnil Shinde on 11/07/24.
//

import SwiftUI

struct CardView: View {
    
    let scrum : DailyScrum
    @ScaledMetric( relativeTo: .headline)  var paddingWidth = 12
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack{
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minutes meeting")
                    .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        .padding(paddingWidth)
        .foregroundColor(scrum.theme.accentColor)
    }
}

struct CardView_Previews : PreviewProvider{
//#Preview {
    static var scrum = DailyScrum.sampleData[0]
    
    static var previews: some View{
        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 120))
    }
    
    
    
}
