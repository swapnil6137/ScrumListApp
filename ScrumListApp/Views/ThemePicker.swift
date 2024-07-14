//
//  ThemePicker.swift
//  TaskAsyncLetExample
//
//  Created by Swapnil Shinde on 14/07/24.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection : Theme
    
    var body: some View {
        Picker("Theme", selection: $selection){
            ForEach(Theme.allCases){ theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
            .listRowSeparator(.visible, edges: .all)
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    ThemePicker(selection: .constant(.periwinkle))
}
