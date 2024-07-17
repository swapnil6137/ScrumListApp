//
//  ScrumsStackView.swift
//  ScrumListApp
//
//  Created by Swapnil Shinde on 17/07/24.
//

import SwiftUI

struct ScrumsStackView: View {
    
    @Binding var scrums : [DailyScrum]
     @Environment(\.scenePhase) private var scenePhase
     @State private var isPresentingNewScrumView = false
    
    let saveAction: () -> Void
    
    var body: some View {
        NavigationStack{
            ScrumsList(scrums: $scrums)
                .navigationTitle("Daily Scrum")
                .toolbar{
                    Button(action: {
                        isPresentingNewScrumView = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .accessibilityLabel("New Scrum")
                }
        }
        .sheet(isPresented: $isPresentingNewScrumView, content: {
            NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
        })
        .onChange(of: scenePhase, perform: { phase in
            if phase == .inactive{ saveAction() }
        })

    }
}

#Preview {
    ScrumsStackView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
