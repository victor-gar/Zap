//
//  Challenge.swift
//  ZapFitness
//
//  Created by Victor Garitskyu on 08.05.2023.
//

import SwiftUI

struct Challenge: View {
 
    var body: some View {
        
        ZStack{
            Rectangle()
                .fill(Color.purple)
                .background(VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))).opacity(0.6)
            HStack{
                Image(systemName: "trophy.fill")
                    .font(.system(size: 22))
                    .frame(width: 20, height: 20)
                    .foregroundColor(.purple)
                    .padding(20)
                    .background(Color.white)
                    .clipShape(Circle())
                Text("KM")
                    .font(.custom("NoizeSportFreeVertion-Regular", size: 10))
                    .foregroundColor(.black)
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
                Spacer()
            }
            .padding(10)
    }
        .cornerRadius(60)
        .padding(10)
        .frame(width: .infinity, height: 100)
    }
}


struct Challenge_Previews: PreviewProvider {
    static var previews: some View {
        Challenge()
    }
}
