//
//  UIViewController+Ext.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/1/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentRCAlert(title: String, message: String, buttonTitle: String) {
        let alertVC = RCAlertVC(title: title, message: message, buttonTitle: buttonTitle)
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        self.present(alertVC, animated: true)
    }
    
    
    open override func awakeAfter(using coder: NSCoder) -> Any? {
        navigationItem.backButtonDisplayMode = .minimal // This will help us to remove text
        return super.awakeAfter(using: coder)
    }
    
}
