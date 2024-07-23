//
//  PreviewProvider.swift
//  weatherForecast
//
//  Created by Vladyslav Mi on 24.07.2024.
//

import Foundation


import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}


class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init(){ }
    
    let homeVM = HomeViewModel()
}
