//
//  SignUpView.swift
//  DesignCodeiOS15
//
//  Created by 邱英健 on 2023/10/4.
//

import SwiftUI

struct SignUpView: View {
    @State var email = ""
    @State var psw = ""
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack (alignment: .leading, spacing: 16) {
                Text("Sign Up")
                    .font(.largeTitle).bold()
                Text("Access 120+ hours of course, tutorials and livestreams")
                    .font(.headline)
                TextField ("Email", text: $email)
                    .inputStyle(icon: "mail")
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .disableAutocorrection(true)
                SecureField("Password", text: $psw)
                    .inputStyle(icon: "lock")
                    .textContentType(.password)
                Button {} label: {
                    Text("Create a Account")
                        .frame(maxWidth: .infinity)
                }
                .font(.headline)
                .blendMode(.overlay)
                .buttonStyle(.angular)
                .tint(.accentColor)
                .controlSize(.large)
                
                Group {
                    Text("By clicking on _Create an account_, you agree to our **Terms of Services** and **[Privacy Policy](https://www.baidu,com)**")
                    Divider()
                    HStack {
                        Text("Already have an account?")
                        Button {} label: {
                            Text("**[Sign in](/)**")
                        }
                    }
                }
                .font(.footnote)
                .foregroundColor(.secondary)
                .accentColor(.primary)
            }
            .padding(20)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
            .storkeStyle(cornerRadius: 30)
            .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
            .padding(20)
            .background(
                Image("Blob 1")
                    .offset(x: 200, y: -100)
            )
        }
    }
}

#Preview {
    SignUpView()
}
