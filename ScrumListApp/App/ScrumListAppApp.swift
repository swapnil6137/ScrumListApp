//
//  ScrumListAppApp.swift
//  ScrumListApp
//
//  Created by Swapnil Shinde on 14/07/24.
//

import SwiftUI

@main
struct ScrumListAppApp: App {
    @StateObject private var store = ScrumStore()
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums ){
                Task{
                    do{
                        try await store.save(scrums: store.scrums)
                    }catch{
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {
                do{
                    try await store.load()
                }catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
