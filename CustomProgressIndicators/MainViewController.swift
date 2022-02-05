//
//  ViewController.swift
//  CustomProgressIndicators
//
//  Created by Caroline LaDouce on 2/4/22.
//

import UIKit

class MainViewController: UIViewController {
    
    let horizontalProgressBar = HorizontalProgressBar()
    let circularProgressIndicator = CircularProgressIndicator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.\
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(horizontalProgressBar)
        setupHorizontalProgressBar()
        
        
        self.view = view
    }
    
    
    func setupHorizontalProgressBar() {
        horizontalProgressBar.backgroundColor = UIColor.clear
        horizontalProgressBar.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalProgressBarConstraints = [
            horizontalProgressBar.widthAnchor.constraint(equalToConstant: horizontalProgressBar.baseBarWidth),
            horizontalProgressBar.heightAnchor.constraint(equalToConstant: horizontalProgressBar.baseBarHeight),
            horizontalProgressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            horizontalProgressBar.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: view.frame.height * -0.25)
        ]
        
        NSLayoutConstraint.activate(horizontalProgressBarConstraints)
    }
    
    
    func setupCircularProgressIndicator() {
        
        
    }
    
}

