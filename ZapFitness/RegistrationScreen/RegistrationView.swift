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
        @State private var email: String = ""
        @State private var repeatPassword: String = ""
        @State private var showAdditionalFields = false
        @State private var isResettingPassword = false
    
    var welcomeText: String {
           return isResettingPassword ? "Reset Password" : "Welcome Back!"
       }
       
       var forgetPasswordText: String {
           return isResettingPassword ? "Reset Password" : "Forget password?"
       }
        var hi: String {
            return isResettingPassword ? "" : "Hi,"
     }
    
    
    var body: some View {
        ZStack() {
            
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.3353247729, green: 0.04799462545, blue: 0.3469717843),
                    Color(red: 0.06274510175, green: 0, blue: 0.0921568662)]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                
                Spacer()
                VStack(alignment: .leading){
                    
                    Text(hi)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                        .foregroundColor(.white)
                        .padding(.leading, 30)
                    
                    Text(welcomeText)
                        .font(.custom("NoizeSportFreeVertion-Regular", size: 25))
                        .textCase(.uppercase)
                        .foregroundColor(.white)
                        .padding(.leading, 30)
                    VStack(alignment: .trailing){
                        
                        VStack(alignment: .leading){
                            
                            TextField("", text: $login)
                                .placeholder(when: login.isEmpty) {
                                    Text("Введите логин").foregroundColor(.gray)
                                }
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .textFieldStyle(.automatic)
                                .padding(10)
                                .background(Color.clear)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.white, lineWidth: 1.5)
                                )
                                .padding(.horizontal, 20)
                                .foregroundColor(login.isEmpty ? .gray : .white)
                            
                            SecureField("", text: $password)
                                .placeholder(when: password.isEmpty) {
                                    Text("Введите пароль").foregroundColor(.gray)
                                }
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .textFieldStyle(.automatic)
                                .padding(10)
                                .background(Color.clear)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.white, lineWidth: 1.5)
                                )
                                .padding(.horizontal, 20)
                                .foregroundColor(password.isEmpty ? .gray : .white)
                            
                            if showAdditionalFields {
                
                                
                                SecureField("", text: $repeatPassword)
                                    .placeholder(when: repeatPassword.isEmpty) {
                                        Text("Повторите пароль").foregroundColor(.gray)
                                    }
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                                    .textFieldStyle(.automatic)
                                    .padding(10)
                                    .background(Color.clear)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(Color.white, lineWidth: 1.5)
                                    )
                                    .padding(.horizontal, 20)
                                    .foregroundColor(repeatPassword.isEmpty ? .gray : .white)
                                
                                TextField("", text: $email)
                                    .placeholder(when: email.isEmpty) {
                                        Text("Введите почту").foregroundColor(.gray)
                                    }
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                                    .textFieldStyle(.automatic)
                                    .padding(10)
                                    .background(Color.clear)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(Color.white, lineWidth: 1.5)
                                    )
                                    .padding(.horizontal, 20)
                                    .foregroundColor(email.isEmpty ? .gray : .white)
                            }
                            }
                            
                            VStack(alignment: .trailing){
                                
                                Button(forgetPasswordText) {
                                    showAdditionalFields.toggle()
                                    isResettingPassword.toggle()
                                }
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding(.trailing, 20)
                                .padding(.top, 10)
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
                            .font(.footnote)
                            .lineLimit(4)
                            .foregroundColor(.gray)
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
    
    
    extension View {
        func placeholder<Content: View>(
            when shouldShow: Bool,
            alignment: Alignment = .leading,
            @ViewBuilder placeholder: () -> Content) -> some View {
                
                ZStack(alignment: alignment) {
                    placeholder().opacity(shouldShow ? 1 : 0)
                    self
                }
            }
    }
