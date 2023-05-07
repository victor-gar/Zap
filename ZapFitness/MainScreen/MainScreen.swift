//
//  MainScreen.swift
//  ZapFitness
//
//  Created by Victor Garitskyu on 08.05.2023.
//

import SwiftUI

struct MainScreen: View {
 
    var body: some View {
        ScrollView(.vertical){
            VStack{
                TotalAll()
                    .padding(.top,50)
                Challenge()
                    .padding(.top, 65)
            }
        }
    }
}


struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}


