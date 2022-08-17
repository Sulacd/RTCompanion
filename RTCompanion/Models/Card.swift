//
//  Card.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/1/22.
//

import Foundation
import UIKit

struct Card: Hashable {
    let cardFace: UIImage?
    let name: String
    let category: Category
    let manaCost: String
    let description: String
    let region: String
    let identifier = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
