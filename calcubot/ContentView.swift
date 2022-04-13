//
//  ContentView.swift
//  calcubot
//
//  Created by Student on 2022-04-12.
//

import SwiftUI

extension View {
    @inlinable
    public func reverseMask<Mask: View>(
        alignment: Alignment = .center,
        @ViewBuilder _ mask: () -> Mask
    ) -> some View {
        self.mask {
            Rectangle()
                .overlay(alignment: alignment) {
                    mask()
                        .blendMode(.destinationOut)
                }
        }
    }
}

struct Polygon : Shape {
    var sides : Int = 5
    
    func path(in rect : CGRect ) -> Path{
        // get the center point and the radius
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = rect.width / 2
        
        // get the angle in radian,
        // 2 pi divided by the number of sides
        let angle = Double.pi * 2 / Double(sides)
        var path = Path()
        var startPoint = CGPoint(x: 0, y: 0)
        
        for side in 0 ..< sides {
            
            let x = center.x + CGFloat(cos(Double(side) * angle)) * CGFloat (radius)
            let y = center.y + CGFloat(sin(Double(side) * angle)) * CGFloat(radius)
            
            let vertexPoint = CGPoint( x: x, y: y)
            
            if (side == 0) {
                startPoint = vertexPoint
                path.move(to: startPoint )
            }
            else {
                path.addLine(to: vertexPoint)
            }
            
            // move back to starting point
            // needed for stroke
            if ( side == (sides - 1) ){
                path.addLine(to: startPoint)
            }
        }
        
        return path
    }
}

struct ContentView: View {
    let columns = Array(repeating: GridItem(.flexible(minimum: 150, maximum: 200)), count: 2)
    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns, spacing: 10) {
                //Button 1
                NavigationLink(destination: GearRatioScreen()){
                    ZStack(){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                        .frame(width: 150, height: 150).padding()
                    Text("Caption").foregroundColor(Color.pink)
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
                NavigationLink(destination: Text("placeholder")){
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
                .reverseMask{
                    
                }
        }
    }
}

struct ViewTwo: View {
    var body: some View {
        HStack {
            Color.yellow
                .frame(width: 200, height: 200)
                .mask {
                    Polygon(sides: 5)
                }
                .border(.red)
            
            Color.yellow
                .frame(width: 200, height: 200)
                .reverseMask {
                    Polygon(sides: 5)
                }
                .border(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
