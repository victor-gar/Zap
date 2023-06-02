//
//  UserInfoView.swift
//  ZapFitness
//
//  Created by Victor Garitskyu on 02.06.2023.
//

import Foundation
import SwiftUI

struct Content: View {
    @State private var age: Int?
    @State private var height: Double?
    @State private var weight: Double?
    @State private var currentWindow = 0
    @State private var showForm = false

    var body: some View {
            ZStack {
                VStack {
                    
                    
                    Spacer()
                    
                    if currentWindow == 0 {
                        AgeSelectionView(age: $age)
                    } else if currentWindow == 1 {
                        HeightSelectionView(height: $height)
                    } else if currentWindow == 2 {
                        WeightSelectionView(weight: $weight)
                    }
                    
                    Spacer()
                    
                    ProgressView(value: Double(currentWindow + 1) / 3)
                        .progressViewStyle(LinearProgressViewStyle())
                                            .colorInvert()
                                            .foregroundColor(.white)
                                            .border(.orange, width: 1)
                                            .frame(width: UIScreen.main.bounds.width - 40)
                    Button(action: {
                        currentWindow += 1
                        if currentWindow > 2{
                            self.showForm = true
                        }
                    })
                    {
                        Text("Next")
                            .font(.custom("NoizeSportFreeVertion-Regular", size: 20))
                            .foregroundColor(.black)
                            .frame(width: UIScreen.main.bounds.width - 50)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .textCase(.uppercase)
                            .background(Color.white)
                            .cornerRadius(30)
                            .transition(.opacity)
                    }
                    .padding()
                    .disabled(currentWindow > 2)
                    
                    Text("*Для дальнейшего пользования программой нужно заполнить ваши данные")
                    .font(.subheadline)
                    .lineLimit(4)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 30)
                                    }                          }
            .background{
                ZStack{
                    VStack{
                        
                        Circle()
                            .fill(Color.pink)
                            .scaleEffect(0.6)
                            .offset(x:60 )
                            .blur(radius: 110)
                            .animation(.easeInOut(duration: 0.3))
                        Circle()
                            .fill(Color.yellow)
                            .scaleEffect(0.6, anchor: .leading)
                            .offset(x: -12)
                            .blur(radius: 110)
                            .animation(.easeInOut(duration: 0.3))
                    }
                    Rectangle()
                        .fill(.ultraThinMaterial)
                }
                .ignoresSafeArea()
            }
            .preferredColorScheme(.dark)
            .fullScreenCover(isPresented: $showForm) {
                      withAnimation(.easeInOut(duration: 0.3)) {
                          InfoView()
                      }
                  }
        }
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        Content()
    }
}



struct HeightSelectionView: View {
    @Binding var height: Double?

    var body: some View {
        VStack {
            Text("Выберите ваш рост в см")
            .font(.title2)
            .fontWeight(.light)
            .foregroundColor(.white)
            .padding()

            Picker("Height", selection: $height) {
                ForEach(150...220, id: \.self) { height in
                    Divider()
                    Text("\(height)")
                        .font(.custom("NoizeSportFreeVertion-Regular", size: 80))
                        .foregroundColor(.orange)
                        .tag(height)
                    Divider()
                }
            }
            .pickerStyle(.inline)
            .padding(.horizontal, 10)
        }
    }
}

