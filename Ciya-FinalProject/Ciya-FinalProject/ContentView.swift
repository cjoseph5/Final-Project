//
//  ContentView.swift
//  Ciya-FinalProject
//
//  Created by peter wi on 4/7/22.
//

import SwiftUI

struct Trapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path ()
        
        print(rect.minX, rect.maxX)
        print(rect.minY, rect.maxY)
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0.75 * rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: 0.25 * rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        return path
    }
}

struct ContentView: View {
    var body: some View {
        Trapezoid()
            .stroke(Color.black)
            .padding(50)
            
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
