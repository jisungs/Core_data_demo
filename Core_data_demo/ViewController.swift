//
//  ViewController.swift
//  Core_data_demo
//
//  Created by The book Air on 30/09/2019.
//  Copyright © 2019 jisung. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("jisung", forKey: "username")
        newUser.setValue("12345", forKey: "password")
        newUser.setValue(37, forKey: "age")
        
        
        do{
            
            try context.save()
            
            print("Save successed!!")
            
        }catch{
            
            print("Ther was an error \(error)")
        }
        
        
        //Request section
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    if let username = result.value(forKey: "username") as? String {
                        print(username)
                        
                    }else {
                        
                        print("There is no results when requesting data")
                    }
                }
            }
            
        }catch{
            
            print("There was an error occured\(error)")
            
        }
        
        
        
    }//end of Viewdidload
    
        

    

}//end of viewController

