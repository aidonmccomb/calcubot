//
//  EntryBoxes.swift
//  calcubot
//
//  Created by Student on 2022-04-19.
//

import SwiftUI

struct EntryBoxes: View {
    @State var Entry: String = ""
    @State var Dividened: String = ""
    @State var Divisor: String = ""
    @State var Quotient: String = ""
    
    func Calculator() {
        if let newDiv = Int(Dividened), let newSor = Int(Divisor) {
            Quotient = String(newDiv / newSor)
        }
    }
    
    var body: some View {
        
        VStack{
            TextField("Placeholder", text: $Entry)
            TextField("Placeholder", text: $Dividened)
            TextField("Placeholder", text: $Divisor)
            TextField("Placeholder", text: $Quotient)
            Button {
                Calculator()
            } label: {
                Text("Calculate")
            }

        }
    }
}

struct EntryBoxes_Previews: PreviewProvider {
    static var previews: some View {
        EntryBoxes()
    }
}
