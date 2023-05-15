//
//  InfoView.swift
//  ZapFitness
//
//  Created by Victor Garitskyu on 08.05.2023.
//

import SwiftUI

struct InfoView: View {
    @State private var currentIndex = 0
    @State private var isAnimating = false
    @State private var showForm = false
    
    let images = ["info1", "info2", "info3"]
    let texts = [
        "«Спортсмен не может бежать с деньгами в карманах. Он должен бежать с надеждой в сердце и мечтами в голове».",
        "«Стойкость может превратить неудачу в необычное достижение».",
        "«Вы должны ожидать от себя результатов, прежде чем сможете их достичь»."
    ]
    
    var buttonText: String {
        if currentIndex == images.count - 1 {
            return "go to Zap"
        } else {
            return "next"
        }
    }
    
    var body: some View {
        ZStack {
          

            Image(images[currentIndex])
                .resizable()
                .scaledToFill()
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .black]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .edgesIgnoringSafeArea(.all)
            AnimatedBackgroundView()
                .edgesIgnoringSafeArea(.all)
            
            
            
            VStack {
                Spacer()
                    Image("zap_logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 6, height: 23)
                        .animation(.easeInOut(duration: 0.3))
                        .colorInvert()
                    Text(texts[currentIndex])
                        .font(.title2)
                        .lineLimit(4)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .padding(10)
                        .transition(.opacity)
                ImageSelectionControl(selectedIndex: currentIndex, count: images.count)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                Button(buttonText) {
                    if currentIndex == images.count - 1 {
                        self.showForm = true
                    } else {
                        withAnimation {
                            self.animateImage()
                        }
                    }
                }
                .font(.custom("NoizeSportFreeVertion-Regular", size: 20))
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width - 50)
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .textCase(.uppercase)
                .background(Color.white)
                .cornerRadius(30)
                .padding(.bottom, 45)
                .transition(.opacity)

            }
        }
        .animation(.easeInOut(duration: 0.3), value: currentIndex)
        .fullScreenCover(isPresented: $showForm) {
                  withAnimation(.easeInOut(duration: 0.3)) { // Добавлен withAnimation для плавного открытия
                      CustomTabBar()
                  }
              }
    }
    
    func animateImage() {
        isAnimating = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation {
                self.currentIndex += 1
                self.isAnimating = false
            }
        }
    }
}


struct ImageSelectionControl: View {
    let selectedIndex: Int
    let count: Int
    
    var body: some View {
        HStack {
            ForEach(0..<count) { index in
                Circle()
                    .fill(index == selectedIndex ? Color.orange : Color.gray)
                    .frame(width: 10, height: 10)
                    .padding(.horizontal, 5)
            }
        }
    }
}




