//
//  ViewController.swift
//  havadurumuhomework
//
//  Created by Ali Elverir on 13.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buton: UIButton!
    @IBOutlet weak var metinalan: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buton.layer.cornerRadius = 6
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden=true
    }

    @IBAction func buton(_ sender: Any) {
        let sehir = metinalan.text ?? ""
        
        if sehir.isEmpty{
            let uyarı=UIAlertController(title:" Warning", message: "Please enter the city name ", preferredStyle: .alert)
            
            let iptalButon = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            uyarı.addAction(iptalButon)
            self.present(uyarı, animated: true,completion: nil)
        }else{
            let gk = self.storyboard?.instantiateViewController(identifier: "detayViewController") as! detayViewController
            
            gk.sehir = sehir
            self.show(gk, sender: nil)
        }
        
        
    }
}

