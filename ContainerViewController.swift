//
//  ContainerViewController.swift
//  GatorFeed
//
//  Created by Calvin Nisbet on 2015-10-03.
//  Copyright © 2015 Lone Pine Creative. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    var viewController: UISplitViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController!, ontoPrimaryViewController primaryViewController: UIViewController!) -> Bool {
        
        return true
    }
    
    
    func setEmbeddedViewController(splitViewController: UISplitViewController!) {
        if splitViewController != nil{
            viewController = splitViewController
            self.addChildViewController(viewController)
            self.view.addSubview(viewController.view)
            viewController.didMoveToParentViewController(self)
            self.setOverrideTraitCollection(UITraitCollection(horizontalSizeClass: UIUserInterfaceSizeClass.Regular), forChildViewController: viewController)
        }
    }
    
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        if size.width > size.height {
            self.setOverrideTraitCollection(UITraitCollection(horizontalSizeClass: UIUserInterfaceSizeClass.Regular), forChildViewController: viewController)
        } else {
            self.setOverrideTraitCollection(nil, forChildViewController: viewController)
        }
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
