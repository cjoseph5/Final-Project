//
//  Ciya_Final_ProjectApp.swift
//  Ciya Final Project
//
//  Created by Ciya Joseph on 4/15/22.
//

import SwiftUI

@main
struct Ciya_Final_ProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
var body: some View {
    ZStack {
        HStack (alignment: .top){
            Text("9:00 PM")
                .position(x: 60, y: 25)
                .ignoresSafeArea()
            Image(systemName: "wifi")
                .position(x: 160, y: -25)
            Spacer()
            Image(systemName: "battery.75")
                .frame(maxWidth: 100, maxHeight: 40)
                .ignoresSafeArea()
        }
        HStack {
            VStack (alignment: .leading){
                Text("Stocks")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.black)
                Text("April 24")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.gray)
            }
            .position(x: 70, y: 40)
        }
    }
}
