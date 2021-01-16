//
//  EmployerProfileVC.swift
//  HotelSampleApp
//
//  Created by Aditya Nand on 09/01/21.
//

import UIKit

class EmployerProfileVC: UIViewController {
    
    let profileSectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.backgroundColor = .red
        label.textColor = .white
        label.text = "Profile"
        return label
    }()
    
    let nameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.clipsToBounds = true
        return stackView
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.baselineAdjustment = .alignCenters
        label.backgroundColor = .white
        label.textAlignment = .left
        label.text = "Your name"
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.baselineAdjustment = .alignCenters
        label.backgroundColor = .white
        label.textAlignment = .right
        label.text = "Lorem Ipsum"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let emailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.clipsToBounds = true
        return stackView
    }()
    
    let userEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.baselineAdjustment = .alignCenters
        label.backgroundColor = .white
        label.textAlignment = .left
        label.text = "Your email"
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.baselineAdjustment = .alignCenters
        label.backgroundColor = .white
        label.textAlignment = .right
        label.text = "LoremIpsum@gmail.com"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let availableStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.clipsToBounds = true
        return stackView
    }()
    
    let userAvailableLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.baselineAdjustment = .alignCenters
        label.backgroundColor = .white
        label.textAlignment = .left
        label.text = "Available Hours"
        return label
    }()
    
    let avaialableLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.baselineAdjustment = .alignCenters
        label.backgroundColor = .white
        label.textAlignment = .right
        label.text = "100 / 168 hours"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let engagementStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.clipsToBounds = true
        return stackView
    }()
    
    let userEngagementLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.baselineAdjustment = .alignCenters
        label.backgroundColor = .white
        label.textAlignment = .left
        label.text = "Engagement hours"
        return label
    }()
    
    let engagementLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.baselineAdjustment = .alignCenters
        label.backgroundColor = .white
        label.textAlignment = .right
        label.text = "68 / 100 hours"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = .white
        setProfileLabel()
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

private extension EmployerProfileVC {
    
    func setProfileLabel() {
        view.addSubview(profileSectionLabel)
        
        NSLayoutConstraint.activate([
            profileSectionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileSectionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileSectionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10),
            profileSectionLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupUI() {
        view.addSubview(nameStackView)
        view.addSubview(emailStackView)
        view.addSubview(availableStackView)
        view.addSubview(engagementStackView)
        
        // MARK: - Name Stack View
        NSLayoutConstraint.activate([
            nameStackView.topAnchor.constraint(equalTo: profileSectionLabel.bottomAnchor, constant: 20),
            nameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            nameStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        nameStackView.addArrangedSubview(userNameLabel)
        nameStackView.addArrangedSubview(nameLabel)
        
        // MARK: - Email Stack View
        NSLayoutConstraint.activate([
            emailStackView.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 20),
            emailStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            emailStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        emailStackView.addArrangedSubview(userEmailLabel)
        emailStackView.addArrangedSubview(emailLabel)
        
        // MARK: - Available Stack View
        NSLayoutConstraint.activate([
            availableStackView.topAnchor.constraint(equalTo: emailStackView.bottomAnchor, constant: 20),
            availableStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            availableStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        availableStackView.addArrangedSubview(userAvailableLabel)
        availableStackView.addArrangedSubview(avaialableLabel)
        
        // MARK: - Engagement Stack View
        NSLayoutConstraint.activate([
            engagementStackView.topAnchor.constraint(equalTo: availableStackView.bottomAnchor, constant: 20),
            engagementStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            engagementStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        engagementStackView.addArrangedSubview(userEngagementLabel)
        engagementStackView.addArrangedSubview(engagementLabel)
    }
}
