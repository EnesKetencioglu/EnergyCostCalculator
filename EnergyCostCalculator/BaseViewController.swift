//
//  BaseViewController.swift
//  EnergyCostCalculator
//
//  Created by Enes Ketencioglu on 8.06.2023.
//

import UIKit

class BaseViewController: UIViewController {
    private let loadingIndicatorView = UIView()
    private let activityIndicatorView = UIActivityIndicatorView(style: .large)

    func showLoadingAnimation() {
        activityIndicatorView.startAnimating()
        loadingIndicatorView.isHidden = false
    }

    func hideLoadingAnimation() {
        loadingIndicatorView.isHidden = true
    }
    override func viewDidLoad() {
        setupLoadingIndicator()
    }
    private func setupLoadingIndicator() {
        loadingIndicatorView.frame = view.frame
        loadingIndicatorView.backgroundColor = .darkGray
        loadingIndicatorView.alpha = 0.5
        loadingIndicatorView.isHidden = true
        
        activityIndicatorView.center = CGPoint(
            x: UIScreen.main.bounds.size.width / 2,
            y: UIScreen.main.bounds.size.height / 2
        )
        activityIndicatorView.color = .white
        activityIndicatorView.hidesWhenStopped = true
        
        loadingIndicatorView.addSubview(activityIndicatorView)
        view.addSubview(loadingIndicatorView)
    }
}
