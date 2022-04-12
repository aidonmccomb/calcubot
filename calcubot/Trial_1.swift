//
//  Trial_1.swift
//  calcubot
//
//  Created by Student on 2022-04-07.
//

import SwiftUI

enum PresentedView: CaseIterable, CustomStringConvertible {
    var description: String {
        switch self {
        case .firstView : return "First"
        case .secondView : return "Two"
        case .thirdView : return "Three"
        case .fourthView : return "four"
        case .fifthView : return "five"
        }
    }
    
    case firstView, secondView, thirdView, fourthView, fifthView
}

struct Trial_1: View {
    @State var isPresented: Bool = false
    @State var selView: PresentedView?
    let columns = Array(repeating: GridItem(.flexible(minimum: 100, maximum: 100)), count: 3)
    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(PresentedView.allCases, id: \.description) { i in                   MyButton(index: i, callBack: onPress(index:))
                }
                
                NavigationLink(destination: Text("Nav View")) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.red)
                        .frame(width: 100, height: 100).padding()
                    
                }
                NavigationLink(destination: GearRatioScreen()){
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
            .sheet(isPresented: .init(get: {
                selView != nil
            }, set: { isShowing in
                if isShowing == false {
                    selView = nil
                }
            })) {
                switch selView {
                case .firstView? : CaseTestView()
                case .secondView? : Text("second screen")
                case .thirdView? : Text("3 screen")
                case .fourthView? : Text("4 screen")
                case .fifthView? : Text("5 screen")
                case nil : EmptyView()
                }
            }
            .navigationTitle("Calcubot")
            .navigationBarTitleDisplayMode(.inline)
            navigationBarTitleDisplayMode(.large)
        }.navigationViewStyle(.stack)
        
    }
    func onPress(index:PresentedView) {
        //isPresented = true
        selView = index
    }
}


struct MyButton <Context: CustomStringConvertible> : View {
    let index: Context
    let callBack: (Context) -> Void
    var body: some View {
        Button {
            callBack(index)
        } label: {
            ZStack(){
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(width:100, height: 100).padding()
                Text(index.description)
                    .foregroundColor(Color.orange)
            }
        }
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

struct CaseTestView: View {
    var body: some View {
        VStack(){
            Text("Input")
            Text("Output")
            Rectangle()
                .size(width: 200, height: 20)
                .fill(Color.green)
            Text("CALCULATE")
                .bold()
                .foregroundColor(Color.red)
        }
    }
}

struct Trial_1_Previews: PreviewProvider {
    static var previews: some View {
        Trial_1()
    }
}

