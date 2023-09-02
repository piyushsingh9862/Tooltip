//
//  SecondScreenView.swift
//  ToolTip
//
//  Created by Piyush Singh on 29/07/23.
//

// SecondScreenView.swift

import SwiftUI

struct SecondScreenView: View {
    @State private var buttonFrames: [CGRect] = Array(repeating: .zero, count: 5)
    
    
    @EnvironmentObject private var viewModel: TooltipViewModel
    
    var body: some View
    {
        GeometryReader
        { geometry in
            VStack {
                HStack {
                    Button("Button 1") {
                        displayTooltip(for: "Button 1", buttonIndex: 0, geometry: geometry)
                        print("btn1")
                    }
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)
                    .background(
                        GeometryReader { buttonGeometry in
                            Color.clear.onAppear {
                                updateButtonFrame(index: 0, frame: buttonGeometry.frame(in: .global))
                            }
                        }
                        )
                    
                    Spacer()
                    
                    Button("Button 2") {
                        print("btn2")
                        displayTooltip(for: "Button 2", buttonIndex: 1, geometry: geometry)
                    }
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)
                    .background(
                        GeometryReader { buttonGeometry in
                            Color.clear.onAppear {
                                updateButtonFrame(index: 1, frame: buttonGeometry.frame(in: .global))
                            }
                        })
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button("Button 3") {
                    displayTooltip(for: "Button 3", buttonIndex: 2, geometry: geometry)
                }
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(Color.gray)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)
                .background(
                        GeometryReader { buttonGeometry in
                            Color.clear.onAppear {
                                updateButtonFrame(index: 2, frame: buttonGeometry.frame(in: .global))
                            }
                        }
                    )
                .padding(.top)
                
                Spacer()
                
                HStack {
                    Button("Button 4") {
                        displayTooltip(for: "Button 4", buttonIndex: 3, geometry: geometry)
                    }
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)
                    .background(
                            GeometryReader { buttonGeometry in
                                Color.clear.onAppear {
                                    updateButtonFrame(index: 3, frame: buttonGeometry.frame(in: .global))
                                }
                            }
                        )
                    
                    Spacer()
                    
                    Button("Button 5") {
                        displayTooltip(for: "Button 5", buttonIndex: 4, geometry: geometry)
                    }
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)
                    .background(
                            GeometryReader { buttonGeometry in
                                Color.clear.onAppear {
                                    updateButtonFrame(index: 4, frame: buttonGeometry.frame(in: .global))
                                }
                            }
                        )
                }
                .padding(.horizontal)
            }
            .overlay(
                viewModel.parameters.selectedTargetElement != "" ?
                TooltipView(parameters: viewModel.parameters) : nil
            )
        }
        .onAppear {
           
            print("Onappear \(viewModel.parameters.selectedTargetElement) \(viewModel.parameters.tooltipTargetElementIndex)")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    displayTooltip2(for: viewModel.parameters.selectedTargetElement, buttonIndex: viewModel.parameters.tooltipTargetElementIndex)
            }
        }
    }
    
    private func updateButtonFrame(index: Int, frame: CGRect) {
        guard index >= 0, index < buttonFrames.count else {
            return
        }
        buttonFrames[index] = frame
    }
    
    private func displayTooltip2(for targetElement: String, buttonIndex: Int) {
     
        let targetFrame = buttonFrames[buttonIndex]
        
        let targetCenter = CGPoint(x: targetFrame.midX, y: targetFrame.midY)
        
        viewModel.parameters.tooltipPosition = CGPoint(x: targetCenter.x-100, y: targetCenter.y-40)

        if targetFrame.midY >= 790{ // For bottom buttons (Button 4 and Button 5)
            let tooltipX = targetFrame.midX - 100
            let tooltipY = targetFrame.midY - 170
            viewModel.parameters.arrowPositionY = tooltipY
            viewModel.parameters.tooltipPosition = CGPoint(x: tooltipX, y: tooltipY)
        } else { // For other buttons (Button 1, Button 2, and Button 3)
            let tooltipX = targetFrame.midX - 100
            let tooltipY = targetFrame.midY - 50
            viewModel.parameters.arrowPositionY = tooltipY
            viewModel.parameters.tooltipPosition = CGPoint(x: tooltipX, y: tooltipY)
        }

        viewModel.parameters.selectedTargetElement = targetElement
        
        viewModel.parameters.selectedTargetElement = targetElement
        
    }
    

    
    private func displayTooltip(for targetElement: String, buttonIndex: Int, geometry: GeometryProxy) {
        guard buttonIndex >= 0, buttonIndex < buttonFrames.count else {
            return
        }
        
        let targetFrame = buttonFrames[buttonIndex]
        

        
        if targetFrame.midY >= 790{ // For bottom buttons (Button 4 and Button 5)
            let tooltipX = targetFrame.midX - 100
            let tooltipY = targetFrame.midY - 170
            viewModel.parameters.arrowPositionY = tooltipY
            viewModel.parameters.tooltipPosition = CGPoint(x: tooltipX, y: tooltipY)
        } else { // For other buttons (Button 1, Button 2, and Button 3)
            let tooltipX = targetFrame.midX - 100
            let tooltipY = targetFrame.midY - 50
            viewModel.parameters.arrowPositionY = tooltipY
            viewModel.parameters.tooltipPosition = CGPoint(x: tooltipX, y: tooltipY)
        }

        viewModel.parameters.selectedTargetElement = targetElement
    }
}



struct SecondScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreenView()
            .environmentObject(TooltipViewModel())
    }
}

