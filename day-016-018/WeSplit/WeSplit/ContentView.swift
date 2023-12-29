//
//  ContentView.swift
//  WeSplit
//
//  Created by Ifeoluwa Lawal on 12/27/23.
//

import SwiftUI
// Enter cost of check
// How many people are splitting
// Tip percentage

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    private var currency = Locale.current.currency?.identifier ?? "USD"
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        // calculate the total per person here
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: currency))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                        /*
                         ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                         */
                    }
                    .pickerStyle(.wheel)
                }
                
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: currency))
                }
                
                Section("Total amount") {
                    Text(grandTotal, format: .currency(code: currency))
                }
            }
            .navigationTitle("WeSplit!")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
