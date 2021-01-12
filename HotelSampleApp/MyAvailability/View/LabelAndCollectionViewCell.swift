//
//  LabelAndCollectionViewCell.swift
//  HotelSampleApp
//
//  Created by Aditya Nand on 11/01/21.
//

import UIKit

class LabelAndCollectionViewCell: UICollectionViewCell {
    
    private let weekdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.baselineAdjustment = .alignCenters
        label.textAlignment = .center
        return label
    }()
    
    private let selectedHourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.baselineAdjustment = .alignCenters
        label.textAlignment = .center
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.bounces = false
        collectionView.backgroundColor = .white
        collectionView.clipsToBounds = true
        collectionView.isDirectionalLockEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let workHours = 24
    private let subCellId = "subCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(weekDay: String) {
        weekdayLabel.text = weekDay
        selectedHourLabel.text = " (0) "
    }
}

private extension LabelAndCollectionViewCell {
    
    func setupUI() {
        addSubview(weekdayLabel)
        addSubview(selectedHourLabel)
        
        NSLayoutConstraint.activate([
            weekdayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            weekdayLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            weekdayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            weekdayLabel.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            selectedHourLabel.topAnchor.constraint(equalTo: weekdayLabel.topAnchor),
            selectedHourLabel.bottomAnchor.constraint(equalTo: weekdayLabel.bottomAnchor),
            selectedHourLabel.leadingAnchor.constraint(equalTo: weekdayLabel.trailingAnchor),
            selectedHourLabel.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupCollectionView() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: selectedHourLabel.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: selectedHourLabel.trailingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        collectionView.register(HourAvailabilityCell.self, forCellWithReuseIdentifier: subCellId)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension LabelAndCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workHours
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: subCellId, for: indexPath) as? HourAvailabilityCell {
            cell.configCell(hourOfTheDay: String(indexPath.row + 1))
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 57, height: 57)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! HourAvailabilityCell
        cell.assignCellState(userType: .Employee)
    }
}
