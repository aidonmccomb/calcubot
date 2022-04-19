//
//  DropDowns.swift
//  calcubot
//
//  Created by Student on 2022-04-19.
//

import SwiftUI

enum ChainTypes {
    case twentyfive
    case twentyfiveH
    case thirtyfive
}

struct DropDowns: View {
    @State var selCont: ChainTypes = .twentyfive
    var body: some View {
        NavigationView {
            Picker("My Key", selection: $selCont) {
                Text("25").tag(ChainTypes.twentyfive)
                Text("25H").tag(ChainTypes.twentyfiveH)
                Text("35").tag(ChainTypes.thirtyfive)
            }.pickerStyle(.menu)
        }
    }
}

struct DropDowns_Previews: PreviewProvider {
    static var previews: some View {
        DropDowns()
    }
}
