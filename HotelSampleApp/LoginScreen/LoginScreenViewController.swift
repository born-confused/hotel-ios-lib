//
//  LoginScreenViewController.swift
//  HotelSampleApp
//
//  Created by Aditya Nand on 08/01/21.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20.0
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    private let usernameField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.attributedPlaceholder = NSAttributedString(string: "Enter Username",
                                                        attributes: [NSAttributedString.Key.foregroundColor:
                                                                        UIColor(red: 122.5/255, green: 121.5/255, blue: 120.25/255, alpha: 0.7)])
        text.autocorrectionType = .yes
        text.autocapitalizationType = .none
        text.borderStyle = .roundedRect
        return text
    }()
    
    private let passwordField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.attributedPlaceholder = NSAttributedString(string: "Enter Password",
                                                        attributes: [NSAttributedString.Key.foregroundColor:
                                                                        UIColor(red: 122.5/255, green: 121.5/255, blue: 120.25/255, alpha: 0.7)])
        text.isSecureTextEntry = true
        text.borderStyle = .roundedRect
        return text
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.setTitle("LOGIN", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let tapGesture: UITapGestureRecognizer
    
    init() {
        tapGesture = UITapGestureRecognizer(target: nil, action: nil)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        tapGesture.addTarget(self, action: #selector(didTapOnScreen))
        // Do any additional setup after loading the view.
        setupUI()
        setTextField()
        setupButton()
        configureToolbar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func didTapOnScreen() {
        view.removeGestureRecognizer(tapGesture)
        view.endEditing(true)
    }
    
    @objc func didTapOnLoginButton() {
        didTapOnScreen()
        let dashboardVC = EmployeeDashboardConfigurator.makeScreen()
        navigationController?.pushViewController(dashboardVC, animated: true)
    }
}

private extension LoginScreenViewController {
    
    func configureToolbar() {
        navigationItem.title = "Login"
        navigationItem.backButtonTitle = ""
    }
    
    func setTextField() {
        usernameField.delegate = self
        passwordField.delegate = self
    }
    
    func setupUI() {
        view.addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            containerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            containerStackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50)
        ])
        
        containerStackView.addArrangedSubview(usernameField)
        containerStackView.addArrangedSubview(passwordField)
    }
    
    func setupButton() {
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor),
            loginButton.topAnchor.constraint(equalTo: containerStackView.bottomAnchor, constant: 30),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        loginButton.addTarget(self, action: #selector(didTapOnLoginButton), for: .touchUpInside)
    }
}

extension LoginScreenViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
        view.addGestureRecognizer(tapGesture)
    }
}
