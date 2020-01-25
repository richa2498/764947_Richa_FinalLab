//
//  ViewController.swift
//  764947_Richa_FinalLab
//
//  Created by Richa Patel on 2020-01-24.
//  Copyright © 2020 Richa Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var view_btn: UIButton!
    
    @IBOutlet weak var desc_lbl: UILabel!
    @IBOutlet weak var id_lbl: UILabel!
    @IBOutlet weak var name_lbl: UILabel!
    @IBOutlet weak var price_lbl: UILabel!
    
    var  selectedProduct: Product?
    var dele : productTVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        selectedProduct = dele?.getProduct()
        
        if Product.list.count > 9{
            return
        }else{
        Product.list.append(Product(name: "Ppesi", price: 5, id: 1, desc: "i love to drnik"))
        Product.list.append(Product(name: "chocolate", price: 58, id: 2, desc: "i love to eat"))
        Product.list.append(Product(name: "ice cream", price: 5, id: 3, desc: "i love to eat"))
        Product.list.append(Product(name: "pizza", price: 5, id: 4, desc: "i love to eat"))
        Product.list.append(Product(name: "Cola", price: 5, id: 5, desc: "i love to drnik"))
        Product.list.append(Product(name: "pop corn", price: 5, id: 6, desc: "i love to eat"))
        Product.list.append(Product(name: "Ppesi", price: 5, id: 7, desc: "i love to drnik"))
            Product.list.append(Product(name: "wings", price: 5, id: 8, desc: "i love to eats"))
            Product.list.append(Product(name: "ok", price: 5, id: 9, desc: "i love to no"))
            Product.list.append(Product(name: "dry", price: 5, id: 10, desc: "i love to drink"))
        }
        //print(Product.list)
        view_btn.isHidden = false
    
    
  }
    
    override func viewDidAppear(_ animated: Bool) {
        if selectedProduct == nil{
            selectedProduct = Product.list.first
          
        }
       
        name_lbl.text = selectedProduct?.name
        id_lbl.text = "\(selectedProduct!.id)"
        price_lbl.text = "\(selectedProduct!.price)"
        desc_lbl.text = selectedProduct?.desc
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if sender is UIButton{
//            if let tvc = segue.destination as? productTVC {
//                tvc.vc = self
//            }
//        }
    }


}

