//
//  MonthsTableViewCell.swift
//  HotelSampleApp
//
//  Created by Aditya Nand on 08/01/21.
//

import UIKit

class MonthsTableViewCell: UITableViewCell {
    
    let parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.autoresizesSubviews = true
        return stackView
    }()
    
    let monthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = .black
        label.textAlignment = .center
//        label.setContentHuggingPriority(.required, for: .horizontal)
        label.baselineAdjustment = .alignCenters
        label.font = .systemFont(ofSize: 20.0)
        return label
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.titleLabel?.baselineAdjustment = .alignCenters
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCell()
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        selectionStyle = .none
        separatorInset = .zero
        backgroundColor = .white
    }
    
    private func setupCell() {
        addSubview(parentStackView)
        
        NSLayoutConstraint.activate([
            parentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            parentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            parentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            parentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
        
        parentStackView.addArrangedSubview(monthLabel)
        parentStackView.addArrangedSubview(nextButton)
    }

    func configCell(monthValue: String) {
        monthLabel.text = monthValue
        nextButton.setTitle("Open ->", for: .normal)
    }
    
}
