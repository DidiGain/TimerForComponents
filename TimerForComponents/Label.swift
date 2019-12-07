//
//  Label.swift
//  TimerForComponents
//
//  Created by Di Gain on 05/12/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

import UIKit

extension UILabel {
    static func makeLabel(_ text: String) -> UILabel {
        let myLabel = UILabel()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.font = UIFont(name: "Helvetica", size: 25)
        myLabel.numberOfLines = 0
        myLabel.text = text
        return myLabel
    }
}
