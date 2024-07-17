//
//  ErrorWrapper.swift
//  ScrumListApp
//
//  Created by Swapnil Shinde on 17/07/24.
//

import Foundation

struct ErrorWrapper : Identifiable{
    
    let id : UUID
    let error : Error
    let guidance : String
    
    init(id: UUID = UUID(), error: any Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
    
    
    
}
