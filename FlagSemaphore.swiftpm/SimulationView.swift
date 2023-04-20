//
//  SimulationView.swift
//  FlagSemaphore
//
//  Created by Nyoman Adiwinanda on 16/04/23.
//

import SwiftUI

struct SimulationView: View {
    @Binding var page: Int
    @Binding var textInput: String
    @State private var index = 0
    
    func createAnimation() -> Void {
        var prev = ""
        
        DispatchQueue.global(qos: .default).async {
            usleep(1000000)
            for letter in textInput {
                if prev == String(letter) {
                    DispatchQueue.main.async {
                        withAnimation {
                            index = 0
                        }
                    }
                    
                    usleep(250000)
                }
                
                DispatchQueue.main.async {
                    withAnimation {
                        index = alphabets.firstIndex(of: String(letter).uppercased()) ?? 0
                    }
                }
                prev = String(letter)
                usleep(1000000)
            }
            withAnimation {
                index = 0
                usleep(1000000)
                textInput = ""
                page = 6
            }
        }
    }
    
    var body: some View {
        VStack {
            Text(textInput)
                .font(.system(size: 50))
                .padding(.bottom, 100)
                .foregroundColor(.black)
            
            Text("\(alphabets[index])")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            HStack {
                Spacer()
                Image("left-hand")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.0, height: 300.0)
                    .offset(x: CGFloat(leftHand[index][0]), y: CGFloat(leftHand[index][1]))
                    .zIndex(2)
                    .rotationEffect(.degrees(CGFloat(leftHand[index][2])), anchor: .topTrailing)
                
                Image("body")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.0, height: 400.0)
                    .offset(y: -25)
                    .zIndex(1)
                
                Image("right-hand")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.0, height: 300.0)
                    .offset(x: CGFloat(rightHand[index][0]), y: CGFloat(rightHand[index][1]))
                    .rotationEffect(.degrees(CGFloat(rightHand[index][2])), anchor: .topLeading)
                    .zIndex(2)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 240 / 255, green: 240 / 255, blue: 255 / 255, opacity: 1))
        .onAppear() {
            withAnimation{
                createAnimation()
            }
        }
    }
}

struct SimulationView_Previews: PreviewProvider {
    static var previews: some View {
        SimulationView(page: .constant(5), textInput: .constant(""))
    }
}
