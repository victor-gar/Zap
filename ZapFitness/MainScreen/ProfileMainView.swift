//
//  ProfileMainView.swift
//  ZapFitness
//
//  Created by Victor Garitskyu on 08.05.2023.
//

import SwiftUI

struct ProfileMainView: View {
 
    var body: some View {
        
        HStack{
            VStack(alignment: .leading, spacing: 0){
                Text("GOOD MORNING,")
                    .font(.custom("NoizeSportFreeVertion-Regular", size: 14))
                    .foregroundColor(.gray)
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
                Spacer()
                Text("User Name")
                    .font(.custom("NoizeSportFreeVertion-Regular", size: 30))
                    .foregroundColor(.black)
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
            }
            .padding(.vertical, 10)
            Spacer()
            Image(systemName: "person.fill")
                .font(.system(size: 32))
                .frame(width: 20, height: 20)
                .foregroundColor(.black)
                .padding(20)
                .background(Color.green)
                .clipShape(Circle())

        }
        .padding(10)
        .padding(.horizontal,10)

    }
}


