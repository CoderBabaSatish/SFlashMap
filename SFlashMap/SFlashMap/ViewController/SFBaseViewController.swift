//
//  SFBaseViewController.swift
//  SFlashMap
//
//  Created by Satish on 3/25/19.
//  Copyright © 2019 Satish. All rights reserved.
//

import Foundation
import UIKit
import JGProgressHUD

/**
 * SFBaseViewController - It is se as base view controller
 * it have basic method
 */
class SFBaseViewController: UIViewController {

    var hud: JGProgressHUD! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /**
     * viewDidAppear override method call
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func showProgressView() -> Void {
        
        hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Loading"
        hud.show(in: self.view)
    }
    
    func hideProgressView() -> Void {
        hud.dismiss(afterDelay: 0.0)

    }
}
