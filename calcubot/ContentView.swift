//
//  ContentView.swift
//  calcubot
//
//  Created by Student on 2022-04-07.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented: Bool = false
    let columns = Array(repeating: GridItem(.flexible(minimum: 100, maximum: 100)), count: 3)
    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<8) { i in
                    MyButton(index: i, callBack: onPress(index:))
                }
                
                NavigationLink(destination: Text("Nav View")) {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 100, height: 100).padding()
                }
            }
            .sheet(isPresented: $isPresented) {
                Text("Modal View")
            }
            .navigationTitle("Calcubot")
        }.navigationViewStyle(.stack)
        
    }
    func onPress(index:Int) {
        isPresented = true
    }
}

struct MyButton: View {
    let index: Int
    let callBack: (Int) -> Void
    var body: some View {
        Button {
            callBack(index)
        } label: {
            Rectangle()
                .fill(Color.blue)
                .frame(width:100, height: 100).padding()
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
