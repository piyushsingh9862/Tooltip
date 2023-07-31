//
//  ToolTipParameters .swift
//  ToolTip
//
//  Created by Piyush Singh on 29/07/23.
//

import Foundation
import SwiftUI

struct TooltipParameters {
    var selectedTargetElement: String = ""
    var tooltipTargetElementIndex: Int = 0
    var tooltipText: String = ""
    var textSize: CGFloat = 16.0
    var textColor: Color = .black
    var backgroundColor: Color = .yellow
    var cornerRadius: CGFloat = 8.0
    var tooltipWidth: CGFloat = 200.0
    var arrowWidth: CGFloat = 16.0
    var arrowHeight: CGFloat = 8.0
//    var tooltipPosition: CGPoint = .zero
    var tooltipPosition: CGPoint = CGPoint(x: -1000, y: -1000)
//    var tooltipPosition: CGPoint = CGPoint(x: 100, y: 300)
    var tooltipHeight: CGFloat = 100.0
    var padding: CGFloat = 8.0
   
}
