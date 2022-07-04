//
//  ChildViewControllerHolder.swift
//  NutsAndBolts
//
//  Created by Emel Topaloglu on 3/10/17.
//  Copyright © 2017 Swenson He. All rights reserved.
//

import Foundation

public protocol ChildViewControllerHolder {
    var containerView: ContainerView { get }
     func cycleFromViewController(_ oldViewController: UIViewController?, toViewController newViewController: UIViewController, completion: @escaping (_ completed: Bool) -> Void)
}

public extension ChildViewControllerHolder where Self: UIViewController {
    func cycleFromViewController(_ oldViewController: UIViewController?, toViewController newViewController: UIViewController, completion: @escaping (_ completed: Bool) -> Void) {
        
        newViewController.view.translatesAutoresizingMaskIntoConstraints = false
        newViewController.willMove(toParent: self)
        oldViewController?.willMove(toParent: nil)
        containerView.embedView(view: newViewController.view)
        self.addChild(newViewController)
        newViewController.view.alpha = 0
        newViewController.view.layoutIfNeeded()
        UIView.animate(withDuration: (oldViewController != nil) ? 0.3 : 0.0, animations: {
            newViewController.view.alpha = 1
            oldViewController?.view.alpha = 0
        },
                       completion: { finished in
                        oldViewController?.view.removeFromSuperview()
                        oldViewController?.removeFromParent()
                        newViewController.didMove(toParent: self)
                        completion(finished)
        })
    }
}
