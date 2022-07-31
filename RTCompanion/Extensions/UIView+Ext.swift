//
//  UIView+Ext.swift
//  RTCompanion
//
//  Created by Christian Diaz on 7/27/22.
//

import UIKit

extension UIView {
    
    func addSubViews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
