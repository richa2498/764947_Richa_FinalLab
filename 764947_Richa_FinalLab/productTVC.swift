//
//  productTVC.swift
//  764947_Richa_FinalLab
//
//  Created by Richa Patel on 2020-01-24.
//  Copyright © 2020 Richa Patel. All rights reserved.
//

import UIKit
import CoreData

class productTVC: UITableViewController {
    
 //var vc: ViewController?
    var p : Product?
 let appDelegate = UIApplication.shared.delegate as! AppDelegate
 var results : [NSManagedObject]?
    var selI = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //addCoreDat()
        loadCoreData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
   
    func loadCoreData() {
         
           let managedContext = appDelegate.persistentContainer.viewContext

           let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductList")

           do {
               results = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
               
                   for result in results as! [NSManagedObject] {
                       let name = result.value(forKey: "name") as! String
                       let id = result.value(forKey: "id") as! Int
                       let price = result.value(forKey: "price") as! Int
                       let desc = result.value(forKey: "desc") as! String
                       print(name)
                    Product.list.append(Product(name: name, price: price, id: id, desc: desc))
                   }
               
           } catch {
               print(error)
           }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Product.list.count ?? 0
    }
    func getProduct()->Product{
        
        return p!
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let p = Product.list[indexPath.row]
        cell.textLabel?.text = p.name
        cell.detailTextLabel?.text = "\(p.price)"
            
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        p = Product.list[indexPath.row]
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func unwindToHome(_ unwindSegue: UIStoryboardSegue) {
        
        
        // Use data from the view controller which initiated the unwind segue
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
   

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
                   if var vc = segue.destination as? ViewController {
                    vc.dele = self
                    
                   }
               }
    
  

}
