//
//  ContentView.swift
//  SwiftUI-Views
//
//  Created by TIAN MBPR on 2021/4/25.
//

import SwiftUI

enum Pets: String {
  case pc = "pc"
  case mail = "mail"
  case car = "car"
  case wind = "wind"
}

struct ContentView: View {
  // MARK: - PROPERTIES
  @State private var name: String = "TY"
  @State private var pet: Pets = .pc
  @State private var swiftyColor: Color = .green
  @State private var swiftyOpacity: Double = 5
  @State private var stepperValue = 5

  // MARK: - BODY
  var body: some View {
    VStack {
      SwiftyControls(
        name: $name,
        swiftyColor: $swiftyColor,
        pet: $pet,
        swiftyOpacity: $swiftyOpacity,
        stepperValue: $stepperValue)
        
      
      Image(systemName: "\(pet.rawValue)")
        .resizable()
        .scaledToFit()
        .padding(20)
        .foregroundColor(swiftyColor)
        .opacity(swiftyOpacity)
        .frame(width: 240, height: 240, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
      
      Text("\(name) is \(pet.rawValue)")
        .foregroundColor(swiftyColor)
        .font(.title)
        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
    }
    .padding()
  }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SwiftyControls: View {
  @Binding var name: String
  @Binding var swiftyColor: Color
  @Binding var pet: Pets
  @Binding var swiftyOpacity: Double
  @Binding var stepperValue: Int

  var body: some View {
    VStack(spacing: 20) {
      //: MARK - TEXTFIELD
      HStack {
        Text("Name:")
          .font(.caption)
          .foregroundColor(Color.gray)
        TextField("Input your name", text: $name)
          .textFieldStyle(RoundedBorderTextFieldStyle())
      } //: HSTACK
      
      //: MARK - TEXTEDITOR
      TextEditor(text: $name)
        .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
      
      //: MARK - COLORPICKER
      ColorPicker("Color", selection: $swiftyColor)
      
      //: MARK - PICKER
      Picker("Picker", selection: $pet) {
        Text(Pets.pc.rawValue).tag(Pets.pc)
        Text(Pets.mail.rawValue).tag(Pets.mail)
        Text(Pets.car.rawValue).tag(Pets.car)
        Text(Pets.wind.rawValue).tag(Pets.wind)
      } //: PICKER
      .pickerStyle(SegmentedPickerStyle())
      .labelsHidden()
      .background(Color.gray)
      .cornerRadius(8)
      
      //: MARK - STEPPER
      //Stepper("Step: \(stepperValue)", value: $stepperValue)
      Stepper(value: $stepperValue, in: 1...5) {
        Text("Fire: \(stepperValue)")
          .fontWeight(.bold)
      }
      .padding(.horizontal)
      .background(Color(UIColor.systemIndigo))
      .cornerRadius(9)
      .foregroundColor(.white)
      
      HStack {
        ForEach(1...stepperValue, id: \.self) { stepperValue in
          Image(systemName: "flame.fill")
            .foregroundColor(swiftyColor)
            .font(.title)
        }
      }.frame(width: 300)
      
      //: MARK - SLIDER
      HStack {
        Text("0")
        Slider(value: $swiftyOpacity, in: 0...10, step: 1)
          .accentColor(swiftyColor)
        Text("10")
      } //: HSTACK
      
      Text("Opacity: \(swiftyOpacity)")
    }
  }
}
