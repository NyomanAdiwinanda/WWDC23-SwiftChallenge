//
//  FrontView.swift
//  FlagSemaphore
//
//  Created by Nyoman Adiwinanda on 16/04/23.
//

import SwiftUI

struct FrontView: View {
    @State private var textInput: String = ""
    @Binding var page: Int
    
    var body: some View {
        VStack(spacing: 50) {
            Image("fs_icon")
                .resizable()
                .scaledToFit()
            
            Button {
                withAnimation {
                    page = 2
                }
            } label: {
                Spacer()
                Text("Explore").font(.system(size: 40)).bold()
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
        
    }
}

struct FrontView_Previews: PreviewProvider {
    static var previews: some View {
        FrontView(page: .constant(1))
    }
}
