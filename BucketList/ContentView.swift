//
//  ContentView.swift
//  BucketList
//
//  Created by PBB on 2019/12/6.
//  Copyright © 2019 PBB. All rights reserved.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State private var isUnlocked = false
    @State private var isUnlockFailed = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            if isUnlocked {
                UnlockedView()
            } else {
                Button("Unlock Places") {
                    self.authencate()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .alert(isPresented: $isUnlockFailed) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
        }
        
        .onAppear(perform: authencate)
    }
    
    
    func authencate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate yourself to unlock your places."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        self.alertTitle = "Unlock Failed"
                        self.alertMessage = "Please try again"
                        self.isUnlockFailed = true
                    }
                }
            }
            
        } else {
            self.alertTitle = "There's no biometrics"
            self.alertMessage = "Please buy a new iPhone"
            self.isUnlockFailed = true
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
