//
//  LeftMenu.swift
//  Agri_Insurance
//
//  Created by Reetesh Kumar on 25/11/18.
//  Copyright © 2018 Reetesh Kumar. All rights reserved.
//

import UIKit

class LeftMenu : UITableViewController {
    
    let kHeaderSectionTag: Int = 6900;
    
    var expandedSectionHeaderNumber: Int = -1
    var expandedSectionHeader: UITableViewHeaderFooterView!
    var sectionNames: Array<Any> = []
    var sectionItems: Array<Any> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionNames = [ "Logout", "Home", "New Insurance", "Receipt and Payments", "Existing Insurance", "Status", "Claim Initiation", "Request", "My Documents", "Reports", "Refund of Claim", "Product Information", "Check Eligibilty"];
        sectionItems = [ [],[],[],["Money Receipts","Pay Preview","Create New Farmer","Pay History","Coinsurrent Payment","Disburasals"],[],["Status1","Status2"],[],["Request1","Request2"],[],["Reports1","Reports2"],[],[],[],];
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let viewNavBar = UIView(frame: CGRect(
            origin: CGPoint(x:0, y:0), size: CGSize(width: self.view.frame.width, height: 100)
        ))
        viewNavBar.backgroundColor = UIColor.init(red: 242/255, green: 109/255, blue: 18/255, alpha: 1.0)
        
        
        let androidImageView = UIImageView(frame: CGRect(x: viewNavBar.frame.width/2-20, y: 10, width: 50, height: 50));
        androidImageView.image = UIImage(named: "android_icon1")
        viewNavBar.addSubview(androidImageView)
        
        let androidLabel = UILabel(frame: CGRect(x:viewNavBar.frame.width/2-50, y:60, width:200, height:20))
        androidLabel.textColor = UIColor.white
        androidLabel.font = UIFont.boldSystemFont(ofSize: 18)
        androidLabel.text = "Android Studio"
        viewNavBar.addSubview(androidLabel)
        
        self.navigationController?.navigationBar.addSubview(viewNavBar)
        
