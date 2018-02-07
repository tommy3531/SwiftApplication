

import Foundation
import Firebase

private let auth = Auth.auth()

class AuthService {
    
    static let instance = AuthService()
    
    // Purpose: RegisterUser
    // Parameters: Email, Password
    func registerUser(withEmail email: String, andPassword password: String, profilePic: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        auth.createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                userCreationComplete(false, error)
                return
            }
            
            let userData = ["provider": user.providerID, "email": user.email, "profilePic": profilePic]
            DataService.instance.createDBUser(uid: user.uid, userData: userData)
            userCreationComplete(true, nil)
        }
        
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        auth.signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                loginComplete(false, error)
                return
            }
            loginComplete(true, nil)
        }
    }
    
    func getCurrentUser() {
        var user = auth.currentUser
//        user.updatePro
    }
}
