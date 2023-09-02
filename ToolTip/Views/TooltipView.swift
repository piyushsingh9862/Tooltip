//
//  TooltipView.swift
//  ToolTip
//
//  Created by Piyush Singh on 29/07/23.
//

// TooltipView.swift

import SwiftUI



struct ArrowShape: Shape {
    var isArrowPointingUp: Bool // Add a parameter to control the arrow's direction
    
    // Define the path of the arrow shape within the given rectangle
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        
        if isArrowPointingUp { // If the arrow is pointing upwards
            path.move(to: CGPoint(x: width / 2, y: 0))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: width, y: height))
            path.closeSubpath()
        } else { // If the arrow is pointing downwards
            path.move(to: CGPoint(x: width / 2, y: height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: width, y: 0))
            path.closeSubpath()
        }
        
        return path
    }
}

struct TooltipView: View {
    let parameters: TooltipParameters

    var body: some View {
        ZStack(alignment: .top) {
            // Tooltip background with specified styling
            // Arrow at the top with specified width and height

            VStack {
                Text(parameters.tooltipText)
                    .font(.system(size: parameters.textSize))
                    .foregroundColor(parameters.textColor)
                    .padding()

                // If you want to support an image inside the tooltip, you can add it here
            }
            .background(parameters.backgroundColor)
            .cornerRadius(parameters.cornerRadius)
            .frame(width: parameters.tooltipWidth, height: parameters.tooltipHeight)
            .position(x: parameters.tooltipPosition.x + parameters.tooltipWidth / 2, y: parameters.tooltipPosition.y + parameters.tooltipHeight / 2)
            .overlay(
                ArrowShape(isArrowPointingUp: parameters.arrowPositionY < 620)
                            .fill(parameters.backgroundColor)
                            .frame(width: parameters.arrowWidth, height: parameters.arrowHeight)
                            .position(
                                x: parameters.tooltipPosition.x + parameters.tooltipWidth / 2,
                                y: parameters.arrowPositionY > 620 ?
                                    parameters.tooltipPosition.y - parameters.tooltipHeight + 177 :
                                    parameters.tooltipPosition.y + parameters.tooltipHeight - 77
                            )
                    )
        }

    }
}

struct TooltipView_Previews: PreviewProvider {
    static var previews: some View {
        TooltipView(parameters: TooltipParameters())
            .environmentObject(TooltipViewModel())
    }
}

