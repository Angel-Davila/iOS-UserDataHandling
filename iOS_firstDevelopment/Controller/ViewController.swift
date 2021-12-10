import UIKit

class ViewController: UIViewController, DataEnteredDelegate {
    func userDataReceived(userCollection: [String?: String?]){
        usersData = userCollection
    }
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInImage: UIImageView!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var signInErrorMsg: UILabel!
    
    var usersData: [String?: String?] = [:]

    func signIn(){
        
        
        var sessionFlag: Bool = true
        
        if(usernameInput.text == "" || passwordInput.text == "") {
            signInErrorMsg.text = "Error! Username or password field is missing"
            signInErrorMsg.backgroundColor = UIColor.red
            signInErrorMsg.textColor = UIColor.white
            signInErrorMsg.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.signInErrorMsg.isHidden = true
            }
            
        } else {
        
            for (username, password) in usersData {
            
                if (usernameInput.text == username && passwordInput.text == password){
                    
                    performSegue(withIdentifier: "logInAccess", sender: self)
                    sessionFlag = false

                    break
                    
                } else if (usernameInput.text != username || passwordInput.text != password){
                    
                    sessionFlag = true
                    
                }
            }
            
            if (sessionFlag == true){
                signInErrorMsg.text = " Error! Username or password incorrect. "
                signInErrorMsg.backgroundColor = UIColor.red
                signInErrorMsg.textColor = UIColor.white
                signInErrorMsg.isHidden = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.signInErrorMsg.isHidden = true
                }
              
            }
        }
        usernameInput.text = ""
        passwordInput.text = ""
    }
        
    
    @IBAction func signInAction(_ sender: Any) {
        signIn()
    }
    
    
    @IBAction func signUpAction(_ sender: Any) {
        performSegue(withIdentifier: "signUpAccess", sender: self)
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "signUpAccess", let signUpView = segue.destination as? SignUpViewController {
            signUpView.delegate = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

