//
//  ContentView.swift
//  Slots-Demo
//
//  Created by Володя Зверев on 6/9/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    var body: some View {
        NavigationView {
            SwiftUIView()
                
                .toolbar {
                            ToolbarItem(placement: .principal) {
                                HStack {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .font(.largeTitle)
                                    Text("Лототрон")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .font(.largeTitle)
                                }
                            }
                }
                .navigationBarItems(trailing: Button(action: {
                    showAlert = true
                }, label: {
                    Text("Купить")
                        .foregroundColor(.pink)
                        .bold()
                }))
                
                .popover(isPresented: $showAlert, content: {
                                SwiftUIView()
                            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
