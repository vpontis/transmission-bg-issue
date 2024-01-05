//
//  ContentView.swift
//  transmission-bg
//
//  Created by Victor Pontis on 1/5/24.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented = false
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button {
                isPresented.toggle()
            } label: {
                Text("OPEN")
            }

            Text("HI")
                .background(Color("Background"))
        }
        .modifier(
            LumaSheetModifier(
                detents: [.medium, .large],
                isPresented: $isPresented,
                backgroundColor: Color("Background"),
                backgroundMaterial: nil,
                destination: {
                    VStack {
                        Text("HI")
                        Text("OK")
                    }
                }
            )
        )
        .padding()
    }
}

#Preview {
    ContentView()
}
