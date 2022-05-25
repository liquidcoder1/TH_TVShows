// File: View+.swift
// Project: DistilledMovieApp

import Foundation
import SwiftUI

extension View {
    
    func fitImage() -> some View where Self == Image {
        self.resizable()
            .scaledToFit()
    }
    
    func navigationBarButton<Label: View>(_ accessibilityId: String, placement: ToolbarItemPlacement = .navigationBarTrailing, action: @escaping (() -> Void), label: (() -> Label)) -> some View{
        self.toolbar {
            ToolbarItem(placement: placement) {
                Button (action: action) {
                    label()
                }.accessibilityIdentifier(accessibilityId)
            }
        }
    }
}
