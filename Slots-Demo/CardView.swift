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
    
    var body: some View {
        Image(symbol)
            .resizable()
            .padding(.all)
            .aspectRatio(1, contentMode: .fit)
            .background(background.opacity(0.5))
            .cornerRadius(20)
            .scaleEffect(isDetectingPress ? 0.8 : 1)
            .animation(.easeIn)
                        .gesture(LongPressGesture(minimumDuration: 0.1).sequenced(before:DragGesture(minimumDistance: 0))
                            .updating($isDetectingPress) { value, state, _ in
                                switch value {
                                    case .second(true, nil):
                                        state = true
                                    default:
                                        break
                                }
                        })
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("Avocado"), background: Binding.constant(Color.green))
    }
}
