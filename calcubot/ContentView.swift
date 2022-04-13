//
//  ContentView.swift
//  calcubot
//
//  Created by Student on 2022-04-12.
//

import SwiftUI

//Copy paste from online

//pls let me commit

struct ContentView: View {
    let columns = Array(repeating: GridItem(.flexible(minimum: 150, maximum: 200)), count: 2)
    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns, spacing: 10) {
                //Button 1
                NavigationLink(destination: GearRatioScreen()){
                    ZStack(){
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.pink)
                            .frame(width: 150, height: 150).padding()
                        Text("Caption").bold().italic().foregroundColor(Color.pink)
                            .colorInvert()
                    }
                }
                //Button 2
                NavigationLink(destination: ViewOne()){
                    ZStack(){
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.green)
                            .frame(width: 150, height: 150).padding()
                        Text("Title")
                            .foregroundColor(Color.blue)
                    }
                }
                //Button 3
                NavigationLink(destination: ViewTwo()){
                    ZStack(){
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.green)
                            .frame(width: 150, height: 150).padding()
                        Text("Title")
                            .foregroundColor(Color.blue)
                    }
                }
                //Button 4
                NavigationLink(destination: UnitConScreen()){
                    ZStack(){
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.green)
                            .frame(width: 150, height: 150).padding()
                        Text("Title")
                            .foregroundColor(Color.blue)
                    }
                }
                //Button 5
                NavigationLink(destination: Text("placeholder")){
                    ZStack(){
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.green)
                            .frame(width: 150, height: 150).padding()
                        Text("Title")
                            .foregroundColor(Color.blue)
                    }
                }
                //Button 6
                NavigationLink(destination: Text("placeholder")){
                    ZStack(){
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.green)
                            .frame(width: 150, height: 150).padding()
                        Text("Title")
                            .foregroundColor(Color.blue)
                    }
                }
            }
        }
        //Nav Bar
        .navigationBarTitle(Text("Calcubot").font(.subheadline), displayMode: .large)
    }
}

struct ViewOne: View{
    var myMask: some View {
        Circle()
            .stroke(Color.black, lineWidth:70)
    }
    var body: some View {
        VStack(){
            Circle()
                .fill(Color.red.opacity(0.5))
                .mask(myMask)
                .frame(width:200, height:200)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
        }
    }
}

struct ViewTwo: View {
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.mint)
                .frame(width: 200, height: 200)
                .mask{
                    Circle().size(width:100,height: 100)
                }
                .border(.blue)
            
            Circle()
                .fill(Color.yellow)
                .frame(width: 200, height: 200)
                .overlay(alignment: .center) {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 100, height: 100)
                        .blendMode(.destinationOut)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
