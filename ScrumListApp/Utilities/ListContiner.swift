//
//  ListContiner.swift
//  ScrumListApp
//
//  Created by Swapnil Shinde on 15/07/24.
//

import Foundation
import SwiftUI


struct DisplayBoardCardLayout<Content: View>: View {
    @ViewBuilder var content: Content
    
    var body: some View {
       content
        .padding(EdgeInsets(top: 88, leading: 66, bottom: 22, trailing: 66))
    }
}
