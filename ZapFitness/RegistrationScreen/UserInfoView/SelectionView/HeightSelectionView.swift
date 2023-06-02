//
//  HeightSelectionView.swift
//  ZapFitness
//
//  Created by Victor Garitskyu on 02.06.2023.
//

import SwiftUI

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
