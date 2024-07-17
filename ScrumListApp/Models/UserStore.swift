//
//  UserStore.swift
//  ScrumListApp
//
//  Created by Swapnil Shinde on 17/07/24.
//

import Foundation
import SwiftUI

struct UserRecords {
    
}
struct Participants {
    
}
 
final class UserStore : ObservableObject{
    
    @Published var users : [UserRecords] = []
    
    func refresh() async {
        let participants = await fetchParticipants()
        let records = await fetchRecords(participants: participants)
        self.users = records
    }
    
    func fetchParticipants() async -> [Participants] { return []}
    func fetchRecords(participants : [Participants]) async -> [UserRecords] { return [] }
    
}
