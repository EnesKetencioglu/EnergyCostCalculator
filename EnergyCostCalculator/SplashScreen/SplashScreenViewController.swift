//
//  SplashScreenViewController.swift
//  EnergyCostCalculator
//
//  Created by Enes Ketencioglu on 8.06.2023.
//

import Foundation
import UIKit
class SplashScreenViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let vc = FirstScreenRouter.createModule()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
}
