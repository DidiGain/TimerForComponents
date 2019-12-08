//
//  ViewController.swift
//  TimerForComponents
//
//  Created by Di Gain on 05/12/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let timeLabel = UILabel.makeLabel("0")
    let startButton = UIButton.makeButton(.red, title: "Start")
    let stopButton = UIButton.makeButton(.lightGray, title: "Stop")
    var timer = Timer()
    var dayStart = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(stopButtonPressed), for: .touchUpInside)
    }
    
    @objc func startButtonPressed() {
        let alert = UIAlertController(title: "Start", message: "Enter number of days", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { [unowned alert] _ in
            guard let dayNumber = alert.textFields?.first?.text, !dayNumber.isEmpty else { return }
                let day: TimeInterval = 3
                self.timer = Timer.scheduledTimer(withTimeInterval: day, repeats: true, block: { (timer) in
                    if dayNumber == self.timeLabel.text {
                        timer.invalidate()
                        self.setInitialScreen()
                    }
                    else if Int(dayNumber)! > self.dayStart {
                        self.dayStart += 1
                        self.timeLabel.text = "\(self.dayStart)"
                    }
                    
                })
                self.startButton.isHidden = true
                self.stopButton.isHidden = false
            }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        alert.addTextField { (textField) in
            textField.placeholder = "days"
            textField.keyboardType = .numberPad
        }
        present(alert, animated: true)
    }
    
    @objc func stopButtonPressed() {
        self.stopButton.isHidden = true
        self.startButton.isHidden = false
        setInitialScreen()
        timer.invalidate()
    }

    func setInitialScreen() {
        dayStart = 0
        timeLabel.text = "0"
        startButton.isHidden = false
        stopButton.isHidden = true
    }
    
    func setupLayouts() {
        view.addSubview(timeLabel)
        view.addSubview(startButton)
        view.addSubview(stopButton)
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: stopButton.topAnchor, constant: -20),
        ])
    }

}
