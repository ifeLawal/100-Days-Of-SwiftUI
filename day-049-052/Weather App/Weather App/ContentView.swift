//
//  ContentView.swift
//  Weather App
//
//  Created by Ifeoluwa Lawal on 3/4/24.
//


/*
interesting apis https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
 
 curl https://api.fiscaldata.treasury.gov/services/api/fiscal_service/v2/accounting/od/avg_interest_rates\?sort\=-record_date
 

 curl -XGET 'https://tradestie.com/api/v1/apps/reddit'
 
curl https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&appid=

 key= ba79963bf3d8558f9bead3a166b1b34a
 
 https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&appid=ea6cf8ed6924aa6c0f4f0d01e0edf0b6
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
