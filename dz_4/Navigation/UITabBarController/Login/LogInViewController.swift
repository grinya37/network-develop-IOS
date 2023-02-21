//
//  LogInViewController.swift
//  Navigation
//
//  Created by Николай Гринько on 21.02.2023.
//
import UIKit


final class LogInViewController: UIViewController {
    
    private let notification = NotificationCenter.default
    private let loginView = LoginView()
    
    override func loadView() {
        super.loadView()
        view = loginView
        setupLoginButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupLoginButton() {
        loginView.myLoginButton.addTarget(self, action: #selector(tapLoginAction), for: .touchUpInside)
    }
    
    @objc private func tapLoginAction() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)
        
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keybordSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            loginView.myScrollView.contentInset.bottom = keybordSize.height
            loginView.myScrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide() {
        loginView.myScrollView.contentInset = .zero
        loginView.myScrollView.verticalScrollIndicatorInsets = .zero
    }
}

extension LogInViewController {
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
