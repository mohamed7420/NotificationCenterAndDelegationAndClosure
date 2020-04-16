//
//  SelectDateViewController.swift
//  NotificationCenterAndDelegationAndClosure
//
//  Created by Mohamed on 4/15/20.
//  Copyright © 2020 Mohamed74. All rights reserved.
//

import UIKit

class SelectDateViewController: UIViewController {

    @IBOutlet weak var labelSelectDate: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var buttonSaveDate: UIButton!
    
    var flag: Bool!
    
    var formatDate: String{
        
        get{
            
            let formatter = DateFormatter()
            
            formatter.dateStyle = .medium
            
            return formatter.string(from: datePicker.date)
            
        }
    }
    
    var formatTime: String{
        
        get{
            
            let formatter = DateFormatter()
            
            formatter.timeStyle = .short
            
            return formatter.string(from: datePicker.date)
        }
        
    }
    
    var onSave: ((_ format: String)-> Void)?
    
    var delegate: PopupDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    
    func setupUI(){
        
        switch flag {
        case true:
            labelSelectDate.text = "Select Date Not Time"
            datePicker.datePickerMode = .date
            break
            
        case false:
            labelSelectDate.text = "Select Time Not Date"
            buttonSaveDate.setTitle("Save Time", for: .normal)
            datePicker.datePickerMode = .time
            break
        default:
            break
        }
    }
    

    @IBAction func buttonSaveDateTapped(_ sender: UIButton) {
        
        
        self.dismiss(animated: true) {
            
//            NotificationCenter.default.post(name: .notificationCenterName, object: self)
            if self.flag{

               // self.onSave?(self.formatDate)
                
                self.delegate?.getValue(self.formatDate)
                
            }else{
                
               // self.onSave?(self.formatTime)
                self.delegate?.getValue(self.formatTime)
            }
        }
    }
}


public extension Notification.Name{
    
    static let notificationCenterName = Notification.Name.init(rawValue: "postFormatDate")
}
