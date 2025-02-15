//
//  HourAvailabilityCell.swift
//  HotelSampleApp
//
//  Created by Aditya Nand on 12/01/21.
//

import UIKit

class HourAvailabilityCell: UICollectionViewCell {
    
    private let tapView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
        label.baselineAdjustment = .alignCenters
        label.textColor = .black
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    var cellState: HoursCellState
    
    override init(frame: CGRect) {
        cellState = .Unavailable
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func assignCellState(userType: UserType) {
        switch self.cellState {
        case .Unavailable:
            updateUnavailableState(userType: userType)
        case .Available:
            updateAvailableState(userType: userType)
        case .Assigned:
            updateAssignedState(userType: userType)
        }
        setCellColor()
    }
    
    func configCell(hourOfTheDay: String) {
        tapView.text = hourOfTheDay
    }
    
    func setCellColor() {
        tapView.backgroundColor = getTapColor()
    }
}

private extension HourAvailabilityCell {
    
    func setupUI() {
        addSubview(tapView)
        NSLayoutConstraint.activate([
            tapView.heightAnchor.constraint(equalTo: heightAnchor),
            tapView.widthAnchor.constraint(equalTo: widthAnchor),
            tapView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tapView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        setCellColor()
    }
    
    func updateUnavailableState(userType: UserType) {
        if userType == .Employee {
            cellState = .Available
        }
    }
    
    func updateAvailableState(userType: UserType) {
        if userType == .Employee {
            cellState = .Unavailable
        } else {
            cellState = .Assigned
        }
    }
    
    func updateAssignedState(userType: UserType) {
        if userType == .Employer {
            cellState = .Available
        }
    }
    
    func getTapColor() -> UIColor {
        return cellState.getColor()
    }
}
