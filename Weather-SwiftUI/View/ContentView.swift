//
//  ContentView.swift
//  Weather-SwiftUI
//
//  Created by Sinbad on 23/1/20.
//  Copyright © 2020 Sinbad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weather = CurrentWeatherModelView()
    
    var body: some View {
        VStack {
            Text("\(weather.current?.name ??  " not found" )")
            Text("\(weather.current?.base ?? "" )")
            Text("\(weather.current?.weather?.last?.main ?? "" )")
            Text("\(weather.current?.weather?.last?.weatherDescription ?? "" )")
            Text("\(weather.current?.main?.temp ?? 0 )")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
