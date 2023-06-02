//
//  WeightSelectionView.swift
//  ZapFitness
//
//  Created by Victor Garitskyu on 02.06.2023.
//

import SwiftUI

struct WeightSelectionView: View {
    @Binding var weight: Double?

    var body: some View {
        VStack {
            Text("Выберите ваш вес в кг")
                .font(.title2)
                .fontWeight(.light)
                .foregroundColor(.white)
                .padding()

            Picker("Weight", selection: $weight) {
                ForEach(35...150, id: \.self) { weight in
                    Divider()
                    Text("\(weight)")
                        .font(.custom("NoizeSportFreeVertion-Regular", size: 80))
                        .foregroundColor(.orange)
                        .tag(weight)
                    Divider()
                }
            }
            .pickerStyle(.inline)
            .padding(.horizontal, 10)
        }
    }
}
