//
//  MeetingView.swift
//  TaskAsyncLetExample
//
//  Created by Swapnil Shinde on 11/07/24.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    
    @Binding var scrum : DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    
    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    
   private func startScrum() {
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes,
                         attendees: scrum.attendees)
        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)
            player.play()
        }
        scrumTimer.startScrum()
    }
    
    private func endScrum() {
        scrumTimer.stopScrum()
        let newHistory = History(attendees: scrum.attendees)
        scrum.history.insert(newHistory, at: 0)
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius:  16.0)
                .fill(scrum.theme.mainColor)
            VStack{
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed,
                                  secondsRemaining: scrumTimer.secondsRemaining,
                                  theme: scrum.theme)
                
                MeetingTimerView(speakers: scrumTimer.speakers, theme: scrum.theme)
                
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .onAppear{
            startScrum()
        }
        .onDisappear{
            endScrum()
        }
        .navigationBarTitleDisplayMode(.inline)
            
    }
       
}

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
