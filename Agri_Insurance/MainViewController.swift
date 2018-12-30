//
//  MainViewController.swift
//  Agri_Insurance
//
//  Created by Reetesh Kumar on 25/11/18.
//  Copyright © 2018 Reetesh Kumar. All rights reserved.
//

import UIKit

class MainViewController : UIViewController {
    
    override func viewDidLoad() {
        
        // Sent from LeftMenu
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.openPushWindow), name: NSNotification.Name(rawValue: "openPushWindow"), object: nil)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "closeMenuViaNotification"), object: nil)
        view.endEditing(true)
    }
    
    @objc func openPushWindow(){
        performSegue(withIdentifier: "openPushWindow", sender: nil)
    }
    
    @IBAction func toggleMenu(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "toggleMenu"), object: nil)
    }
    
}
