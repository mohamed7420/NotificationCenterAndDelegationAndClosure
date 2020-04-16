//
//  SelectTimeViewController.swift
//  NotificationCenterAndDelegationAndClosure
//
//  Created by Mohamed on 4/15/20.
//  Copyright © 2020 Mohamed74. All rights reserved.
//

import UIKit

class SelectTimeViewController: UIViewController {

    @IBOutlet weak var labelSelectTime: UILabel!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var buttonSaveButton: UIButton!
    
    var flag: Bool!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        
        NotificationCenter.default.addObserver(forName: .notificationCenterName, object: nil, queue: OperationQueue.main) { (notification) in
            
            if let vc = notification.object as? SelectDateViewController{
                    
                self.labelSelectTime.text = vc.formatTime
            }
            
        }

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectTimeSegue"{
            
            if let vc = segue.destination as? SelectDateViewController{
                
                vc.flag = false
//                vc.onSave = {(text) in
//
//                    self.labelSelectTime.text = text
//
//                }
                
                vc.delegate = self
                
                self.present(vc, animated: true)
                
            }
        }
    }

    @IBAction func buttonSaveTimeTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true)
    }
    

}

extension SelectTimeViewController: PopupDelegate{
    
    
    func getValue(_ value: String) {
        
        labelSelectTime.text = value
    }
}
