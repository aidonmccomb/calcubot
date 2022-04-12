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
                ForEach(0..<5) { i in
                    MyButton(index: i, callBack: onPress(index:))
                }
                
                NavigationLink(destination: Text("Nav View")) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.red)
                        .frame(width: 100, height: 100).padding()
                    
                }
                NavigationLink(destination: GearRatio(MyVar: "Display")){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green)
                        .frame(width: 100, height: 100).padding()
                    
                }
                NavigationLink(destination: ThreeByThree()){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.purple)
                        .frame(width: 100, height: 100).padding()
                }
                NavigationLink(destination: MenuScreen()){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.yellow)
                        .frame(width: 100, height: 100).padding()
                }
            }
            .sheet(isPresented: $isPresented) {
                Text("Modal View")
            }
            .navigationTitle("Calcubot")
            .navigationBarTitleDisplayMode(.inline)
            navigationBarTitleDisplayMode(.large)
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
            ZStack(){
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(width:100, height: 100).padding()
                Text("\(index)")
                    .foregroundColor(Color.orange)
            }
        }
    }
}

struct GearRatio: View {
    var MyVar: String
    
    var body: some View {
        Image("GearScreen")
            .resizable()
    }
}

struct ThreeByThree: View {
    let columns = Array(repeating: GridItem(.flexible(minimum: 100, maximum: 100)), count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(0..<9) { i in
                Circle()
                    .fill(Color.black)
                    .frame(width:100, height: 100).padding()
            }
        }
    }
}

struct MenuScreen: View {
    var myMask: some View {
        Circle()
            .stroke(Color.black, lineWidth:50)
    }
    
    var body: some View {
        ZStack(){
            Circle()
                .fill(Color.orange)
                .frame(width: 250, height: 250)
                .mask(myMask)
            Text("Donut")
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

