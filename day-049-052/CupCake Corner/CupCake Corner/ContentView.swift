//
//  ContentView.swift
//  CupCake Corner
//
//  Created by Ifeoluwa Lawal on 3/3/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct ContentView: View {
    @State private var order = Order()
    @State private var cakeSelectionNumber = 0
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    
                    }
                    Text("Cost of \(Order.types[order.type]) is: \(order.cakeCost, format: .currency(code: "USD"))")
                Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)

                }
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        
                        if (order.extraFrosting) {
                            Text("Extra frosting cost \(order.frostingCost, format: .currency(code: "USD")) per cake")
                        }
                        
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                        
                        if (order.addSprinkles) {
                            Text("Extra frosting cost \(order.sprinklesCost, format: .currency(code: "USD")) per cake")
                        }
                        
                    }
                    
                }
                
                Section {
                }
                
                Section {
                    NavigationLink("Delivery details") {
                        AddressView(order: order)
                    }
                }
            }
        }.navigationTitle("Cupcake Corner")
    }
}

@available(iOS 17.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
