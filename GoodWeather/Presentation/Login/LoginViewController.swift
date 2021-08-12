//
//  LoginViewController.swift
//  GoodWeather
//
//  Created by Nika Reshanova on 09.08.2021.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var titleImageView: UIImageView!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //жест тапа по скролу
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeybord))
        scrollView?.addGestureRecognizer(tapGesture)
    }
    
    @IBAction private func enterButtonPressed(_ sender: UIButton) {
        
    }
    
    private func showAlert(title: String, message: String){
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let closeAction = UIAlertAction(title: "OK",
                                        style: .cancel) { [weak self] _ in
            guard let self = self else { return }
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        }
        alertController.addAction(closeAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func demoButtonPressed(_ sender: UIButton) {
   performSegue(withIdentifier: "demoLoginSegue", sender: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //получаем логин
        if identifier == "loginSegue" {
            let loginText = loginTextField.text
            
            //получаем пароль
            let passwordText = passwordTextField.text
            
            if loginText == "a" && passwordText == "a" {
                print("SUCCESS!")
                return true
            } else {
                print("Error login or password")
                showAlert(title: "ERROR", message: "Wrong login or password")
                return false
            }
        } else {
            return true
        }
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "demoLoginSegue" {
        let destinationController = segue.destination as! UITabBarController
        destinationController.viewControllers?.forEach {$0.view.backgroundColor = .lightGray}
        // пример использования
        }
    }
    
    @IBAction func logout(_ segue: UIStoryboardSegue){
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    @objc func hideKeybord() {
        self.scrollView?.endEditing(true)
    }
    
        // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }

}
