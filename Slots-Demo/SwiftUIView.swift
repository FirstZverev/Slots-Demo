//
//  SwiftUIView.swift
//  Slots-Demo
//
//  Created by Володя Зверев on 7/9/21.
//

import SwiftUI

struct SwiftUIView: View {
    @State var symbols = ["Сorn", "Avocado", "Coconut cut"]
    @State private var numbers = Array(repeating: 0, count: 9)
    @State private var credints = 1000
    @State private var backgrounds = Array(repeating: Color.white, count: 9)
    @State private var win = false
    
    private var betAmount = 5
    
    var body: some View {
            ZStack {
                    // Background
                    Rectangle()
                        .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                        .ignoresSafeArea(.all)
                    Rectangle()
                        .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255
                        )).rotationEffect(Angle(degrees: 45))
                        .ignoresSafeArea(.all)
                    
                    VStack {
                        
                        Text("Очки: " + String(credints))
                            .foregroundColor(.black)
                            .padding(.all, 10)
                            .background(win ? Color.green.opacity(0.5): Color.white.opacity(0.5))
                            .animation(.none)
                            .cornerRadius(20)
                            .scaleEffect(win ? 1.2 : 1)
                            .animation(.spring(response: 0.7, dampingFraction: 0.3))
                        Spacer()
                        //MARK: Cards
                        VStack {
                            HStack {
                                Spacer()
                                
                                CardView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                                    .shadow(radius: 10)
                                
                                CardView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                                    .shadow(radius: 10)
                                
                                CardView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                                    .shadow(radius: 10)
                                
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                
                                CardView(symbol: $symbols[numbers[3]], background: $backgrounds[3])
                                    .shadow(radius: 10)
                                
                                CardView(symbol: $symbols[numbers[4]], background: $backgrounds[4])
                                    .shadow(radius: 10)
                                
                                CardView(symbol: $symbols[numbers[5]], background: $backgrounds[5])
                                    .shadow(radius: 10)
                                
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                
                                CardView(symbol: $symbols[numbers[6]], background: $backgrounds[6])
                                    .shadow(radius: 10)
                                
                                CardView(symbol: $symbols[numbers[7]], background: $backgrounds[7])
                                    .shadow(radius: 10)
                                
                                CardView(symbol: $symbols[numbers[8]], background: $backgrounds[8])
                                    .shadow(radius: 10)
                                
                                Spacer()
                            }
                        }
                        Spacer()
                        
                        HStack (spacing: 20) {
                            VStack {
                                Button(action: {
                                    self.processResults(false)
                                }, label: {
                                    Text("Играть")
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding(.all, 20)
                                        .padding([.leading, .trailing], 30)
                                        .background(Color.pink)
                                        .cornerRadius(20)
                                })
                                Text("\(betAmount) очков").padding(.top, 10)
                                    .font(.footnote)
                            }
                            
                            VStack {
                                Button(action: {
                                    self.processResults(true)
                                }, label: {
                                    Text("Играть MAX")
                                        .bold()
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white)
                                        .padding(.all, 20)
                                        .padding([.leading, .trailing], 30)
                                        .background(Color.pink)
                                        .cornerRadius(20)
                                })
                                Text("\(betAmount * 5) очков").padding(.top, 10)
                                    .font(.footnote)
                            }
                        }
                        
                        Spacer()
                }
                .animation(.easeOut)
                .onAppear {
                    guard let gotCredits = UserDefaults.standard.value(forKey: "Credits") else { return }
                    self.credints = gotCredits as! Int
                }
            }
    }
    func processResults(_ isMax: Bool = false) {
        //MARK: Set background to white
        self.backgrounds = self.backgrounds.map({ _ in
            Color.white
        })
        //MARK: Change the images
        if isMax {
            self.numbers = self.numbers.map({ _ in
                Int.random(in: 0...self.symbols.count - 1)
            })
        } else {
            self.numbers[3] = Int.random(in: 0...self.symbols.count - 1)
            self.numbers[4] = Int.random(in: 0...self.symbols.count - 1)
            self.numbers[5] = Int.random(in: 0...self.symbols.count - 1)
        }
        processWin(isMax)
    }
    func processWin(_ isMax: Bool = false) {
        var matches = 0
        
        if !isMax {
            if isMatch(3, 4, 5) { matches += 1 }
        } else {
            if isMatch(0, 1, 2) { matches += 1 }
            if isMatch(3, 4, 5) { matches += 1 }
            if isMatch(6, 7, 8) { matches += 1 }
            if isMatch(0, 4, 8) { matches += 1 }
            if isMatch(2, 4, 6) { matches += 1 }
        }
        self.win = false
        //final
        if matches > 0 {
            self.credints += matches * betAmount * 2
            self.win = true
        } else if !isMax {
            self.credints -= betAmount
        } else {
            self.credints -= betAmount * 5
        }
        UserDefaults.standard.set(self.credints, forKey: "Credits")
    }
    func isMatch(_ index1: Int, _ index2: Int,_ index3: Int) -> Bool {
        if numbers[index1] == numbers[index2] && numbers[index2] == numbers[index3] {
            self.backgrounds[index1] = Color.green
            self.backgrounds[index2] = Color.green
            self.backgrounds[index3] = Color.green
            return true
        }
        return false
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
