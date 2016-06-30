//
//  SlideOutViewController.swift
//  SlidemenuTest
//
//  Created by Ranjan Sahu on 6/8/16.
//  Copyright © 2016 Foodjets. All rights reserved.
//

import UIKit

@objc
protocol SlideOutDelegate {
    optional func slideMenuDidSelectRowAtIndex(indexpath:NSIndexPath)
}

class SlideOutViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var delegateSlide: SlideOutDelegate?
    
    
    class var sharedInstance: SlideOutViewController {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: SlideOutViewController? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = SlideOutViewController()
        }
        return Static.instance!
    }
    
    @IBOutlet weak var tblMenu: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "MenuCell"
        var cell: MenuTableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? MenuTableViewCell
        
        if cell == nil {
            tableView.registerNib(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? MenuTableViewCell
        }
        cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"


        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        delegateSlide?.slideMenuDidSelectRowAtIndex!(indexPath)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
