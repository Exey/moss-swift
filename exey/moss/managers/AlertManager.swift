//
//  AlertManager.swift
//  Created by Exey Panteleev
//

import UIKit

class AlertManager {
    
    static func createOkCancel(title:String, message:String, ok:String, cancel:String, okHandler:(UIAlertAction!, UIAlertController) -> Void)->UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: ok, style: .Default) { action in
            okHandler(action, alert)
        }
        let cancelAction = UIAlertAction(title: cancel,
            style: .Default) { (action: UIAlertAction!) -> Void in
                // Empty
        }
        alert.addTextFieldWithConfigurationHandler{ textField in }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        return alert
    }
    
}