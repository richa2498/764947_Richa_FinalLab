//
//  productADD.swift
//  764947_Richa_FinalLab
//
//  Created by Richa Patel on 2020-01-24.
//  Copyright © 2020 Richa Patel. All rights reserved.
//

import UIKit
import CoreData

class productADD: UIViewController {
 let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var udescription: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var name: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ADD(_ sender: Any) {
        
      
               let context = appDelegate.persistentContainer.viewContext

        var  presentTask = NSEntityDescription.insertNewObject(forEntityName: "ProductList", into: context)
             
        presentTask.setValue("\(name.text!)", forKey: "name")
        presentTask.setValue( "\(udescription.text!)", forKey:"desc")
        presentTask.setValue(Int(price.text!), forKey: "price")
        presentTask.setValue(Int(id.text!), forKey:"id")
               
               do{
                   try context.save()
                   print(presentTask)
               }catch{
                   print(error)
               }
           
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
