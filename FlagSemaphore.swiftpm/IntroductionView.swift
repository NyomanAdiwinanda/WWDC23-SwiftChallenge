//
//  IntroductionView.swift
//  FlagSemaphore
//
//  Created by Nyoman Adiwinanda on 16/04/23.
//

import SwiftUI

struct IntroductionView: View {
    @Binding var page: Int
    @State private var fadeInOut = false
    
    var body: some View {
        VStack {
            VStack {
                Text("What is Flag Semaphore?")
                    .font(.system(size: 40))
                    .fontWeight(.semibold)
                    .padding(.leading)
                    .foregroundColor(.black)
            }
            .padding(.bottom, 20)
            
            VStack(alignment: .leading, spacing: 30) {
                
                Text("Flag semaphore is a method for sending signals or messages using simple tools, such as flags.")
                    .font(.system(size: 28))
                    .padding(.leading)
                    .foregroundColor(.black)
                
                Text("Semaphores are useful as a way to communicate remotely.")
                    .font(.system(size: 28))
                    .padding(.leading)
                    .foregroundColor(.black)
                
                Text("The goal is for scout members to be able to communicate from a long distance, even if they are camping in a place where the signal is difficult, such as in a mountain or in a remote village.")
                    .font(.system(size: 28))
                    .padding(.leading)
                    .foregroundColor(.black)
            }
            .padding(.bottom, 50)
            
            Button {
                withAnimation {
                    page = 3
                }
            } label: {
                Spacer()
                Text("Next").font(.system(size: 40)).bold()
                Spacer()
            }
            .frame(width: 250)
            .padding(5)
            .background(Color(red: 64 / 255, green: 144 / 255, blue: 60 / 255))
            .cornerRadius(15)
            .foregroundStyle(.white)
        }
        .padding(40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 240 / 255, green: 240 / 255, blue: 255 / 255, opacity: 1))
        .onAppear() {
            withAnimation(Animation.easeInOut(duration: 1.4)) {
                fadeInOut.toggle()
            }
        }
        .opacity(fadeInOut ? 1 : 0)
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView(page: .constant(2))
    }
}
