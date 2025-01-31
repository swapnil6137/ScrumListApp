//
//  ThemeView.swift
//  TaskAsyncLetExample
//
//  Created by Swapnil Shinde on 14/07/24.
//

import SwiftUI

struct ThemeView: View {
    let theme : Theme
    
    var body: some View {
        
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .multilineTextAlignment(.leading)
        
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .buttercup)
    }
}
