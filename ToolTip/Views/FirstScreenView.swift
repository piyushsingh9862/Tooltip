//
//  FirstScreenView.swift
//  ToolTip
//
//  Created by Piyush Singh on 29/07/23.
//

// FirstScreenView.swift

import SwiftUI

struct FirstScreenView: View {
    
    @EnvironmentObject private var viewModel : TooltipViewModel
    
    var body: some View {
        
        VStack {
            Form {
                    Picker("Target Element", selection: $viewModel.parameters.selectedTargetElement) {
                        Text("Button 1").tag("Button 1")
                        Text("Button 2").tag("Button 2")
                        Text("Button 3").tag("Button 3")
                        Text("Button 4").tag("Button 4")
                        Text("Button 5").tag("Button 5")
                        // Add other target elements here
                        Spacer()
                    }
                    TextField("Tooltip Text", text: $viewModel.parameters.tooltipText)
                    //            Stepper("Text Size: \(Int(viewModel.parameters.textSize))", value: $viewModel.parameters.textSize, in: 12...30, step: 2)
                    
                    HStack {
                        Text("Text Size:")
                        TextField("Text Size", value: $viewModel.parameters.textSize, formatter: NumberFormatter())
                        Spacer()
                        Text("Padding:")
                        TextField("Padding", value: $viewModel.parameters.padding, formatter: NumberFormatter())
                    }
                    
                    ColorPicker("Text Color", selection: $viewModel.parameters.textColor)
                    ColorPicker("Background Color", selection: $viewModel.parameters.backgroundColor)
                    //            Stepper("Corner Radius: \(Int(viewModel.parameters.cornerRadius))", value: $viewModel.parameters.cornerRadius, in: 0...20)
                    HStack {
                        Text("Corner Radius:")
                        TextField("Corner Radius", value: $viewModel.parameters.cornerRadius, formatter: NumberFormatter())
                        Spacer()
                        Text("Tooltip Width:")
                        TextField("Tooltip Width", value: $viewModel.parameters.tooltipWidth, formatter: NumberFormatter())
                    }
                    .frame(height: 100)
                    
                    HStack {
                        Text("Arrow Width:")
                        TextField("Arrow Width", value: $viewModel.parameters.arrowWidth, formatter: NumberFormatter())
                        Spacer()
                        Text("Arrow Height:")
                        TextField("Arrow Height", value: $viewModel.parameters.arrowHeight, formatter: NumberFormatter())
                    }
                    
                    
                    Button("Render Tooltip") {
                        viewModel.renderTooltip()
                    }
                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
//                .frame(width: geometry.size.width, height: geometry.size.height)
                .sheet(isPresented: $viewModel.isSecondScreenPresented) {
                    SecondScreenView()
                        .environmentObject(viewModel)
                }
            .edgesIgnoringSafeArea(.all)
            .onChange(of: viewModel.parameters.selectedTargetElement) { newValue in
                viewModel.selectedBtn = newValue
    //            viewModel.inx  =
                viewModel.updateTooltipTargetElementIndex()
        }
        }
        
    }
    
    struct FirstScreenView_Previews: PreviewProvider {
        static var previews: some View {
            FirstScreenView()
                .environmentObject(TooltipViewModel())
        }
    }
}
