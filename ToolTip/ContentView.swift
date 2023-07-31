//
//  ContentView.swift
//  ToolTip
//
//  Created by Piyush Singh on 29/07/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var obj : TooltipViewModel
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .environmentObject(obj)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
