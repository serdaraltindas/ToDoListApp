//
//  DetailsViewController.swift
//  toDoListApp
//
//  Created by Serdar Altındaş on 23.04.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var bedenTextField: UITextField!
    @IBOutlet weak var fiyatTextField: UITextField!
    @IBOutlet weak var isimTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //close keyboard.
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(klavyeyiKapat))
        view.addGestureRecognizer(gestureRecognizer)
        
    }
    @objc func klavyeyiKapat(){
        //aksiyonları kapat.
        view.endEditing(true)
    }
    
    @IBAction func kaydetButtonTiklandi(_ sender: UIButton) {
        
    }
    
}
