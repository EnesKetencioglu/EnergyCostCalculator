//
//  FirstScreenPresenter.swift
//  EnergyCostCalculator
//
//  Created by Enes Ketencioglu on 8.06.2023.
//  
//

import Foundation

class FirstScreenPresenter: FirstScreenPresenterProtocol {
    var view: FirstScreenViewController?
    var interactor: FirstScreenInteractor?
    var router: FirstScreenRouter?
    
    
    func submitClicked(serviceNumber: String, currentMeter: Int?) {
        guard !serviceNumber.isEmpty && serviceNumber.count == 10 else{
            view?.showServiceAlert()
            return
        }
        guard currentMeter != nil && currentMeter! > 0 else{
            view?.showMeterAlert()
            return
        }
      
        if let results = interactor?.fetchDataForSeviceNumber(serviceNumber),!results.isEmpty{
            if (results.last!.lastReadings) > currentMeter!{
                print((results.last!.lastReadings))
                view?.showMeterAlert(lastRead: Int((results.last!.lastReadings)))
                return
            }
        }
        router?.navigateToDetailScreen(serviceNumber: serviceNumber, currentMeter: currentMeter)
        view?.hideLoadingAnimation()
    }
}
