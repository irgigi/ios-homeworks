//
//  AuthService.swift
//  Navigation

import FirebaseAuth

struct FireBaseUser {
    let user: User
}

final class AuthService {
    
    func signUpUser(email: String, password: String, completion: @escaping (Result<FireBaseUser, Error>) -> Void) {
        
        //нужна валидация email и пароля
        
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
    
    func loginUser(email: String, password: String, completion: @escaping (Result<FireBaseUser, Error>) -> Void) {
        
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
    
    func logoutUser(completion: @escaping (Result<Void, Error>) -> Void) {
        do{
            try Auth.auth().signOut()
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }
    
}
