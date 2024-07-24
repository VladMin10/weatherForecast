//
//  weatherForecastApp.swift
//  weatherForecast
//
//  Created by Vladyslav Mi on 23.07.2024.
//

import SwiftUI
import SwiftfulRouting

@main
struct weatherForecastApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            RouterView{ _ in
                HomeView()
            }
            .environmentObject(vm)
//            NavigationView{
//                HomeView()
//                    .navigationBarHidden(true)
//            }
//            .environmentObject(vm)
        }
    }
}
