//
//  MeetingFooterView.swift
//  ScrumListApp
//
//  Created by Swapnil Shinde on 16/07/24.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers : [ScrumTimer.Speaker]
    var skipAction: ()-> Void
    
    private var speakerName : Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    
    private var isLastSpeaker : Bool{
        return speakers.dropLast().allSatisfy{$0.isCompleted}
    }
    
    private var speakerText : String{
        guard let speakerName = speakerName else {
            return "No more speakers"
        }
        return "Speaker \(speakerName) of \(speakers.count)"
    }
    
    var body: some View {
        VStack {
            HStack{
                if isLastSpeaker {
                    Text("Last Speaker")
                }else {
                    
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction, label: {
                        Image(systemName: "forward.fill")
                    })
                    .accessibilityLabel("Next Speaker")
                }
            }
        }
        .padding([.bottom,.horizontal])
    }
}

struct MeetingFooterView_Preview : PreviewProvider{
    static var previews: some View{
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
