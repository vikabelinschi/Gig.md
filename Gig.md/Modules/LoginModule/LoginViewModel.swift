//
//  LoginViewModel.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 22.05.2022.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    let loginService = LoginService(with: NetworkServiceImp())
    @Published var selection: Bool = false
    
    func signInPressed(email: String, password: String) {
        loginService.signUp(credentials: LoginModel(email: email, password: password)) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                CommonVars.token = response.token
                self.selection = true
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
