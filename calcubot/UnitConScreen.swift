//
//  UnitConScreen.swift
//  calcubot
//
//  Created by Student on 2022-04-13.
//

import SwiftUI

struct UnitConScreen: View {
    var myMask: some View {
        Circle()
            .stroke(Color.black, lineWidth:50)
    }
    
    var body: some View {
        LazyVStack(alignment: .center) {
            Text("Unit Conersion")
                .bold()
                .padding()
            Rectangle()
                .fill(Color.pink)
                .frame(width: 100, height: 100)
                .padding()
            Circle()
                .fill(Color.orange)
                .frame(width: 150, height: 150)
                .mask(myMask)
                .padding()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.cyan, .gray]), startPoint: .top, endPoint: .bottom))
    }
}

struct UnitConScreen_Previews: PreviewProvider {
    static var previews: some View {
        UnitConScreen()
    }
}
