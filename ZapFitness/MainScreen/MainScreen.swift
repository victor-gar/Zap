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
//                    .padding(.top, 45)
                TotalAll()
                    .padding(.top,55)
                Challenge()
                    .padding(.top, 55)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 0){
                        ChartSteps()
                        ChartSteps()
                    }

                }
                .padding(.top,-10)
                TotalAll()
                    .padding(.top,65)

            }
        }
        .background{
            ZStack{
                VStack{
                    
                    Circle()
                        .fill(Color.pink)
                        .scaleEffect(0.6)
                        .offset(x:60)
                        .blur(radius: 110)
                        .animation(.easeInOut(duration: 0.3))
                    Circle()
                        .fill(Color.yellow )
                        .scaleEffect(0.6 , anchor: .leading)
                        .offset(x: -12)
                        .blur(radius: 110)
                        .animation(.easeInOut(duration: 0.3))
                }
                Rectangle()
                    .fill(.ultraThinMaterial)
                
            }
            .ignoresSafeArea()
        }
        .preferredColorScheme(.light)
    }
}


struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}


