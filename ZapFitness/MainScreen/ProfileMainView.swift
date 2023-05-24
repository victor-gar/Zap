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


//struct ProfileMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileMainView()
//    }
//}


struct GradientBackgroundView: View {
    @State private var gradientIndex = 0
    
    let gradients: [Gradient] = [
        Gradient(colors: [.red, .orange]),
        Gradient(colors: [.blue, .purple]),
        Gradient(colors: [.green, .yellow])
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: gradients[gradientIndex], startPoint: .top, endPoint: .bottom)
                .animation(.easeInOut(duration: 2.0))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Animated Gradient Background")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(10)
                
                Spacer()
                
                Button("Change Gradient") {
                    withAnimation {
                        gradientIndex = (gradientIndex + 1) % gradients.count
                    }
                }
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(Color.black.opacity(0.6))
                .cornerRadius(10)
                .padding()
            }
        }
    }
}

struct ContentViews: View {
    var body: some View {
        AnimatedBackgroundView()
    }
}

struct ContentViews_Previews: PreviewProvider {
    static var previews: some View {
        Content()
    }
}



struct AnimatedBackgroundView: View {
    @State private var gradientStart: UnitPoint = .topLeading
    @State private var gradientEnd: UnitPoint = .bottomTrailing
    @State private var isForwardAnimation = true
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            LinearGradient(gradient: Gradient(colors: [.black.opacity(0.2), .orange.opacity(0.7)]), startPoint: gradientStart, endPoint: gradientEnd)
                .animation(Animation.linear(duration: 3).repeatForever())
                .onReceive(timer) { _ in
                    withAnimation {
                        if isForwardAnimation {
                            gradientStart = UnitPoint(x: 0, y: 0)
                            gradientEnd = UnitPoint(x: 1, y: 1)
                        } else {
                            gradientStart = UnitPoint(x: 1, y: 0)
                            gradientEnd = UnitPoint(x: 0, y: 1)
                        }
                        isForwardAnimation.toggle()
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .edgesIgnoringSafeArea(.all)
    }
}



struct Content: View {
    @State private var age: Int?
    @State private var height: Double?
    @State private var weight: Double?
    @State private var currentWindow = 0
    @State private var showForm = false

    var body: some View {
            ZStack {
                VStack {
                    
                    
                    Spacer()
                    
                    if currentWindow == 0 {
                        AgeSelectionView(age: $age)
                    } else if currentWindow == 1 {
                        HeightSelectionView(height: $height)
                    } else if currentWindow == 2 {
                        WeightSelectionView(weight: $weight)
                    }
                    
                    Spacer()
                    
                    ProgressView(value: Double(currentWindow + 1) / 3)
                        .progressViewStyle(LinearProgressViewStyle())
                                            .colorInvert()
                                            .foregroundColor(.white)
                                            .border(.orange, width: 1)
                                            .frame(width: UIScreen.main.bounds.width - 40)
                    Button(action: {
                        currentWindow += 1
                        if currentWindow > 2{
                            self.showForm = true
                        }
                    })
                    {
                        Text("Next")
                            .font(.custom("NoizeSportFreeVertion-Regular", size: 20))
                            .foregroundColor(.black)
                            .frame(width: UIScreen.main.bounds.width - 50)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .textCase(.uppercase)
                            .background(Color.white)
                            .cornerRadius(30)
                            .transition(.opacity)
                    }
                    .padding()
                    .disabled(currentWindow > 2)
                    
                    Text("*Для дальнейшего пользования программой нужно заполнить ваши данные")
                    .font(.subheadline)
                    .lineLimit(4)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 30)
                                    }                          }
            .background{
                ZStack{
                    VStack{
                        
                        Circle()
                            .fill(Color.pink)
                            .scaleEffect(0.6)
                            .offset(x:60 )
                            .blur(radius: 110)
                            .animation(.easeInOut(duration: 0.3))
                        Circle()
                            .fill(Color.yellow)
                            .scaleEffect(0.6, anchor: .leading)
                            .offset(x: -12)
                            .blur(radius: 110)
                            .animation(.easeInOut(duration: 0.3))
                    }
                    Rectangle()
                        .fill(.ultraThinMaterial)
                }
                .ignoresSafeArea()
            }
            .preferredColorScheme(.dark)
            .fullScreenCover(isPresented: $showForm) {
                      withAnimation(.easeInOut(duration: 0.3)) {
                          InfoView()
                      }
                  }
        }
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        Content()
    }
}


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

