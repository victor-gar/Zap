//
//  ChartKkal.swift
//  ZapFitness
//
//  Created by Victor Garitskyu on 08.05.2023.
//

import SwiftUI
import Charts

struct ChartSteps: View {
    var body: some View {
        ZStack {
            ChartStep()
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "figure.walk")
                        .font(.system(size: 15))
                        .frame(width: 10, height: 10)
                        .foregroundColor(.black)
                    Text("STEPS")
                        .font(.custom("NoizeSportFreeVertion-Regular", size: 10))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.vertical,15)
                .padding(.horizontal,15)
                .background(Color.white)
                Spacer()

                HStack{
                    Text("12,543")
                        .font(.custom("NoizeSportFreeVertion-Regular", size: 20))
                    Text("STEPS")
                        .font(.custom("NoizeSportFreeVertion-Regular", size: 10))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.vertical,5)
                .padding(.horizontal,15)
                .background(Color.white)
            }
     
        }
        .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 1.3)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.leading, 10)

    }
}


struct ChartKkal_Previews: PreviewProvider {
    static var previews: some View {
        ChartSteps()
    }
}


struct ChartStep: View {
    var body: some View {
        Chart {
            BarMark(
                x: .value("Mount", "M"),
                y: .value("Value", 12459)
            )
            BarMark(
                x: .value("Mount", "T"),
                y: .value("Value", 19000)
            )
            BarMark(
                x: .value("Mount", "W"),
                y: .value("Value", 13000)
            )
            BarMark(
                x: .value("Mount", "T"),
                y: .value("Value", 300)
            )
            BarMark(
                x: .value("Mount", "F"),
                y: .value("Value", 31234)
            )
        }
        .foregroundStyle(.orange)
        .foregroundColor(Color.black)
        .padding(20)
        .background(Color.white)
    }
    
}

