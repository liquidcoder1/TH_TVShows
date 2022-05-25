// File: ErrorView.swift
// Project: DistilledMovieApp

import SwiftUI

struct ErrorView: View {
    
    var message: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "xmark.circle.fill")
                .font(.title)
                .foregroundColor(.red)
            Text(message)
                .foregroundColor(.gray)
                .bold()
                .multilineTextAlignment(.center)
        }.padding(40)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: "Unknown error")
    }
}
