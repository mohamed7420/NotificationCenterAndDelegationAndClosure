//
//  ViewController.swift
//  NotificationCenterAndDelegationAndClosure
//
//  Created by Mohamed on 4/15/20.
//  Copyright © 2020 Mohamed74. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSelectDate: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(getPostedData(notification:)), name: .notificationCenterName, object: nil)
        
//        NotificationCenter.default.addObserver(forName: .notificationCenterName, object: nil, queue: OperationQueue.main) { (notification) in
//
//            if let vc = notification.object as? SelectDateViewController{
//
//                self.labelSelectDate.text = vc.formatDate
//            }
//        }
        
      
    }
    
//    @objc func getPostedData(notification: NSNotification){
//
//        if let vc = notification.object as? SelectDateViewController{
//
//            labelSelectDate.text = vc.formatDate
//            
//        }
//    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectDateSegue"{
            
            if let vc = segue.destination as? SelectDateViewController{
                    
                vc.flag = true
                
//                vc.onSave = { text in
//
//                    self.labelSelectDate.text = text
//                }
                
                vc.delegate = self
                
                self.present(vc, animated: true)
            }
        }
        
    }
    
  

}

extension ViewController: PopupDelegate{
    
    
    func getValue(_ value: String) {
        
        labelSelectDate.text = value
    }
    
    
    
}
