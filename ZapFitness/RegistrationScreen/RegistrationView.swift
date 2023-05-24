//
//  RegistrationView.swift
//  ZapFitness
//
//  Created by Victor Garitskyu on 15.05.2023.
//

import SwiftUI
import FirebaseAuth

struct RegistrationView: View {
    
    @State private var isUserAuthenticated = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        ZStack{
            if status {
                if status {
                    Content()
                } else {
                    InfoView()
                }
            }
            else {
                SignIn()
            }
        }
        .animation(.spring())
                    .onAppear {
                        NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                            
                            let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                            self.status = status
                        }
                }
        
        
        
        
    }
    
    

    
}

struct SignIn: View {
        
        @State private var password = ""
        @State private var login = ""
        @State private var email = ""
        @State var show = false
        @State private var alert = false
        @State private var message = ""
        
        
        
        
        var body: some View {
            ZStack{
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
                            .padding(.bottom, 30)

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
                                    .padding(.bottom, 60)

                                    .foregroundColor(password.isEmpty ? .gray : .white)
                                
                            }
                        }
                    }
                    
                    Button("Get Started") {
                        signWithEmail(email: self.login, password: self.password) { (verefided , status ) in
                            
                            if !verefided {
                                self.message = status
                                self.alert.toggle()
                                
                            } else {
                                UserDefaults.standard.set(true, forKey: "status")
                                NotificationCenter.default.post(name: Notification.Name("statusChange"), object: nil)
                            }
                            
                            
                        }
                    }
                        .font(.custom("NoizeSportFreeVertion-Regular", size: 20))
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .textCase(.uppercase)
                        .background(Color.orange)
                        .cornerRadius(30)
                        .padding(.bottom, 10)
                        .alert(isPresented: $alert){
                            Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
                        }
                    HStack{
                        Text("Don't have an acaccount ?")
                            .font(.footnote)
                            .font(.footnote)
                            .lineLimit(4)
                            .foregroundColor(.gray)
                            .transition(.opacity)
                        Button("Sign up") {
                            self.show.toggle()

                        }
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .sheet(isPresented: $show) {
                                    
                                    SignUp(show: self.$show)
                                }
                    .padding(.bottom, 25)
                    
                    
                }
            }
            .background{
                ZStack{
                    VStack{
                        
                        Circle()
                            .fill(Color.purple)
                            .scaleEffect(0.6)
                            .offset(x: -30)
                            .blur(radius: 110)
                            .animation(.easeInOut(duration: 0.3))
                        Circle()
                            .fill(Color.orange)
                            .scaleEffect(0.9, anchor: .leading)
                            .offset(x: 160)
                            .blur(radius: 110)
                            .animation(.easeInOut(duration: 0.3))
                    }
                    Rectangle()
                        .fill(.ultraThinMaterial)
                    
                }
                .ignoresSafeArea()
            }
            .preferredColorScheme(.dark)
           
        }
        
        
    }

struct SignUp: View {
        
        @State private var showForm = false
        @State private var password = ""
        @State private var login = ""
        @State private var email = ""
        @State private var repeatPassword = ""
        @State private var showAdditionalFields = false
        @State private var isResettingPassword = false
    @Binding var show : Bool
    @State private var alert = false
    @State private var message = ""
        
        
        
        var welcomeText: String {
            return isResettingPassword ? "Reset Password" : "Create account"
        }
        
        var forgetPasswordText: String {
            return isResettingPassword ? "Reset Password" : "Forget password?"
        }

        
        
        var body: some View {
            ZStack{
                    VStack {
                    
                    Spacer()
                    VStack(alignment: .leading){
                        
                        
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
                    
                    Button("Get Started") {
                        signUpWithEmail(email: self.login, password: self.password) { (verefided , status ) in
                            
                            if !verefided {
                                self.message = status
                                self.alert.toggle()
                            } else {
                                UserDefaults.standard.set(true, forKey: "status")
                                NotificationCenter.default.post(name: Notification.Name("statusChange"), object: nil)
                            }
                            
                            
                        }
                    }
                        .font(.custom("NoizeSportFreeVertion-Regular", size: 20))
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .textCase(.uppercase)
                        .background(Color.orange)
                        .cornerRadius(30)
                        .padding(.bottom, 30)
                        .alert(isPresented: $alert){
                            Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
                        }

                    
                    
                }
            }
            .background{
                ZStack{
                    VStack{
                        
                        Circle()
                            .fill(showAdditionalFields ? Color.pink : Color.purple  )
                            .scaleEffect(0.6)
                            .offset(x: showAdditionalFields ? 60 : -30)
                            .blur(radius: 110)
                            .animation(.easeInOut(duration: 0.3))
                        Circle()
                            .fill(showAdditionalFields ? Color.yellow : Color.orange  )
                            .scaleEffect(showAdditionalFields ? 0.6 : 0.9, anchor: .leading)
                            .offset(x: showAdditionalFields ? -12 : 160)
                            .blur(radius: 110)
                            .animation(.easeInOut(duration: 0.3))
                    }
                    Rectangle()
                        .fill(.ultraThinMaterial)
                    
                }
                .ignoresSafeArea()
            }
            .preferredColorScheme(.dark)
           
        }
        
        
    }


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}

func signWithEmail(email: String, password: String, comletion: @escaping(Bool, String) -> Void) {
    
    Auth.auth().signIn(withEmail: email, password: password){ (res, err) in
        if err != nil {
            comletion(false, (err?.localizedDescription)!)
            return
        }
        comletion(true, (res?.user.email)!)
    }
}

func signUpWithEmail(email: String, password: String, comletion: @escaping(Bool, String) -> Void) {
    
    Auth.auth().createUser(withEmail: email, password: password){ (res, err) in
        if err != nil {
            comletion(false, (err?.localizedDescription)!)
            return
        }
        comletion(true, (res?.user.email)!)
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




            

