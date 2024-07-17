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
        if #available(iOS 16, *) {
            ScrumsStackView(scrums: $scrums, saveAction: saveAction) 
        }else {
            NavigationView{
                ScrumsList(scrums: $scrums)
            }
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
