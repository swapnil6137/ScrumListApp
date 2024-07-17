//
//  MeetingTimerView.swift
//  ScrumListApp
//
//  Created by Swapnil Shinde on 17/07/24.
//

import SwiftUI

struct MeetingTimerView: View {
    let speakers : [ScrumTimer.Speaker]
    let theme : Theme
    
    private var currentSpeaker : String{
        speakers.first(where: {!$0.isCompleted})?.name ?? "Someone"
    }
    
    var body: some View {
       Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack{
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is Speaking")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay{
                ForEach(speakers){ speaker in
                    if speaker.isCompleted, let index = speakers.firstIndex(where: {$0.id == speaker.id}){
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                            .rotation(Angle(degrees: -90))
                            .stroke(theme.mainColor, lineWidth: 12)
                    }
                    
                }
            }
    }
}

var speaker : [ScrumTimer.Speaker] {
    [ScrumTimer.Speaker.init(name: "Pawan", isCompleted: true),ScrumTimer.Speaker.init(name: "Swapnil", isCompleted: false)]
}

#Preview {
    MeetingTimerView(speakers: speaker, theme: .yellow)
}
