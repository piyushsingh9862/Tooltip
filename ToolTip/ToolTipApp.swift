//
//  ToolTipApp.swift
//  ToolTip
//
//  Created by Piyush Singh on 29/07/23.
//

import SwiftUI

@main
struct ToolTipApp: App {
    
    @StateObject private var viewModel = TooltipViewModel()
    
    var body: some Scene {
        WindowGroup {
            FirstScreenView()
                .environmentObject(viewModel)
        }
    }
}
