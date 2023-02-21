//
//  LoginView.swift
//  Navigation
//
//  Created by Николай Гринько on 21.02.2023.
//
import UIKit

final class LoginView: UIView {
    
    let myScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let myContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let myLogoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var myTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.indent(size: 10)
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.placeholder = "Email or phone"
        textField.delegate = self
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGray6
        textField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return textField
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.indent(size: 10)
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.placeholder = "Password"
        textField.delegate = self
        textField.isSecureTextEntry = true
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGray6
        textField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return textField
    }()
    
    var myLoginButton: UIButton = {
        var button = UIButton(type: .system)
        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        button.layer.masksToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(myScrollView)
        myScrollView.addSubview(myContentView)
        myContentView.addSubview(myLogoImageView)
        myContentView.addSubview(myTextField)
        myContentView.addSubview(textField)
        myContentView.addSubview(myLoginButton)
        
        NSLayoutConstraint.activate([
            myScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            myScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            myScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            myScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            myContentView.topAnchor.constraint(equalTo: myScrollView.topAnchor),
            myContentView.leadingAnchor.constraint(equalTo: myScrollView.leadingAnchor),
            myContentView.bottomAnchor.constraint(equalTo: myScrollView.bottomAnchor),
            myContentView.trailingAnchor.constraint(equalTo: myScrollView.trailingAnchor),
            myContentView.widthAnchor.constraint(equalTo: myScrollView.widthAnchor),
            
            myLogoImageView.topAnchor.constraint(equalTo: myContentView.topAnchor, constant: 120),
            myLogoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            myLogoImageView.heightAnchor.constraint(equalToConstant: 100),
            myLogoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            myTextField.topAnchor.constraint(equalTo: myLogoImageView.bottomAnchor, constant: 120),
            myTextField.leadingAnchor.constraint(equalTo: myContentView.leadingAnchor, constant: 16),
            myTextField.trailingAnchor.constraint(equalTo: myContentView.trailingAnchor, constant: -16),
            myTextField.heightAnchor.constraint(equalToConstant: 50),
            
            textField.topAnchor.constraint(equalTo: myTextField.bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: myContentView.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: myContentView.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            myLoginButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            myLoginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            myLoginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            myLoginButton.heightAnchor.constraint(equalToConstant: 50),
            myLoginButton.bottomAnchor.constraint(equalTo: myContentView.bottomAnchor)
        ])
    }
}

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}

extension UIView {
    static var identifier: String {
        String(describing: self)
    }
}


