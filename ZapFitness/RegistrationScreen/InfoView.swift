//
//  InfoView.swift
//  ZapFitness
//
//  Created by Victor Garitskyu on 08.05.2023.
//

import SwiftUI

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

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
            VStack (alignment: .leading) {
                
                Button(action: {
                    UserDefaults.standard.set(false, forKey: "status")
                                   NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    }
                    .frame(width: 30, height: 30)
                    .background(Color.black.opacity(0.2))
                    .clipShape(Circle())
                }
                .padding(.leading, 12)
                Spacer()
                VStack{
                    Image("zap_logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 6, height: 23)
                        .animation(.easeInOut(duration: 0.3))
                    Text(texts[currentIndex])
                        .font(.title3)
                        .fontWeight(.light)
                        .lineLimit(4)
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .padding(10)
                        .padding(.bottom, 25)

                        .transition(.opacity)
                    VStack{
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
                        .background(.white.gradient)
                        .cornerRadius(30)
                        .padding(.bottom, 45)
                        .transition(.opacity)
                    }
                    .shadow(color: .purple.opacity(0.5), radius: 42)
                }
            }
        }
        .background{
            ZStack{
                Circle()
                    .fill(Color.purple.gradient.opacity(0.15))
                    .scaleEffect(1.7)
                    .offset(x: 0, y: -250)
                
                VStack{
                    Circle()
                        .fill(Color.purple.gradient.opacity(0.9))
                        .scaleEffect(1.6)
                        .offset(x: 0, y: -250)
                }
                Image(images[currentIndex])
                    .scaleEffect(2.1)
                    .offset(x: 0, y: -110)
                    .colorInvert()
                    .animation(.easeInOut(duration: 0.3))
                
              
                
            }
            .background(.white)
            .ignoresSafeArea()
        }

        .animation(.easeInOut(duration: 0.3), value: currentIndex)
        .fullScreenCover(isPresented: $showForm) {
                  withAnimation(.easeInOut(duration: 0.3)) {
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




