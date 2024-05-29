//
//  Filename: LalsinghaniNirav-HW10(ContentView.swift)
//  EID: NVL225
//  Course: CS371L
//
//  Created by Nirav Lalsinghani on 11/17/20.
//  Copyright 2020. All rights reserved.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct ContentView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var status = "Not currently logged in"
    
    var body: some View {
        VStack(alignment:.center){
            Text("User Login")
                .padding(.top, 10)
                .offset(y: -230)
            Spacer()
                .frame(height:50)
            HStack{
                Text("User ID:")
                    .padding()
                    .offset(y:-100)
                Spacer()
                    .frame(width:20.0)
                TextField("username", text:$username)
                    .border(Color.black)
                    .frame(width:250.0)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .offset(y:-100)
                    .padding()
            }
            HStack{
                Text("Password")
                    .padding()
                    .offset(y:-100)
                TextField("password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .frame(width: 250.0)
                    .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .padding()
                    .offset(y:-100)
                
            }
            Spacer()
                .frame(height:10)
            Button(action:
                    {if(username == "" || password == ""){
                status = "Invalid Login"
                    }
                else{
                    status = "\(username) logged in"
                }
            }, label: {
                Text("Login")
            })
            Spacer()
                .frame(height: 50)
            Text(status)
        }
        .frame(maxHeight:.infinity)
        .contentShape(Rectangle())
        .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
            self.hideKeyboard()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

