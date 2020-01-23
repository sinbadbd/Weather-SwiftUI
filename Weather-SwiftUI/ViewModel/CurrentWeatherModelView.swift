//
//  CurrentWeatherModelView.swift
//  Weather-SwiftUI
//
//  Created by Sinbad on 23/1/20.
//  Copyright © 2020 Sinbad. All rights reserved.
//

import SwiftUI
import Combine

class CurrentWeatherModelView: ObservableObject {
    @Published var current : Weather?
    
    init() {
        self.fetch()
    }
}


extension CurrentWeatherModelView {
    func fetch(_ city: String = "Rangpur") {
        API.fetchCurrentWeather(by: city) {
            self.current = $0
        }
    }
}
