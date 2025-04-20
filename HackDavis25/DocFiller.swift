
//
//  DocParser.swift
//  HackDavis25
//
//  Created by Manushri Rane on 4/20/25.
//

import SwiftUI
struct DocFiller: View {
    let blueCol = Color(red: 0.53, green: 0.70, blue: 0.93)
    let greenCol = Color(red: 0.729, green: 0.875, blue: 0.741)
    let darkBlueCol = Color(red: 0.25, green: 0.4, blue: 0.7)

        var body: some View {
            ZStack {
                darkBlueCol.ignoresSafeArea()
                VStack {
                    // White text at the top
                    Text("Your Finished Document")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.top, 50)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)
        
                        
                    
                    Image(.sampleform)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                        .padding(.top, 50)
                        .padding(.bottom, 50)
                    // White button at the bottom
                    Button(action: {
                        // Your button action here
                    }) {
                        Text("Save Document to Records")
                            .fontWeight(.bold)
                            .foregroundColor(darkBlueCol)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 50)
                }
            }
        }
}

#Preview {
    DocFiller()
}
