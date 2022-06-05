//
//  User.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 22.05.2022.
//

import Foundation
import UIKit

var token : String = ""
class UDViewModel: ObservableObject {
    
    @Published var selection: Bool = false
    
    let signUpService = SignUpService(with: NetworkServiceImp())
    
    func signUpPressed(email: String, password: String, name: String, surname: String, phone: String, age: Date) {
        signUpService.signUp(credentials: SignUpModel(email: email, password: password, name: name, surname: surname, phoneNumber: phone, age: convertAge(birthDate: age))) { result in
            switch result {
            case.success(let responnse):
                CommonVars.token = responnse.token
                DispatchQueue.main.async {
                    self.selection = true
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func convertAge(birthDate: Date) -> String {
        let calendar = Calendar.current
        let now = Date()
        let calcAge = calendar.dateComponents([.year], from: birthDate, to: now)
        let age = String(describing: calcAge.year)
        return age
    }
}
