//
//  LegendView.swift
//  HotelSampleApp
//
//  Created by Aditya Nand on 13/01/21.
//

import UIKit

class LegendView: UIStackView {
    
    private let legendTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.baselineAdjustment = .alignCenters
        label.textAlignment = .left
        label.text = "Colour Classification :-"
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()
    
    private let legendView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let legendListStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .white
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        return stackView
    }()
    
    private let unavailableLegendView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let availableLegendView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let assignedLegendView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let unavailableColorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let availableColorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.5)
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let assignedColorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 0, alpha: 0.5)
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let unavailableColorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.baselineAdjustment = .alignCenters
        label.textAlignment = .left
        label.text = "Unavailable Hours"
        return label
    }()
    
    private let availableColorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.baselineAdjustment = .alignCenters
        label.textAlignment = .left
        label.text = "Available Hours"
        return label
    }()
    
    private let assignedColorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.baselineAdjustment = .alignCenters
        label.textAlignment = .left
        label.text = "Assigned Hours"
        return label
    }()
    
    func configUI() {
        configParentStackview()
        addArrangedSubview(legendTextLabel)
        addArrangedSubview(legendView)
        
        legendView.addSubview(legendListStackView)
        
        NSLayoutConstraint.activate([
            legendListStackView.widthAnchor.constraint(equalTo: legendView.widthAnchor, constant: -20),
            legendListStackView.centerXAnchor.constraint(equalTo: legendView.centerXAnchor),
            legendListStackView.heightAnchor.constraint(equalTo: legendView.heightAnchor)
        ])
        legendListStackView.addArrangedSubview(unavailableLegendView)
        legendListStackView.addArrangedSubview(availableLegendView)
        legendListStackView.addArrangedSubview(assignedLegendView)
        
        unavailableLegendView.addSubview(unavailableColorView)
        unavailableLegendView.addSubview(unavailableColorLabel)
        
        NSLayoutConstraint.activate([
            unavailableColorView.topAnchor.constraint(equalTo: unavailableLegendView.topAnchor),
            unavailableColorView.bottomAnchor.constraint(equalTo: unavailableLegendView.bottomAnchor),
            unavailableColorView.leadingAnchor.constraint(equalTo: unavailableLegendView.leadingAnchor),
            unavailableColorView.widthAnchor.constraint(equalTo: unavailableLegendView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            unavailableColorLabel.topAnchor.constraint(equalTo: unavailableColorView.topAnchor),
            unavailableColorLabel.bottomAnchor.constraint(equalTo: unavailableColorView.bottomAnchor),
            unavailableColorLabel.trailingAnchor.constraint(equalTo: unavailableLegendView.trailingAnchor),
            unavailableColorLabel.leadingAnchor.constraint(equalTo: unavailableColorView.trailingAnchor, constant: 10)
        ])
        
        availableLegendView.addSubview(availableColorView)
        availableLegendView.addSubview(availableColorLabel)
        
        NSLayoutConstraint.activate([
            availableColorView.topAnchor.constraint(equalTo: availableLegendView.topAnchor),
            availableColorView.bottomAnchor.constraint(equalTo: availableLegendView.bottomAnchor),
            availableColorView.leadingAnchor.constraint(equalTo: availableLegendView.leadingAnchor),
            availableColorView.widthAnchor.constraint(equalTo: availableLegendView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            availableColorLabel.topAnchor.constraint(equalTo: availableColorView.topAnchor),
            availableColorLabel.bottomAnchor.constraint(equalTo: availableColorView.bottomAnchor),
            availableColorLabel.trailingAnchor.constraint(equalTo: availableLegendView.trailingAnchor),
            availableColorLabel.leadingAnchor.constraint(equalTo: availableColorView.trailingAnchor, constant: 10)
        ])
        
        assignedLegendView.addSubview(assignedColorView)
        assignedLegendView.addSubview(assignedColorLabel)
        
        NSLayoutConstraint.activate([
            assignedColorView.topAnchor.constraint(equalTo: assignedLegendView.topAnchor),
            assignedColorView.bottomAnchor.constraint(equalTo: assignedLegendView.bottomAnchor),
            assignedColorView.leadingAnchor.constraint(equalTo: assignedLegendView.leadingAnchor),
            assignedColorView.widthAnchor.constraint(equalTo: assignedLegendView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            assignedColorLabel.topAnchor.constraint(equalTo: assignedColorView.topAnchor),
            assignedColorLabel.bottomAnchor.constraint(equalTo: assignedColorView.bottomAnchor),
            assignedColorLabel.trailingAnchor.constraint(equalTo: assignedLegendView.trailingAnchor),
            assignedColorLabel.leadingAnchor.constraint(equalTo: assignedColorView.trailingAnchor, constant: 10)
        ])
    }
}

private extension LegendView {
    
    func configParentStackview() {
        axis = .vertical
        distribution = .fill
        spacing = 10
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
}
