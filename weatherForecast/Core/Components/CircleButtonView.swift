//
//  LongTermForecastButton.swift
//  weatherForecast
//
//  Created by Vladyslav Mi on 23.07.2024.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName : String
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50,height: 50)
            .background(
                Circle()
                    .stroke(lineWidth: 1)
                    .foregroundColor(Color.theme.accent)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.4),
                radius: 10, x: 0, y:0)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleButtonView(iconName : "info")
                .previewLayout(.sizeThatFits)
            
        }
    }
}
