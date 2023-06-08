//
//  DetailScreenInteractor.swift
//  EnergyCostCalculator
//
//  Created by Enes Ketencioglu on 8.06.2023.
//  
//

import Foundation
import CoreData
import UIKit

class DetailScreenInteractor: DetailScreenInteractorProtocol {
    let managedObjectContext: NSManagedObjectContext
    
    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    func saveElectricityData(customerID: String, lastReadings: Int32, invoiceValue: Double) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        // Create a new ElectricityData object
        guard let newElectricityData = NSEntityDescription.insertNewObject(forEntityName: "ElectricityData", into: managedObjectContext) as? ElectricityData else {
            return
        }
        
        // Assign the values
        newElectricityData.customerID = customerID
        newElectricityData.lastReadings = lastReadings
        newElectricityData.invoiceValue = invoiceValue
        
        // Save the changes
        do {
            try managedObjectContext.save()
            print("Electricity bill saved successfully.")
        } catch {
            print("Failed to save electricity bill: \(error.localizedDescription)")
        }
    }
    func fetchDataForSeviceNumber(_ seviceNumber: String) -> [ElectricityData] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }

        let managedObjectContext = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<ElectricityData> = ElectricityData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "customerID == %@", seviceNumber)
        
        // Sort descriptor to sort the results based on lastReadings
        let sortDescriptor = NSSortDescriptor(key: "lastReadings", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]

        do {
            let results = try managedObjectContext.fetch(fetchRequest)
            return results
        } catch {
            print("Failed to fetch data for seviceNumber \(seviceNumber): \(error.localizedDescription)")
            return []
        }
    }
    
    
}
