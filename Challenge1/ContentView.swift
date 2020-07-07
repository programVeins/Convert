//
//  ContentView.swift
//  Challenge1
//
//  Created by Sabesh Bharathi on 22/06/20.
//  Copyright © 2020 Sabesh Bharathi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var units = ["Kilometer", "Mile", "Meter", "Yard"]
    @State private var fu = 0
    @State private var fval = ""
    @State private var tu = 0
    @State private var tval = ""
    
    var calc: Double {
        //Convert to Meters
        var x : Double = 0.0
        let temp : Double = Double(fval) ?? 0
        var y : Double = 0.0
        
        switch fu {
            case 0:
                x = temp * 1000
                break
            case 1:
                x = temp * 1609.344
                break
            case 2:
                x = temp
                break
            case 3:
                x = temp * 0.9144
            default:
                break
        }
        
        switch tu {
            case 0:
                y = x * 0.001
                break
            case 1:
                y = x * 0.0006213712
                break
            case 2:
                y = x
                break
            case 3:
                y = x * 1.093613
                break
            default:
                break
        }
        
        return y
        
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Convert from")){
                    Picker("From", selection: $fu) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    TextField("Enter value", text: $fval)
                }
                
                Section(header: Text("Convert To")){
                    Picker("From", selection: $tu) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("Result: \(calc)")
                    
                }
            }
        .navigationBarTitle("Convert")
        }
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
