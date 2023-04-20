//
//  InputView.swift
//  FlagSemaphore
//
//  Created by Nyoman Adiwinanda on 16/04/23.
//

import SwiftUI

struct InputView: View {
    @Binding var page: Int
    @Binding var textInput: String
    @State private var fadeInOut = false
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    VStack(alignment: .leading) {
                        Text("Input any letters to simulate it's semaphore code").font(.system(size: 30)).foregroundColor(.black)
                        HStack {
                            NeumorphicStyleTextField(textInput: $textInput, textField: TextField("Type some alphabetic letters", text: $textInput))
                        }
                    }
                    .padding()
                    .font(.system(size: 30))
                }
                
                Button {
                    withAnimation{
                        page = 5
                    }
                } label: {
                    Spacer()
                    Text("Simulate").font(.system(size: 40)).bold()
                    Spacer()
                }
                .frame(width: 250)
                .padding(5)
                .disabled(textInput.count == 0 ? true : false)
                .background(Color(
                    red: textInput.count == 0 ? 169/255 : 64 / 255,
                    green: textInput.count == 0 ? 169/255 : 144 / 255,
                    blue: textInput.count == 0 ? 169/255 : 60 / 255
                ))
                .cornerRadius(15)
                .foregroundStyle(.white)
            }
            
        }
        .padding(50)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarBackButtonHidden(true)
        .background(Color(red: 240 / 255, green: 240 / 255, blue: 255 / 255))
        .onAppear() {
            withAnimation(Animation.easeInOut(duration: 1.4)) {
                fadeInOut.toggle()
            }
        }
        .opacity(fadeInOut ? 1 : 0)
    }
}

extension Color {
    static let lightShadow = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    static let darkShadow = Color(red: 163 / 255, green: 177 / 255, blue: 198 / 255)
    static let background = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
}

struct NeumorphicStyleTextField: View {
    @Binding var textInput: String
    
    var textField: TextField<Text>
    var body: some View {
        HStack {
            textField
        }
        .padding()
        .foregroundColor(.black)
        .background(Color.background)
        .cornerRadius(6)
        .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
        .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
        .onChange(of: textInput) { newValue in
            if !(textInput.last?.isLetter ?? true || textInput.last?.isWhitespace ?? true) {
                textInput.removeLast()
            }
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(page: .constant(4), textInput: .constant(""))
    }
}
