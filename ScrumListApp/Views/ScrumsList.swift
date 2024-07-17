//
//  ScrumsList.swift
//  ScrumListApp
//
//  Created by Swapnil Shinde on 17/07/24.
//

import SwiftUI

struct ScrumsList: View {
    @Binding var scrums : [DailyScrum]
    var body: some View {
        List($scrums){ $scrum in
            NavigationLink(destination: DetailView(scrum: $scrum)) {
                CardView(scrum: scrum)
            }
            .listRowBackground(scrum.theme.mainColor)
        }
    }
}

#Preview {
    ScrumsList(scrums: .constant(DailyScrum.sampleData))
}
