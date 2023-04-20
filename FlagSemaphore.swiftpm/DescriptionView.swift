//
//  DescriptionView.swift
//  FlagSemaphore
//
//  Created by Nyoman Adiwinanda on 16/04/23.
//

import SwiftUI

struct DescriptionView: View {
    @Binding var page: Int
    @State private var index = 0
    @State private var firstPlay = true
    @State private var isPlay = false
    @State private var fadeInOut = false
    
    func playAnimation() -> Void {
        isPlay = true
        DispatchQueue.global(qos: .default).async {
            for letter in alphabets {
                if !isPlay {
                    withAnimation{
                        index = 0
                        firstPlay = false
                    }
                    break;
                }
                
                DispatchQueue.main.async {
                    withAnimation {
                        index = alphabets.firstIndex(of: String(letter).uppercased()) ?? 0
                    }
                }
                usleep(1000000)
            }
            withAnimation {
                index = 0
                isPlay = false
                firstPlay = false
            }
        }
    }
    
    func stopAnimation() -> Void {
        isPlay = false
    }
    
    var body: some View {
        VStack {
            if firstPlay {
                Text("See It For Youself")
                    .font(.system(size: 40))
                    .fontWeight(.semibold)
                    .padding(.leading)
                    .foregroundColor(.black)
                Text("Tap button below to see a demonstration of semaphore code from a through z")
                    .font(.system(size: 28))
                    .padding(.leading)
                    .padding(.bottom, 100)
                    .foregroundColor(.black)
            } else {
                Text("Nice!")
                    .font(.system(size: 40))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Text("You have just seen what the semaphore code look like, now try with your own letters")
                    .font(.system(size: 28))
                    .padding(.bottom, 100)
                    .foregroundColor(.black)
            }
            
            Text("\(alphabets[index])")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            HStack {
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
            }
            
            HStack {
                Button {
                    if isPlay {
                        stopAnimation()
                    } else {
                        playAnimation()
                    }
                } label: {
                    Spacer()
                    Text(isPlay ? "Stop" : "Simulate").font(.system(size: 40)).bold()
                    Spacer()
                }
                .frame(width: 250)
                .padding(5)
                .background(Color(red: 64 / 255, green: 144 / 255, blue: 60 / 255))
                .cornerRadius(15)
                .foregroundStyle(.white)
                
                Button {
                    withAnimation {
                        page = 4
                    }
                } label: {
                    Spacer()
                    Text("Next").font(.system(size: 40)).bold()
                    Spacer()
                }
                .frame(width: 250)
                .padding(5)
                .background(Color(
                    red: firstPlay ? 168 / 255 : 64 / 255,
                    green: firstPlay ? 168 / 255 : 144 / 255,
                    blue: firstPlay ? 168 / 255 : 60 / 255
                ))
                .cornerRadius(15)
                .foregroundStyle(.white)
                .padding(.leading, 20)
                .disabled(firstPlay)
            }
            
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

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(page: .constant(3))
    }
}
