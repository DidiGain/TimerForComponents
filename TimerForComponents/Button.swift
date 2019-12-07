//
//  Button.swift
//  TimerForComponents
//
//  Created by Di Gain on 07/12/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

import UIKit

extension UIButton {
    static func makeButton(_ titleColor: UIColor, title: String, bgcolor: UIColor = .white) -> UIButton {
        let myButton = UIButton(type: .system)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.setTitle(title, for: .normal)
        myButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        myButton.backgroundColor = bgcolor
        myButton.tintColor = titleColor
        myButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 100, bottom: 10, right: 100)
        myButton.layer.cornerRadius = 10
        myButton.layer.borderColor = UIColor.lightGray.cgColor
        myButton.layer.borderWidth = 1.0
        return myButton
    }
}
