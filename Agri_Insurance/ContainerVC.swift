//
//  ContainerVC.swift
//  Agri_Insurance
//
//  Created by Reetesh Kumar on 25/11/18.
//  Copyright © 2018 Reetesh Kumar. All rights reserved.
//

import UIKit

class ContainerVC : UIViewController {
    
    // This value matches the left menu's width in the Storyboard
    let leftMenuWidth:CGFloat = 260
    
    // Need a handle to the scrollView to open and close the menu
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var insuranceNavigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        
        // Initially close menu programmatically.  This needs to be done on the main thread initially in order to work.
        DispatchQueue.main.async() {
            self.closeMenu(animated: false)
        }
        
        // Tab bar controller's child pages have a top-left button toggles the menu
        NotificationCenter.default.addObserver(self, selector: #selector(ContainerVC.toggleMenu), name: NSNotification.Name(rawValue: "toggleMenu"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ContainerVC.closeMenuViaNotification), name: NSNotification.Name(rawValue: "closeMenuViaNotification"), object: nil)
        
        // get appearance object
        let navigationAppearance = UINavigationBar.appearance()
        
        // change color of navigation bar background
        navigationAppearance.barTintColor = UIColor.init(red: 242/255, green: 109/255, blue: 18/255, alpha: 1.0)
        
        // change color of navigation bar items (buttons)
        //navigationAppearance.tintColor = UIColor.white
        
    }
    
    // Cleanup notifications added in viewDidLoad
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func toggleMenu() {
        scrollView.contentOffset.x == 0  ? closeMenu() : openMenu()
    }
    
    // This wrapper function is necessary because
    // closeMenu params do not match up with Notification
    @objc func closeMenuViaNotification(){
        closeMenu()
    }
    
    // Use scrollview content offset-x to slide the menu.
    func closeMenu(animated:Bool = true){
        scrollView.setContentOffset(CGPoint(x: leftMenuWidth, y: 0), animated: animated)
    }
    
    // Open is the natural state of the menu because of how the storyboard is setup.
    func openMenu(){
        print("opening menu")
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
}

extension ContainerVC : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollView.contentOffset.x:: \(scrollView.contentOffset.x)")
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollView.isPagingEnabled = true
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollView.isPagingEnabled = false
    }
}
