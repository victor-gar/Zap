//
//  CustomTabBar.swift
//  ZapFitness
//
//  Created by Victor Garitskyu on 07.05.2023.
//

import SwiftUI

struct CustomTabBar: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Spacer()
                
                if selectedTab == 0 {
                    Text("Content for Tab 1")
                        .foregroundColor(.white)
                } else if selectedTab == 1 {
                    Text("Content for Tab 2")
                        .foregroundColor(.white)
                }else if selectedTab == 2 {
                    Text("Content for Tab 3")
                        .foregroundColor(.white)
                } else {
                    Text("Content for Tab 4")
                        .foregroundColor(.white)
                }
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
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
        }
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
                    .foregroundColor(isSelected ? .blue : .gray)
            }
            .padding(.top, 10)
            .padding(.bottom, 30)
            .frame(maxWidth: .infinity)
        }
    }
}
