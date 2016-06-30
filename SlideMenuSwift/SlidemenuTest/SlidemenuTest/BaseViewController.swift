//
//  BaseViewController.swift
//  SlidemenuTest
//
//  Created by Ranjan Sahu on 6/8/16.
//  Copyright © 2016 Foodjets. All rights reserved.
//

import UIKit

extension BaseViewController: SlideOutDelegate {
    func slideMenuDidSelectRowAtIndex(indexpath:NSIndexPath) {
      print("Index path : \(indexpath.row)")
        self.slideMenuAction(nil)
        let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
    }
}
class BaseViewController: UIViewController {
    var slideMenu : SlideOutViewController!
    var arect = UIScreen.mainScreen().bounds
    let slidePanelExpandedOffset: CGFloat = 60
    var isSlideOpen :Bool = false
    var window: UIWindow?

    override func viewDidLoad() {
        super.viewDidLoad()
        window = UIApplication .sharedApplication().keyWindow
        slideMenu = SlideOutViewController.sharedInstance
        slideMenu.view.frame = arect
        
        window?.addSubview(slideMenu.view)
        // window?.bringSubviewToFront(slideMenu.view)
        window?.sendSubviewToBack(slideMenu.view)

        slideMenu.delegateSlide = self

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    @IBAction func slideMenuAction(sender: AnyObject?) {
        let vC =  UIApplication.sharedApplication().keyWindow?.rootViewController
        
        if !isSlideOpen {
            self.arect.origin.x = UIScreen.mainScreen().bounds.width - self.slidePanelExpandedOffset
            
            UIView.animateWithDuration(0.7, delay: 0.0, options: .CurveEaseOut, animations: {
                vC!.view.frame = self.arect
                },
                                       completion: { finished in
                                        self.isSlideOpen = true
                                        
            })
            
        }else{
            self.arect.origin.x = UIScreen.mainScreen().bounds.origin.x
            
            UIView.animateWithDuration(0.7, delay: 0.0, options: .CurveEaseOut, animations: {
                vC!.view.frame = self.arect
                },
           completion: { finished in
            self.isSlideOpen = false
            
            })
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
