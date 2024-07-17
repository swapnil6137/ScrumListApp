//
//  ScrumsView.swift
//  TaskAsyncLetExample
//
//  Created by Swapnil Shinde on 11/07/24.
//

import SwiftUI

struct ScrumsView: View {
    
   @Binding var scrums : [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    
    let saveAction: () -> Void
    
    var body: some View {
        NavigationStack{
            List($scrums){ $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .onAppear(perform: {
              print(binarySearch([12, 22, 45, 67, 96],67))
              print(sortAcending([12, 22, 45, 67, 96]))
                print(sortDecending([12, 22, 45, 67, 96]))
                print(getFibonnaci(3))
                
                
            })
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
        .onChange(of: scenePhase) { oldValue, newValue in
            
            if newValue == .inactive{ saveAction() }
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
