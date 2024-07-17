//
//  ScrumListAppApp.swift
//  ScrumListApp
//
//  Created by Swapnil Shinde on 14/07/24.
//

import SwiftUI

@main
struct ScrumListAppApp: App {
    @State private var scrums = DailyScrum.sampleData
    
 
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums )
           
        }
    }
}
