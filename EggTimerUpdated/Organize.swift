//
//  Organize.swift
//  EggTimerUpdated
//
//  Created by Andrickson Coste on 1/21/20.
//  Copyright © 2020 Andrickson Coste. All rights reserved.
//

import Foundation
import  UIKit

var vv = ViewController()

func animations() {
    UIView.transition(with: vv.eggImages, duration: 0.75, options: .transitionCrossDissolve, animations: {
        vv.eggImages.image = vv.eggImages.image
    }, completion: nil)
}
