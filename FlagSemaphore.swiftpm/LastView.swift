//
//  LastView.swift
//  FlagSemaphore
//
//  Created by Nyoman Adiwinanda on 20/04/23.
//

import SwiftUI

struct LastView: View {
    @Binding var page: Int
    @State private var fadeInOut = false
    
    var body: some View {
        VStack {
            Text("Thank you!")
                .font(.system(size: 50))
                .fontWeight(.semibold)
                .padding(.bottom, 10)
                .foregroundColor(.black)
            
            Text("I hope you explore something new today")
                .font(.system(size: 32))
                .padding(.bottom, 40)
                .foregroundColor(.black)
            
            Button {
                page = 4
            } label: {
                Spacer()
                Text("Simulate Again").font(.system(size: 40)).bold()
                Spacer()
            }
            .frame(width: 320)
            .padding(5)
            .background(Color(red: 64 / 255, green: 144 / 255, blue: 60 / 255))
            .cornerRadius(15)
            .foregroundStyle(.white)
            .padding(.bottom, 30)
            
            Button {
                withAnimation {
                    page = 1
                }
            } label: {
                Spacer()
                Text("Finish").font(.system(size: 40)).bold()
                Spacer()
            }
            .frame(width: 320)
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

struct LastView_Previews: PreviewProvider {
    static var previews: some View {
        LastView(page: .constant(6))
    }
}
