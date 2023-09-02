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
            Spacer()
            Form {
                    Picker("Target Element", selection: $viewModel.parameters.selectedTargetElement) {
                        Text("Button 1").tag("Button 1")
                        Text("Button 2").tag("Button 2")
                        Text("Button 3").tag("Button 3")
                        Text("Button 4").tag("Button 4")
                        Text("Button 5").tag("Button 5")
                        Spacer()
                    }
                    TextField("Tooltip Text", text: $viewModel.parameters.tooltipText)
                    
                    HStack {
                        Text("Text Size:")
                        TextField("Text Size", value: $viewModel.parameters.textSize, formatter: NumberFormatter())
                        Spacer()
                        Text("Padding:")
                        TextField("Padding", value: $viewModel.parameters.padding, formatter: NumberFormatter())
                    }
                    
                    ColorPicker("Text Color", selection: $viewModel.parameters.textColor)
                    ColorPicker("Background Color", selection: $viewModel.parameters.backgroundColor)
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
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: $viewModel.isSecondScreenPresented) {
                SecondScreenView()
                    .environmentObject(viewModel)
            }
            .edgesIgnoringSafeArea(.all)
            .onChange(of: viewModel.parameters.selectedTargetElement) { newValue in
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
