//
//  AddressView.swift
//  CupCake Corner
//
//  Created by Ifeoluwa Lawal on 3/4/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zipcode", text: $order.zipcode)
            }
            
            Section {
                NavigationLink("Check out") {
                    CheckoutView(order: order)
                }
                .disabled(order.hasValidAddress == false)
            }
        }
        .navigationTitle("Address Page")
        .navigationBarTitleDisplayMode(.inline)
    }
}

@available(iOS 17.0, *)
#Preview {
    AddressView(order: Order())
}
