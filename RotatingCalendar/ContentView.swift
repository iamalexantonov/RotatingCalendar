//
//  ContentView.swift
//  RotatingCalendar
//
//  Created by Alexey Antonov on 03/09/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isUp = true
    @State private var sheetRotation = 0.0
    
    var body: some View {
        Sheet(isUp: isUp)
        .rotation3DEffect(Angle(degrees: sheetRotation),axis: (x: 1.0, y: 0.0, z: 0.0))
        .onTapGesture {
            withAnimation {
                sheetRotation += 180.0
                isUp.toggle()
            }
        }
        .padding()
    }
}

struct Sheet: View {
    let isUp: Bool
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                VStack {
                    Text("3")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                    Text("сентября")
                        .font(.title)
                        .foregroundColor(.red)
                }.rotation3DEffect(Angle(degrees: isUp ? 0 : 180), axis: (x: 1.0, y: 0.0, z: 0.0))
                Spacer()
            }
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
