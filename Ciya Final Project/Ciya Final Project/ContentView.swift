//
//  ContentView.swift
//  Ciya Final Project
//
//  Created by Ciya Joseph on 4/15/22.
//

import SwiftUI

struct StockCell: Identifiable {
    var id = UUID()
    
    var abrv: String
    var company: String
    var price: String
    var change: String
    var graph: String
}

struct StockRow: View {
    var stockCell: StockCell
    
    var body: some View {
        HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(stockCell.abrv)
                        .font(.system(size:20, weight: .bold))
                    Text(stockCell.company).font(.subheadline).foregroundColor(.gray)
                        .frame(width: 100, height: 10, alignment: .center)
                }
                Spacer()
            Image(stockCell.graph)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 70)
                Spacer()
            VStack (alignment: .trailing){
                Text(stockCell.price)
                Text(stockCell.change)
                    .frame(maxWidth: 70, maxHeight: 20)
                    .background(stockCell.graph == "redgraph" ? Color.red: Color.green)
                }
            }
        }
    }


struct ContentView: View {
    @State private var showingSheet = false
    @State var searchText = ""
    @Environment(\.colorScheme) var colorScheme
    
    let stockRowsList = [
        StockCell(abrv: "SBUX", company: "Starbucks Corporation", price: "80.17", change: "90.83B", graph: "redgraph"),
        StockCell(abrv: "CMG", company: "Chipotle Mexican Grill, Inc.", price: "1,612.58", change: "42.47B", graph: "redgraph"),
        StockCell(abrv: "NFLX", company: "Netflix, Inc.", price: "226.19", change: "96.95B", graph: "redgraph"),
        StockCell(abrv: "TMUS", company: "T-Mobile US, Inc.", price: "80.17", change: "165B", graph: "redgraph"),
        StockCell(abrv: "AMZN", company: "Amazon.com, Inc.", price: "3,079.96", change: "1.5T", graph: "greengraph"),
        StockCell(abrv: "Dow Jones", company: "Dow Jones Industrial Average", price: "80.17", change: "--", graph: "greengraph"),
        StockCell(abrv: "CRWD", company: "CrowdStrike Holdings, Inc.", price: "35,160.79", change: "48.43B", graph: "redgraph"),
        StockCell(abrv: "TSLA", company: "Tesla, Inc.", price: "1,008.78", change: "1.4T", graph: "greengraph"),
        StockCell(abrv: "WMT", company: "Walmart Inc.", price: "87.96", change: "439.9B", graph: "redgraph"),
        StockCell(abrv: "XOM", company: "Exxon Mobil Corporation", price: "87.96", change: "388.4B", graph: "redgraph")]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack {
                    titleBar()
                        .frame(maxWidth: 150, minHeight: 50)
                        .offset(y: 50)
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("LightGray"))
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search...", text: $searchText)
                    }
                    .foregroundColor(.gray)
                    .padding(.leading, 13)
                }
                .frame(height: 40)
                .cornerRadius(13)
                .padding()
                .offset(y: 40)
                List { ForEach(stockRowsList) { stockCell in NavigationLink(destination: DetailView(stockCell: stockCell)) {StockRow (stockCell: stockCell)
                            }
                        }.textCase(nil)
                        .listRowBackground(colorScheme == .dark ? Color.black: Color.white)
                    }.listStyle(GroupedListStyle())
                    .offset(y: 30)
            }
            .ignoresSafeArea()
        }
    }
}
    
struct titleBar: View {
    var title: String = "Stocks"
    var date: String = "April 24"
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text(title)
                    .font(.system(size: 30, weight: .heavy))
                Text(date)
                    .font(.system(size: 30, weight: .heavy))
                    .foregroundColor(.gray)
            }
        }
    }
}

struct DetailView: View {
    var stockCell: StockCell
    
    var body: some View {
        VStack {
            HStack {
                Text(stockCell.abrv)
                    .font(.title)
                    .padding()
                Text(stockCell.company)
            }
            Spacer()
            Image(stockCell.graph)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 350)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        }
    }
