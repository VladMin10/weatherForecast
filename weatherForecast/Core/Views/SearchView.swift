//
//  SearchView.swift
//  weatherForecast
//
//  Created by Vladyslav Mi on 23.07.2024.
//

import SwiftUI
import SwiftfulRouting

struct SearchView: View {
    
    @Environment(\.router) var router
    @State private var cityQuery: String = ""
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3291972876, green: 0.1469685733, blue: 0.8363620639, alpha: 1)), Color(#colorLiteral(red: 0.4434199929, green: 0.2367846966, blue: 0.8589765429, alpha: 1)), Color(#colorLiteral(red: 0.1819976866, green: 0.1189488247, blue: 0.2261904776, alpha: 1)), Color(#colorLiteral(red: 0.007843137719, green: 0.007843137719, blue: 0.007843137719, alpha: 1))]),
                startPoint: .topTrailing,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)

            VStack {
                SearchBarView(searchText: $cityQuery)
                
                Button(action: searchCity) {
                    Text("Search")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
    }
    
    private func searchCity() {
        let cityName = cityQuery.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !cityName.isEmpty else { return }
        
        vm.searchCity(cityName) { success in
            if success {
                router.dismissScreen()
            } else {
                print("Failed to load data for city: \(cityName)")
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView { _ in
            SearchView()
                .environmentObject(HomeViewModel())
        }
    }
}

