//
//  detayViewController.swift
//  havadurumuhomework
//
//  Created by Ali Elverir on 13.01.2023.
//

import UIKit

class detayViewController: UIViewController {

    var sehir = String()
    
    @IBOutlet weak var sehirIsim: UILabel!
    
    @IBOutlet weak var aciklama: UILabel!
    
    @IBOutlet weak var havaSonnuc: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        sehirIsim.text = sehir
        getTodayResult(sehirIsim: sehir)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden=false
    }


    func getTodayResult(sehirIsim: String){
        if   let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(sehirIsim)&appid=1182335834af9798f6eb1cf41a62373a"){
            let istek = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: istek){(data,response,error) in
                if error == nil {
                    if let gelenVeri = data {
                        
                        do {
                            let json = try JSONSerialization.jsonObject(with: gelenVeri, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                          //  print(json)
                            
                            if let ana = json["main"] as? NSDictionary {
                                if let sicaklik = ana["temp"] as? Double {
                                    let durum = Int(sicaklik - 273.15)
                                    DispatchQueue.main.sync{
                                        self.havaSonnuc.text = String(durum)
                                        
                                       
                                        //
                                        
                                    }
                                    
                                }
                            
                            }
                            
                            if let wt = json["weather"] as? [[String:Any]] {
                              if let ds = wt[0]["description"] as? String{
                                DispatchQueue.main.sync {
                                  self.aciklama.text = ds
                                }
                              }
                            }

                            
                        
                            

                            
                         
                            
                            
                            
                            
                            
                


                        }catch{
                            print("bir hata oluştu")
                        }
                        
                    }
                }
            }
            
            task.resume()
        }
    }

}
