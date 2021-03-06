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
    let progressButton = UIButton(type: UIButton.ButtonType.system)
    public var progress: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.\
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(horizontalProgressBar)
        setupHorizontalProgressBar()
        
        view.addSubview(circularProgressIndicator)
        setupCircularProgressIndicator()
        
        view.addSubview(progressButton)
        setupProgressButton()
        
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
        
        horizontalProgressBar.createAnimation()
    }
    
    
    func setupCircularProgressIndicator() {
        circularProgressIndicator.backgroundColor = UIColor.clear
        circularProgressIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        let circularProgressIndicatorConstraints = [
            circularProgressIndicator.widthAnchor.constraint(equalToConstant: circularProgressIndicator.baseCircleWidth),
            circularProgressIndicator.heightAnchor.constraint(equalToConstant: circularProgressIndicator.baseCircleHeight),
            circularProgressIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circularProgressIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(circularProgressIndicatorConstraints)
        
        circularProgressIndicator.createGradientAnimation()
    }
    
    
    func setupProgressButton() {
        progressButton.addTarget(self, action: #selector(progressButtonTapped), for: .touchUpInside)
        progressButton.setTitle("+ PROGRESS", for: .normal)
        
        progressButton.translatesAutoresizingMaskIntoConstraints = false
        let progressButtonConstraints = [
            progressButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: view.frame.height / 4)
        ]
        NSLayoutConstraint.activate(progressButtonConstraints)
    }
    
    
    func checkProgress() {
        if progress >= 10 {
            print("PROGRESS IS >= 10 : \(progress)")
            
            self.progress = 0
        } else {
            self.progress += 1
        }
    }
    
    
    func refreshProgressButtonTitle() {
        if progress == 10 {
            progressButton.setTitle("CLICK TO RESET", for: .normal)
        } else {
            progressButton.setTitle("+ PROGRESS", for: .normal)
        }
    }
    
    
    @objc func progressButtonTapped(_ sender: UIButton) {
        print("Button Tapped")
        checkProgress()
        horizontalProgressBar.progress = CGFloat(progress)
        circularProgressIndicator.progress = CGFloat(progress)
        refreshProgressButtonTitle()
    }
    
}

