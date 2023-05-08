//
//  MainScreen.swift
//  ZapFitness
//
//  Created by Victor Garitskyu on 08.05.2023.
//

import SwiftUI


struct MainScreen: View {
 
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment: .center, spacing: 10){
                ProfileMainView()
                    .padding(.top,42)
                TotalAll()
                    .padding(.top,65)
                Challenge()
                    .padding(.top, 65)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 0){
                        ChartSteps()
                        ChartSteps()
                    }
                }
            }
        }
    }
}


struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}


