//
//  DetailsListView.swift
//  weatherForecast
//
//  Created by Vladyslav Mi on 23.07.2024.
//

import SwiftUI

struct DetailsListView: View {
    
    @EnvironmentObject private var vm : HomeViewModel
    let forecast : Forecast
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DetailsListView()
}
