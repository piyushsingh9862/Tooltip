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
    
    var body: some View {
        GeometryReader { geometry in
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
//                                displayTooltip2(for: "Button 1", buttonIndex: 0, frame: buttonGeometry.frame(in: .global))
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
//                                displayTooltip2(for: "Button 2", buttonIndex: 1, frame: buttonGeometry.frame(in: .global))
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
//                                displayTooltip2(for: "Button 3", buttonIndex: 2, frame: buttonGeometry.frame(in: .global))
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
//                                    displayTooltip2(for: "Button 4", buttonIndex: 3, frame: buttonGeometry.frame(in: .global))
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
//                                    displayTooltip2(for: "Button 5", buttonIndex: 4, frame: buttonGeometry.frame(in: .global))
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
        .onAppear{
           
            print("Onappear \(viewModel.parameters.selectedTargetElement) \(viewModel.parameters.tooltipTargetElementIndex)")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    displayTooltip2(for: viewModel.parameters.selectedTargetElement, buttonIndex: viewModel.parameters.tooltipTargetElementIndex)
            }
//            displayTooltip3(for: viewModel.parameters.selectedTargetElement,viewModel.parameters.tooltipTargetElementIndex)
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
        
//        let tooltipX = min(max(targetCenter.x - viewModel.parameters.tooltipWidth / 2, 0), geometry.size.width - viewModel.parameters.tooltipWidth)
//        let tooltipY = min(max(targetCenter.y, 0), geometry.size.height - viewModel.parameters.tooltipHeight)

//        viewModel.parameters.tooltipPosition = CGPoint(x: tooltipX, y: tooltipY)
        
        viewModel.parameters.selectedTargetElement = targetElement
        
    }
    

    
    private func displayTooltip(for targetElement: String, buttonIndex: Int, geometry: GeometryProxy) {
        guard buttonIndex >= 0, buttonIndex < buttonFrames.count else {
            return
        }
        
        let targetFrame = buttonFrames[buttonIndex]
//        let targetCenter = CGPoint(x: targetFrame.midX, y: targetFrame.midY-40)
        
        let targetCenter = CGPoint(x: targetFrame.midX, y: targetFrame.midY)
        
        viewModel.parameters.tooltipPosition = CGPoint(x: targetCenter.x-100, y: targetCenter.y-40)

        viewModel.parameters.selectedTargetElement = targetElement

//        let tooltipX = min(max(targetCenter.x - viewModel.parameters.tooltipWidth / 2, 0), geometry.size.width - viewModel.parameters.tooltipWidth)
//        let tooltipY = min(max(targetCenter.y, 0), geometry.size.height - viewModel.parameters.tooltipHeight)

//        viewModel.parameters.tooltipPosition = CGPoint(x: tooltipX, y: tooltipY)
    }
}



struct SecondScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreenView()
            .environmentObject(TooltipViewModel())
    }
}

