//
//  ErrorView.swift
//  ScrumListApp
//
//  Created by Swapnil Shinde on 17/07/24.
//

import SwiftUI

struct ErrorView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let errorWrapper : ErrorWrapper
    var body: some View {
        NavigationStack {
            VStack{
                Text("An Error has Occured")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
        .cornerRadius(16)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Dismiss"){
                    dismiss()
                }
            }
        }
        }
    }
}

struct ErrorView_Preview : PreviewProvider{
    
    enum SampleError : Error{
        case errorRequired
    }
    
    static var wrapper : ErrorWrapper{
        ErrorWrapper(error: SampleError.errorRequired, guidance: "You can safely ignore this Error")
    }
    
    
    static var previews: some View{
        ErrorView(errorWrapper: wrapper)
    }
    
    
}

