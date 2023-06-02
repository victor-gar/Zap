//
//  AgeSelectionView.swift
//  ZapFitness
//
//  Created by Victor Garitskyu on 02.06.2023.
//

import SwiftUi

struct AgeSelectionView: View {
    @Binding var age: Int?

    var body: some View {
        VStack {
            Text("Выберите ваш возраст")
                .font(.title2)
                .fontWeight(.light)
                .foregroundColor(.white)
                .padding()
            Picker("Age", selection: $age) {
                ForEach(6...80, id: \.self) { ageS in
                    Divider()
                    Text("\(ageS)")
                        .font(.custom("NoizeSportFreeVertion-Regular", size: 100))
                        .foregroundColor(.orange)
                        .tag(ageS)
                    Divider()
                }
            }
            .pickerStyle(WheelPickerStyle())
            .accentColor(.blue)
            .padding(.horizontal, 10)
        }
    }
}
