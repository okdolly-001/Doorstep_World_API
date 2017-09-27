//
//  ViewController.swift
//  test
//
//  Created by doMore on 9/23/17.
//  Copyright © 2017 doMore. All rights reserved.
//

import UIKit
import HyperTrack
import Parse
class LoginViewController: UIViewController {
    @IBOutlet weak var facebookbutton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var Header: UILabel!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var switchCustomer: UISwitch!
    @IBOutlet weak var signinButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        facebookbutton.backgroundColor = UIColor(red: 0.278, green: 0.408, blue: 0.678, alpha: 1.00)
        twitterButton.backgroundColor = UIColor(red: 0.271, green: 0.627, blue: 0.922, alpha: 1.00)
        loginButton.backgroundColor = UIColor(red: 0.137, green: 0.290, blue: 0.604, alpha: 1.00)
        loginButton.layer.cornerRadius = 10
        signinButton.backgroundColor = UIColor(red: 0.137, green: 0.290, blue: 0.604, alpha: 1.00)
        signinButton.layer.cornerRadius = 10
        facebookbutton.layer.cornerRadius = 10
        facebookbutton.clipsToBounds = true
        signinButton.clipsToBounds = true
        twitterButton.layer.cornerRadius = 10
        twitterButton.clipsToBounds = true
        loginButton.clipsToBounds = true
        Header.text = "Doorstep"

        userName.delegate = self
        passWord.delegate = self

        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func registerTapped(_ sender: Any) {
        let user = PFUser()
        if let username = userName.text, let password = passWord.text {
            user.username = username
            user.password = password
        }
        let diceRoll = Int(arc4random_uniform(10000))

        user.email = "a\(diceRoll)@gmail.com"
        print(user.email)
        // Signing up using the Parse API
        user.signUpInBackground {
            (success, error) -> Void in
            if let error = error as NSError? {
                let errorString = error.userInfo["error"] as? NSString
                // In case something went wrong, use errorString to get the error
            } else {
                print("lol its all good")
            }
        }
    }

    @IBAction func loginTapped(_ sender: Any) {
        if let userName = userName.text, let password = passWord.text
        {
            PFUser.logInWithUsername(inBackground: userName, password: password,
                                     block: {(user, error) -> Void in
                                        if let error = error as NSError? {
                                            let errorString = error.userInfo["error"] as? NSString
                                        } else {
                                            HyperTrack.setUserId(userName)
                                            if self.switchCustomer.isOn
                                            {
                                                self.performSegue(withIdentifier: "toCustomer", sender: self)
                                            } else {
                                                self.performSegue(withIdentifier: "toDelivery", sender: self)
                                            }
                                        }
            })
            HyperTrack.setUserId(userName)
            if self.switchCustomer.isOn
            {
                self.performSegue(withIdentifier: "toCustomer", sender: self)
            } else {
                self.performSegue(withIdentifier: "toDelivery", sender: self)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension LoginViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
