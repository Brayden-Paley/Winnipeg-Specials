//
//  Collapsible.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-05-07.
//

import SwiftUI

struct Collapsible<Content: View>: View {
    @State var label: () -> Text
    @State var content: () -> Content
    
    @State private var collapsed: Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(
                action: { self.collapsed.toggle() },
                label: {
                    HStack {
                        self.label().frame(alignment: .leading)
                        Spacer()
                        Image(systemName: self.collapsed ? "chevron.down" : "chevron.up")
                    }
                    .padding(.bottom, 1)
                    .background(Color.white.opacity(0.01))
                }
            )
            .buttonStyle(PlainButtonStyle())
            
            VStack(alignment: .leading) {
                self.content()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none, alignment: .leading)
            .clipped()
            .animation(collapsed ? .none : .easeOut)
            .transition(.slide)
        }.animation(collapsed ? .none : .easeOut)
    }
}



