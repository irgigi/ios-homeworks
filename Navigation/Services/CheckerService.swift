//
//  CheckerService.swift
//  Navigation

import FirebaseCore
import FirebaseAuth


protocol CheckerServiceProtocol {
    func checkCredentials(email: String, password: String, completion: @escaping (Result<FireBaseUser, Error>) -> Void)
    func signUp(email: String, password: String, completion: @escaping (Result<FireBaseUser, Error>) -> Void)
}

class CheckerService: CheckerServiceProtocol {
    //валидация логина и пароля
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let minLenght = 6
        return password.count >= minLenght
    }
    
    func checkCredentials(email: String, password: String, completion: @escaping (Result<FireBaseUser, Error>) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription)
            }
                
            if let authResult = result {
                completion(.success(FireBaseUser(user: authResult.user)))
            }
        }
        
    }
    
    func signUp(email: String, password: String, completion: @escaping (Result<FireBaseUser, Error>) -> Void) {
        
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription)
            }
            
            if let authResult = result {
                completion(.success(FireBaseUser(user: authResult.user)))
            }
        }
    }
    
}
