//
//  CustomTabBar.swift
//  ZapFitness
//
//  Created by Victor Garitskyu on 07.05.2023.
//

import SwiftUI
import UIKit

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}


struct CustomTabBar: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                if selectedTab == 0 {
                    MainScreen()
                } else if selectedTab == 1 {
                    Text("Content for Tab 2")
                        .foregroundColor(.white)
                        .font(.custom("ArtegraSans-ExtraLightItalic", size: 36))
                } else if selectedTab == 2 {
                    Text("Content for Tab 3")
                        .foregroundColor(.white)
                } else {
                    Text("Content for Tab 4")
                        .foregroundColor(.white)
                }
            }
            .background(Color.clear.opacity(0.2))
            
            
            VStack {
                Spacer()
                HStack {
                    TabButton(imageName: "circle.grid.2x2.fill", isSelected: selectedTab == 0) {
                        selectedTab = 0
                    }
                    TabButton(imageName: "flame.fill", isSelected: selectedTab == 1) {
                        selectedTab = 1
                    }
                    TabButton(imageName: "trophy.fill", isSelected: selectedTab == 2) {
                        selectedTab = 2
                    }
                    TabButton(imageName: "baseball.diamond.bases", isSelected: selectedTab == 3) {
                        selectedTab = 3
                    }
                }
                .padding()
                .background(
                    VisualEffectView(effect: UIBlurEffect(style: .systemThickMaterialDark))
                        .cornerRadius(45)
                )
            }
            VStack{
                Spacer()
                HStack{
                    RunButton(imageName: "figure.run", isSelected: selectedTab == 5) {
                        selectedTab = 5
                    }
                }
                .padding(.bottom, 60)
            }
        }
        .ignoresSafeArea()
    }
}
struct VisualEffectView: UIViewRepresentable {
    let effect: UIVisualEffect
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: effect)
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = effect
    }
}

struct TabButton: View {
    var imageName: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 5) {
                Image(systemName: imageName)
                    .font(.system(size: 18))
                    .foregroundColor(isSelected ? .orange : .gray)
            }
            .padding(.top, 10)
            .padding(.bottom, 30)
            .frame(maxWidth: .infinity)
        }
    }
}


struct RunButton: View {
    var imageName: String
    var isSelected: Bool
    var action: () -> Void
    @State private var isAnimating = false
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 10) {
                Image(systemName: imageName)
                    .font(.system(size: 47))
                    .frame(width: 60, height: 60) // Размер кнопки
                    .foregroundColor(isSelected ? .white : .white)
                    .padding(10) // Отступ от картинки
                    .background(
                        ZStack {
                            Circle()
                                .stroke(Color.orange.opacity(0.5), lineWidth: 7) // Ширина рамки 7
                            Circle()
                                .trim(from: 0, to: isAnimating ? 1 : 0)
                                .stroke(
                                    AngularGradient(gradient: Gradient(colors: [.pink, .red]), center: .center),
                                    style: StrokeStyle(lineWidth: 7, lineCap: .round)
                                )
                                .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                            
                                .animation(Animation.easeInOut(duration: 2.0).repeatForever(), value: isAnimating)
                        }
                    )
                
            }
        }
        .background(Color.orange)
        .clipShape(Circle())
        .onAppear {
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: true)) {
                isAnimating = true
            }
        }
        .shadow(color: .gray.opacity(0.5), radius: 16, x: 0, y: 2)
        
    }
}




