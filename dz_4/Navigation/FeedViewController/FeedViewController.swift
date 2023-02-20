//
//  FeedViewController.swift
//  Navigation
//
//  Created by Николай Гринько on 30.01.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let  myPost = Post(title: "My post")
    
    private var topInsetView = UIView()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .systemGray4
        stackView.layer.cornerRadius = 4
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private (set) lazy var showPostButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show Post", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapShowAction), for: .touchUpInside)
        return button
    }()
    
    private (set) lazy var editPostButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit Post", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapEditAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        navigationItem.title = "Feed"
        topInsetView.backgroundColor = .white
        view.addSubview(topInsetView)
        setupStackView()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topInsetView.frame = CGRect(x: 0, y: 0,
                                    width: view.frame.width,
                                    height: view.safeAreaInsets.top)
        
    }
    
    private func setupStackView() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(showPostButton)
        stackView.addArrangedSubview(editPostButton)
    }
    
    @objc func tapShowAction() {
        let postVC = PostViewController(myPost: myPost.title)
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    @objc func tapEditAction() {
        let postVC = PostViewController(myPost: myPost.title)
        navigationController?.pushViewController(postVC, animated: true)
    }
}

extension FeedViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

