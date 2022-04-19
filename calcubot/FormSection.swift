//
//  FormSection.swift
//  calcubot
//
//  Created by Student on 2022-04-13.
//

import SwiftUI

struct FormSection: View {
    var body: some View {
        Form {
            Section {
                Text("Hello, World!")
                Rectangle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.pink, .black]), startPoint: .topLeading, endPoint: .bottomTrailing))
            }
            Section {
                Text("New Section")
                Rectangle()
                    .fill(Color.mint)
            }
        }
    }
}

struct FormSection_Previews: PreviewProvider {
    static var previews: some View {
        FormSection()
    }
}
