//
//  SignUpViewController.swift
//  iOS_firstDevelopment
//
//  Created by Edwin on 26/11/21.
//

    import UIKit

protocol DataEnteredDelegate: AnyObject {
    func userDataReceived(userCollection: [String?:String?])
    
}

class SignUpViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var cPasswordLabel: UILabel!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var cPasswordInput: UITextField!
    @IBOutlet weak var errorMsg: UILabel!
 
    weak var delegate: DataEnteredDelegate?
    
    let kStoredKey = ""
    
    var finalErrorMessage = ""
    
    var sessionFlag = false

    var userCollection: [String?: String?] = ["admin":"root"]

    func signUp(){
        
        errorMsg.isHidden = true
        
        if (usernameInput.text == "" || passwordInput.text == "" || cPasswordInput.text == "") {
            
            let errorMessage1: String = "Required data is missing \n"
            finalErrorMessage = errorMessage1
            sessionFlag = true
            
            if(usernameInput.text == ""){
                usernameInput.attributedPlaceholder = NSAttributedString(string: "Username required", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            }
            
            if (passwordInput.text == "") {
                passwordInput.attributedPlaceholder = NSAttributedString(string: "Password required", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            }
            
            if (cPasswordInput.text == "") {
                cPasswordInput.attributedPlaceholder = NSAttributedString(string: "Password required", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            }
                
        }
        
        for (username, _) in userCollection{
            if (usernameInput.text == username){
                
                sessionFlag = true
                let errorMessage2: String = "Username already taken \n"
                finalErrorMessage = "\(finalErrorMessage) \(errorMessage2)"
            }
        }
        
        if (passwordInput.text != cPasswordInput.text){
            sessionFlag = true
            let errorMessage3: String = "Passwords don't match \n"
            finalErrorMessage = "\(finalErrorMessage) \(errorMessage3)"
        }
        
        if (sessionFlag == true) {
            errorMsg.numberOfLines = 0
            errorMsg.sizeToFit()
            
            errorMsg.text = finalErrorMessage
            errorMsg.backgroundColor = UIColor.red
            errorMsg.textColor = UIColor.white
            errorMsg.isHidden = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.errorMsg.isHidden = true
            }
        }else{
            
            userCollection[usernameInput.text] = passwordInput.text
            
            UserDefaults.standard.set(userCollection, forKey: "UsersData")
            
            delegate?.userDataReceived(userCollection:[usernameInput.text: passwordInput.text])
            
            errorMsg.text = "User created succesfully"
            errorMsg.backgroundColor = UIColor.green
            errorMsg.textColor = UIColor.black
            errorMsg.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.errorMsg.isHidden = true

                self.dismiss(animated: true, completion: nil)
            }
            
        }
    }

    
    @IBAction func RegisterButton(_ sender: Any) {

        signUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
}
