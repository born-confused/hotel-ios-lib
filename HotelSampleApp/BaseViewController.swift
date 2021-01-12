//
//  ViewController.swift
//  HotelSampleApp
//
//  Created by Aditya Nand on 07/01/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    enum Constants {
        static let employee_title = "Employee"
        static let employer_title = "Employer"
    }
    
    let parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20.0
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    let employeeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.75
        button.layer.cornerRadius = 20
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let employerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.75
        button.layer.cornerRadius = 20
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        setupButtons()
    }
    
    @objc func adminButtonPressed() {
        let employeeVC = EmployeeConfigurator.makeViewController()
        navigationController?.pushViewController(employeeVC, animated: true)
    }
    
    @objc func employeeDashboardButtonPressed() {
//        let adminVC = EmployerConfigurator.makeViewController()
//        navigationController?.pushViewController(adminVC, animated: true)
        let loginVC = LoginScreenConfigurator.makeScreen()
        navigationController?.pushViewController(loginVC, animated: true)
    }
}

private extension BaseViewController {
    
    func setupUI() {
        view.addSubview(parentStackView)
        NSLayoutConstraint.activate([
            parentStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            parentStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            parentStackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100)
        ])
    }
    
    func setupButtons() {
        employeeButton.setTitle(Constants.employee_title, for: .normal)
        employerButton.setTitle(Constants.employer_title, for: .normal)
        
        parentStackView.addArrangedSubview(employeeButton)
        parentStackView.addArrangedSubview(employerButton)
        
        employerButton.addTarget(self, action: #selector(adminButtonPressed), for: .touchUpInside)
        employeeButton.addTarget(self, action: #selector(employeeDashboardButtonPressed), for: .touchUpInside)
    }
}
