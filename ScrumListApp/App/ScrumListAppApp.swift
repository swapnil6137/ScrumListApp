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
    @State private var errorWrapper : ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums ){
                Task{
                    do{
                        try await store.save(scrums: store.scrums)
                    }catch{
                        errorWrapper = ErrorWrapper(error: error,
                                                    guidance: "Try again later.")
                       // fatalError(error.localizedDescription)
                    }
                }
            }
            .sheet(item: $errorWrapper){
                store.scrums = DailyScrum.sampleData
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
            .task {
                do{
                    try await store.load()
                }catch {
                    errorWrapper = ErrorWrapper(error: error, 
                                                guidance: "This will load sample data and continue")
                  //  fatalError(error.localizedDescription)
                }
            }
        }
    }
}
