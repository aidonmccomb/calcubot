//
//  UnitConScreen.swift
//  calcubot
//
//  Created by Student on 2022-04-13.
//

import SwiftUI

struct UnitConScreen: View {
    var body: some View {
        background()
        VStack(alignment: .center, spacing: 10) {
            Text("Unit Conersion").padding()
            Rectangle()
                .fill(Color.pink)
                .frame(width: 100, height: 100)
        }
        .background(Color.mint)
        
    }
}

struct UnitConScreen_Previews: PreviewProvider {
    static var previews: some View {
        UnitConScreen()
    }
}
