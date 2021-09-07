//
//  CardView.swift
//  Slots-Demo
//
//  Created by Володя Зверев on 6/9/21.
//

import SwiftUI

struct CardView: View {
    @GestureState private var isDetectingPress = false
    @Binding var symbol: String
    @Binding var background: Color
    private let transition: AnyTransition = AnyTransition.move(edge: .bottom)
    
    var body: some View {
        VStack {
            if background == Color.green {
                if symbol == "Avocado" {
                    Image(symbol)
                        .resizable()
                        .padding(.all)
                        .aspectRatio(1, contentMode: .fit)
                        .transition(transition)
                        .animation(.spring(response: 0.7, dampingFraction: 0.3))
                    
                } else if symbol == "Сorn" {
                    Image(symbol)
                        .resizable()
                        .padding(.all)
                        .aspectRatio(1, contentMode: .fit)
                        .transition(transition)
                        .animation(.spring(response: 0.7, dampingFraction: 0.3))

                } else {
                    Image(symbol)
                        .resizable()
                        .padding(.all)
                        .aspectRatio(1, contentMode: .fit)
                        .transition(transition)
                        .animation(.spring(response: 0.7, dampingFraction: 0.3))
                }
            } else {
                if symbol == "Avocado" {
                    Image(symbol)
                        .resizable()
                        .padding(.all)
                        .aspectRatio(1, contentMode: .fit)
                        .transition(transition)
                    
                } else if symbol == "Сorn" {
                    Image(symbol)
                        .resizable()
                        .padding(.all)
                        .aspectRatio(1, contentMode: .fit)
                        .transition(transition)

                } else {
                    Image(symbol)
                        .resizable()
                        .padding(.all)
                        .aspectRatio(1, contentMode: .fit)
                        .transition(transition)
                }
            }
        }
        .background(background.opacity(0.5))
        .cornerRadius(20)

    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("Avocado"), background: Binding.constant(Color.green))
    }
}
