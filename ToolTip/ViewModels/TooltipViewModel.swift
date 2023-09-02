//
//  TooltipViewModel.swift
//  ToolTip
//
//  Created by Piyush Singh on 29/07/23.
//

import Combine
// TooltipViewModel.swift
import Foundation
import SwiftUI

class TooltipViewModel: ObservableObject {
    @Published var parameters = TooltipParameters()
    @Published var isSecondScreenPresented = false

    var selectedTargetElement: String {
        get { parameters.selectedTargetElement }
        set {
            parameters.selectedTargetElement = newValue
            updateTooltipTargetElementIndex()
        }
    }

    func renderTooltip() {
        isSecondScreenPresented = true
    }

    func updateTooltipTargetElementIndex() {
        switch selectedTargetElement {
        case "Button 1":
            parameters.tooltipTargetElementIndex = 0
        case "Button 2":
            parameters.tooltipTargetElementIndex = 1
        case "Button 3":
            parameters.tooltipTargetElementIndex = 2
        case "Button 4":
            parameters.tooltipTargetElementIndex = 3
        case "Button 5":
            parameters.tooltipTargetElementIndex = 4
        default:
            parameters.tooltipTargetElementIndex = 0
        }
    }

}
