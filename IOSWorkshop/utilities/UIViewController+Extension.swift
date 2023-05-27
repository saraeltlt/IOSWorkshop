//
//  UIViewController+Extension.swift
//  IOSWorkshop
//
//  Created by Eslam gamal on 27/05/2023.
//

import Foundation
import UIKit

extension UIViewController{
    func showAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           present(alert, animated: true)
           Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
               alert.dismiss(animated: true, completion: nil)
           }
    }
}
