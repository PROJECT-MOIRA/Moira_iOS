//
//  BaseRegisterViewController.swift
//  Moira_iOS
//
//  Created by Dev.Young on 08/08/2020.
//

import UIKit

class BaseRegisterViewController: UIViewController {
    
    @IBOutlet weak var buttonConstraint: NSLayoutConstraint!
    @IBOutlet weak var textField:UITextField!
    
    func initData(buttonConstraint:NSLayoutConstraint,textField: UITextField?){
        self.buttonConstraint = buttonConstraint
        self.textField = textField
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyboardNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.setAnimationsEnabled(false)
        textField?.becomeFirstResponder()
        UIView.setAnimationsEnabled(true)
    }
    
    private func addKeyboardNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let keybordFrm = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else{
                return
        }
        
        var safeBot: CGFloat = 0
        if let uBot = UIApplication.shared.windows.first?.safeAreaInsets.bottom { safeBot = uBot }
        let newHeight: CGFloat = keybordFrm.height - safeBot
        
        UIView.setAnimationsEnabled(false)
        self.buttonConstraint.constant = newHeight+10
        self.view.layoutIfNeeded()
        UIView.setAnimationsEnabled(true)
        
        
//        UIView.animate(withDuration: duration, delay: 0, options: UIView.AnimationOptions(rawValue: aniType),
//                       animations: {
//
//        },completion: nil)
    }
    
    @objc private func keyboardWillHide(_ noti: Notification){
        
        UIView.setAnimationsEnabled(false)
        self.buttonConstraint.constant = 10
        self.view.layoutIfNeeded()
        UIView.setAnimationsEnabled(true)
        
//        UIView.animate(withDuration: duration, delay: 0, options: UIView.AnimationOptions(rawValue: aniType),
//                       animations: {
//
//        },completion: nil)
    }
}
