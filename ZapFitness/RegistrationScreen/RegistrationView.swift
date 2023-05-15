//
//  RegistrationView.swift
//  ZapFitness
//
//  Created by Victor Garitskyu on 15.05.2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var showForm = false
    @State private var password: String = ""
    @State private var login: String = ""
    
    
    
    var body: some View {
        ZStack() {
            
            
            LinearGradient(
                gradient: Gradient(colors: [.purple , .black]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            
            
            
            
            
            
            
            VStack {
                Spacer()
                VStack(alignment: .leading){
                    
                    Text("Hi,")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                        .foregroundColor(.white)
                        .padding(.leading, 30)
                    
                    Text("Welcome Back!")
                        .font(.custom("NoizeSportFreeVertion-Regular", size: 25))
                        .textCase(.uppercase)
                        .foregroundColor(.white)
                        .padding(.leading, 30)
                    VStack(alignment: .trailing){
                        
                        VStack(alignment: .leading){
                            if login.isEmpty {
                                Text("Введите логин и пароль")
                                    .font(.footnote)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.leading, 30)
                                    .padding(.top, 20)
                                
                                
                            }
                            
                            TextField("", text: $login)
                                .textFieldStyle(.automatic)
                                .padding(5)
                                .background(Color.clear)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.white, lineWidth: 1.5)
                                )
                                .padding(.horizontal, 20)
                                .foregroundColor(login.isEmpty ? .gray : .white)
                            
                            SecureField("", text: $password)
                                .textFieldStyle(.automatic)
                                .padding(5)
                                .background(Color.clear)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.white, lineWidth: 1.5)
                                )
                                .padding(.horizontal, 20)
                                .foregroundColor(.white)
                            
                        }
                        
                        
                        
                        
                        VStack(alignment: .trailing){
                            
                            Button("Sign up") {}
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.trailing, 20)
                                .padding(.top, 15)
                                .padding(.bottom, 55)
                            
                            
                        }
                    }
                    
                    
                }
                
                
                
                Button("Get Started") {}
                    .font(.custom("NoizeSportFreeVertion-Regular", size: 20))
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .textCase(.uppercase)
                    .background(Color.orange)
                    .cornerRadius(30)
                    .padding(.bottom, 10)
                HStack{
                    Text("Don't have an acaccount ?")
                        .font(.footnote)
                        .lineLimit(4)
                        .foregroundColor(.white)
                        .transition(.opacity)
                    Button("Sign up") {}
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 25)
                
                
            }
        }
        
    }
    
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