        self.tableView.contentInset = UIEdgeInsets(top: 55, left: 0, bottom: 0, right: 0)
        
    }
    
    func switchToViewController(identifier: String) {
        //let storyboard = UIStoryboard(name: "MyStoryboardName", bundle: nil)
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: identifier)
        self.present(viewController!, animated: true, completion: nil)
    }

    // MARK: - Tableview Methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if sectionNames.count > 0 {
            tableView.backgroundView = nil
            return sectionNames.count
        } else {
            let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
            messageLabel.text = "Retrieving data.\nPlease wait."
            messageLabel.numberOfLines = 0;
            messageLabel.textAlignment = .center;
            messageLabel.font = UIFont(name: "HelveticaNeue", size: 20.0)!
            messageLabel.sizeToFit()
            self.tableView.backgroundView = messageLabel;
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.expandedSectionHeaderNumber == section) {
            let arrayOfItems = self.sectionItems[section] as! NSArray
            return arrayOfItems.count;
        } else {
            return 0;
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (self.sectionNames.count != 0) {
            if (section == 0) {
                return ""
            }
            return self.sectionNames[section] as? String
        }
        return ""
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0;
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 0;
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //recast your view as a UITableViewHeaderFooterView
        
        let sectionData = self.sectionItems[section] as! NSArray
        self.expandedSectionHeaderNumber = -1;
        
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor.lightGray
        header.textLabel?.textColor = UIColor.black
        
        if (sectionData.count == 0) {
            header.contentView.backgroundColor = UIColor.clear
            header.textLabel?.textColor = UIColor.black
            if(section == 0) {
                header.contentView.backgroundColor = UIColor.init(red: 151/255, green: 68/255, blue: 15/255, alpha: 1.0)
                header.textLabel?.textColor = UIColor.white
                let logoutImageView = UIImageView(frame: CGRect(x: 10, y: 13, width: 18, height: 18));
                logoutImageView.image = UIImage(named: "logout")
                header.addSubview(logoutImageView)
                let label = UILabel(frame: CGRect(x:40, y:0, width:header.frame.size.width, height:header.frame.size.height))
                label.textColor = UIColor.white
                label.font = UIFont.boldSystemFont(ofSize: 18)
                label.text = "Logout"
                header.addSubview(label)
            }
        } else {
            if let viewWithTag = self.view.viewWithTag(kHeaderSectionTag + section) {
                viewWithTag.removeFromSuperview()
            }
            let headerFrame = self.view.frame.size
            let theImageView = UIImageView(frame: CGRect(x: headerFrame.width - 32, y: 13, width: 18, height: 18));
            theImageView.image = UIImage(named: "dropdown-arrow")
            theImageView.tag = kHeaderSectionTag + section
            header.addSubview(theImageView)
        }
        
        // make headers touchable
        header.tag = section
        let headerTapGesture = UITapGestureRecognizer()
        headerTapGesture.addTarget(self, action: #selector(self.sectionHeaderWasTouched(_:)))
        header.addGestureRecognizer(headerTapGesture)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        let section = self.sectionItems[indexPath.section] as! NSArray
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.text = section[indexPath.row] as? String
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Expand / Collapse Methods
    
    @objc func sectionHeaderWasTouched(_ sender: UITapGestureRecognizer) {
        let headerView = sender.view as! UITableViewHeaderFooterView
        let section    = headerView.tag
        let eImageView = headerView.viewWithTag(kHeaderSectionTag + section) as? UIImageView
        
        print("section",section)
        
        //let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        
        let sectionData = self.sectionItems[section] as! NSArray
        
        if (section == 0) {
            self.switchToViewController(identifier: "loginViewController")
        }
        
        if (self.expandedSectionHeaderNumber == -1 && sectionData.count != 0) {
            self.expandedSectionHeaderNumber = section
            tableViewExpandSection(section, imageView: eImageView!)
            headerView.contentView.backgroundColor = UIColor.gray
            headerView.textLabel?.textColor = UIColor.white
        } else if (self.expandedSectionHeaderNumber != -1 && sectionData.count != 0) {
            headerView.contentView.backgroundColor = UIColor.lightGray
            headerView.textLabel?.textColor = UIColor.black
            if (self.expandedSectionHeaderNumber == section) {
                tableViewCollapeSection(section, imageView: eImageView!)
            }
        }
    }
    
    func tableViewCollapeSection(_ section: Int, imageView: UIImageView) {
        let sectionData = self.sectionItems[section] as! NSArray
        
        self.expandedSectionHeaderNumber = -1;
        if (sectionData.count == 0) {
            return;
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                imageView.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(Double.pi)) / 180.0)
            })
            var indexesPath = [IndexPath]()
            for i in 0 ..< sectionData.count {
                let index = IndexPath(row: i, section: section)
                indexesPath.append(index)
            }
            self.tableView!.beginUpdates()
            self.tableView!.deleteRows(at: indexesPath, with: UITableView.RowAnimation.fade)
            self.tableView!.endUpdates()
        }
    }
    
    func tableViewExpandSection(_ section: Int, imageView: UIImageView) {
        let sectionData = self.sectionItems[section] as! NSArray
        
        if (sectionData.count == 0) {
            self.expandedSectionHeaderNumber = -1;
            return;
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                imageView.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(Double.pi)) / 180.0)
            })
            var indexesPath = [IndexPath]()
            for i in 0 ..< sectionData.count {
                let index = IndexPath(row: i, section: section)
                indexesPath.append(index)
            }
            self.expandedSectionHeaderNumber = section
            self.tableView!.beginUpdates()
            self.tableView!.insertRows(at: indexesPath, with: UITableView.RowAnimation.fade)
            self.tableView!.endUpdates()
        }
    }
    
}
