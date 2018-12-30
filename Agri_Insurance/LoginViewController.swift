//
//  LoginViewController.swift
//  Agri_Insurance
//
//  Created by Reetesh Kumar on 24/11/18.
//  Copyright © 2018 Reetesh Kumar. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setBottomLine(borderColor: UIColor) {
        
        self.borderStyle = UITextField.BorderStyle.none
        self.backgroundColor = UIColor.clear
        
        let borderLine = UIView()
        let height = 1.0
        borderLine.frame = CGRect(x: 5, y: Double(self.frame.height) - height, width: Double(self.frame.width-10), height: height)
        
        borderLine.backgroundColor = borderColor
        self.addSubview(borderLine)
    }
}

class LoginViewController: UIViewController {

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var txtLanguage: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var loginWithUserView: UIView!
    @IBOutlet weak var loginWithOTPView: UIView!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var txtOTPNumber: UITextField!
    @IBOutlet weak var txtShowCaptcha: UITextField!
    @IBOutlet weak var txtEnterCaptcha: UITextField!
    @IBOutlet weak var labelToShowPassword: UILabel!
    @IBOutlet weak var labelToForgotUserNamePassword: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loginView.layer.borderWidth = 1
        loginView.layer.borderColor = UIColor.white.cgColor
        loginView.layer.cornerRadius = 8.0;
        
        txtLanguage.setBottomLine(borderColor: UIColor.black)
        
        let leftImage = UIImage(named: "language-ldpi-36X36")
        txtLanguage.leftView = UIImageView(image: leftImage)
        txtLanguage.leftView?.frame = CGRect(x: 0, y: 0, width: 20 , height:20)
        txtLanguage.leftViewMode = .always
        txtLanguage.text = "  English"
        let rightImage = UIImage(named: "arrow-drop-down-small")
        txtLanguage.rightView = UIImageView(image: rightImage)
        txtLanguage.rightView?.frame = CGRect(x: 0, y: 0, width: 10 , height:10)
        txtLanguage.rightViewMode = .always
        
        loginWithUserView.backgroundColor = UIColor.clear
        loginWithOTPView.backgroundColor = UIColor.clear
        loginWithOTPView.isHidden = true
        
        txtUserName.setBottomLine(borderColor: UIColor.black)
        txtPassword.setBottomLine(borderColor: UIColor.black)
        txtEnterCaptcha.setBottomLine(borderColor: UIColor.black)
        txtMobileNumber.setBottomLine(borderColor: UIColor.black)
        txtOTPNumber.setBottomLine(borderColor: UIColor.black)
        
        let imgUser = UIImage(named: "user-ldpi-36X36")
        txtUserName.leftView = UIImageView(image: imgUser)
        txtUserName.leftView?.frame = CGRect(x: 0, y: 0, width: 20 , height:20)
        txtUserName.leftViewMode = .always
        
        let imgPassword = UIImage(named: "password-ldpi-36X36")
        txtPassword.leftView = UIImageView(image: imgPassword)
        txtPassword.leftView?.frame = CGRect(x: 0, y: 0, width: 20 , height:20)
        txtPassword.leftViewMode = .always
        
        let imgReload = UIImage(named: "reload_captcha")
        txtShowCaptcha.rightView = UIImageView(image: imgReload)
        txtShowCaptcha.rightView?.frame = CGRect(x: 0, y: 0, width: 20 , height:20)
        txtShowCaptcha.rightViewMode = .always
        
        let imgMobile = UIImage(named: "mobile-ldpi-36X36")
        txtMobileNumber.leftView = UIImageView(image: imgMobile)
        txtMobileNumber.leftView?.frame = CGRect(x: 0, y: 0, width: 20 , height:20)
        txtMobileNumber.leftViewMode = .always
        
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                          .font : UIFont.systemFont(ofSize: 14, weight: .regular)]
        txtUserName.attributedPlaceholder = NSAttributedString(string:" Enter User Name", attributes:attributes)
        txtPassword.attributedPlaceholder = NSAttributedString(string:" Password", attributes:attributes)
        txtEnterCaptcha.attributedPlaceholder = NSAttributedString(string:" Enter Captcha", attributes:attributes)
        txtMobileNumber.attributedPlaceholder = NSAttributedString(string:" Enter Mobile Number", attributes:attributes)
        txtOTPNumber.attributedPlaceholder = NSAttributedString(string:" OTP", attributes:attributes)
        
        labelToShowPassword.attributedText = NSAttributedString(string: "Show Password", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.foregroundColor: UIColor.black,
             .font : UIFont.systemFont(ofSize: 14, weight: .regular)])
        labelToForgotUserNamePassword.attributedText = NSAttributedString(string: "Forgot UserName/Password?", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.foregroundColor: UIColor.white,
             .font : UIFont.systemFont(ofSize: 14, weight: .regular)])
        
        let tapOnShowPwd = UITapGestureRecognizer(target: self, action: #selector(self.tapOnShowPassword))
        labelToShowPassword.isUserInteractionEnabled = true
        labelToShowPassword.addGestureRecognizer(tapOnShowPwd)
        
        let tapOnForgot = UITapGestureRecognizer(target: self, action: #selector(self.tapOnForgotUserNamePassword))
        labelToForgotUserNamePassword.isUserInteractionEnabled = true
        labelToForgotUserNamePassword.addGestureRecognizer(tapOnForgot)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func tapOnShowPassword(sender:UITapGestureRecognizer) {
        if (txtPassword.isSecureTextEntry == true) {
            txtPassword.isSecureTextEntry = false
        } else {
            txtPassword.isSecureTextEntry = true
        }
    }
    
    @objc func tapOnForgotUserNamePassword(sender:UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "resetViewController") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            loginWithOTPView.isHidden = true
            loginWithUserView.isHidden = false
        case 1:
            loginWithOTPView.isHidden = false
            loginWithUserView.isHidden = true
            loginWithOTPView.backgroundColor = UIColor.clear
        default:
            break;
        }
    }
}
