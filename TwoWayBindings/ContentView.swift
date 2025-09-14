//
//  ContentView.swift
//  TwoWayBindings
//
//  Created by Eno Yoo on 9/14/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pressCount = 0
    @State private var toggleIsOn = true
    @State private var name = ""
    @State private var selectedColor: Color = .blue
    @State private var selectedDate = Date()
    @State private var stepperValue = 1
    @State private var sliderValue = 50.0
    
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Press Count: \(pressCount)")
                .padding()
                .animation(.interpolatingSpring, value: pressCount)
            
            Button("Press Me") {
                pressCount += 1
            }
            .buttonStyle(.glassProminent)
            
            Spacer()
            
            TextField("Enter a name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()
            Text("Name: \(name)")
            
            Spacer()
            
            Toggle("Toggle is \(toggleIsOn ? "on" : "off"):", isOn: $toggleIsOn)
                .toggleStyle(.switch)
                .padding()
            
            Spacer()
            
            Rectangle()
                .fill(selectedColor)
                .frame(width: 100, height: 100)
            
            ColorPicker("Pick a color:", selection: $selectedColor)
                .padding()
            
            Spacer()
            
            DatePicker("Date", selection: $selectedDate)
                .padding()
            Text("Selected Date is \(selectedDate.formatted(date: .abbreviated, time: .shortened))")
                .padding()
            
            Spacer()
            
            Stepper("Stepper value \(stepperValue)", value: $stepperValue, in: 1...10)
                .padding()
            
            Spacer()
            
            Slider(value: $sliderValue, in: 0...100) {
            } minimumValueLabel: {
                Image(systemName: "speaker.minus")
            } maximumValueLabel: {
                Image(systemName: "speaker.plus")
            }
            .padding()
            Text("Slider value: \(sliderValue.formatted(.number.precision(.fractionLength(1))))")
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
