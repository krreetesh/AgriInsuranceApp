//
//  ResetViewController.swift
//  Agri_Insurance
//
//  Created by Reetesh Kumar on 25/11/18.
//  Copyright © 2018 Reetesh Kumar. All rights reserved.
//

import UIKit

class ResetViewController: UIViewController {
    
    @IBOutlet weak var resetView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var viewForgotUserName: UIView!
    @IBOutlet weak var viewForgotPassword: UIView!
    @IBOutlet weak var viewSecurityQn: UIView!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtEmailID: UITextField!
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var txtOTPNumber: UITextField!
    @IBOutlet weak var txtSecurityQuestion: UITextField!
    @IBOutlet weak var txtSecurityAnswer: UITextField!
    @IBOutlet weak var segmentedControlOTP: UISegmentedControl!
    @IBOutlet weak var segmentedControlPassword: UISegmentedControl!
    @IBOutlet weak var btnSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resetView.layer.borderWidth = 1
        resetView.layer.borderColor = UIColor.white.cgColor
        resetView.layer.cornerRadius = 8.0;
        resetView.frame.size.height = resetView.frame.size.height - 70
        btnSubmit.frame.origin.y = btnSubmit.frame.origin.y - 70
        
        viewForgotUserName.backgroundColor = UIColor.clear
        viewForgotPassword.backgroundColor = UIColor.clear
        viewForgotPassword.isHidden = true
        
        txtEmailID.setBottomLine(borderColor: UIColor.black)
        txtMobileNumber.setBottomLine(borderColor: UIColor.black)
        txtOTPNumber.setBottomLine(borderColor: UIColor.black)
        txtUserName.setBottomLine(borderColor: UIColor.black)
        txtPassword.setBottomLine(borderColor: UIColor.black)
        txtConfirmPassword.setBottomLine(borderColor: UIColor.black)
        txtSecurityAnswer.setBottomLine(borderColor: UIColor.black)
        
        let imgEmail = UIImage(named: "mail-ldpi-36X36")
        txtEmailID.leftView = UIImageView(image: imgEmail)
        txtEmailID.leftView?.frame = CGRect(x: 0, y: 0, width: 20 , height:20)
        txtEmailID.leftViewMode = .always
        
        let imgMobile = UIImage(named: "mobile-ldpi-36X36")
        txtMobileNumber.leftView = UIImageView(image: imgMobile)
        txtMobileNumber.leftView?.frame = CGRect(x: 0, y: 0, width: 20 , height:20)
        txtMobileNumber.leftViewMode = .always
        
        let imgUser = UIImage(named: "user-ldpi-36X36")
        txtUserName.leftView = UIImageView(image: imgUser)
        txtUserName.leftView?.frame = CGRect(x: 0, y: 0, width: 20 , height:20)
        txtUserName.leftViewMode = .always
        
        let imgPassword = UIImage(named: "password-ldpi-36X36")
        txtPassword.leftView = UIImageView(image: imgPassword)
        txtPassword.leftView?.frame = CGRect(x: 0, y: 0, width: 20 , height:20)
        txtPassword.leftViewMode = .always
        
        let rightImage = UIImage(named: "arrow-drop-down-small")
        txtSecurityQuestion.rightView = UIImageView(image: rightImage)
        txtSecurityQuestion.rightView?.frame = CGRect(x: 0, y: 0, width: 10 , height:10)
        txtSecurityQuestion.rightViewMode = .always
        txtSecurityQuestion.text = "  Security Question"
        txtSecurityQuestion.borderStyle = UITextField.BorderStyle.none
        
        txtConfirmPassword.leftView = UIImageView(image: imgPassword)
        txtConfirmPassword.leftView?.frame = CGRect(x: 0, y: 0, width: 20 , height:20)
        txtConfirmPassword.leftViewMode = .always
        
        viewSecurityQn.layer.borderWidth = 1
        viewSecurityQn.layer.borderColor = UIColor.white.cgColor
        viewSecurityQn.layer.cornerRadius = 8.0;
        
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                          .font : UIFont.systemFont(ofSize: 14, weight: .regular)]
        txtEmailID.attributedPlaceholder = NSAttributedString(string:" Enter Email", attributes:attributes)
        txtMobileNumber.attributedPlaceholder = NSAttributedString(string:" Enter Mobile Number", attributes:attributes)
        txtUserName.attributedPlaceholder = NSAttributedString(string:" Enter User Name", attributes:attributes)
        txtPassword.attributedPlaceholder = NSAttributedString(string:" Password", attributes:attributes)
        txtConfirmPassword.attributedPlaceholder = NSAttributedString(string:" Confirm Password", attributes:attributes)
        
        txtOTPNumber.attributedPlaceholder = NSAttributedString(string:" OTP", attributes:attributes)
        
        txtSecurityAnswer.attributedPlaceholder = NSAttributedString(string:" Answer", attributes:attributes)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = .white
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
        if (txtPassword.isSecureTextEntry == true) {
            txtPassword.isSecureTextEntry = false
        } else {
            txtPassword.isSecureTextEntry = true
        }
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            viewForgotPassword.isHidden = true
            viewForgotUserName.isHidden = false
            resetView.frame.size.height = resetView.frame.size.height - 70
            btnSubmit.frame.origin.y = btnSubmit.frame.origin.y - 70
        case 1:
            viewForgotPassword.isHidden = false
            viewForgotUserName.isHidden = true
            viewForgotPassword.backgroundColor = UIColor.clear
            segmentedControlPassword.selectedSegmentIndex = 1
            resetView.frame.size.height = resetView.frame.size.height + 70
            btnSubmit.frame.origin.y = btnSubmit.frame.origin.y + 70
        default:
            break;
        }
    }
    
}

