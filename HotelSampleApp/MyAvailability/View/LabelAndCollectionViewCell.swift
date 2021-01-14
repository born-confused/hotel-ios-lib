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
    
    private var workHours: [HoursCellState]?
    private let subCellId = "subCellId"
    private var weekDay: WeekDay?
    private var delegate: SaveHoursData?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(weekDay: WeekDay, workHours: [HoursCellState], delegate: SaveHoursData) {
        weekdayLabel.text = weekDay.rawValue

        self.workHours = workHours
        self.weekDay = weekDay
        self.delegate = delegate
        setSelectedHour()
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
    
    func getTotalWorkHours() -> Int {
        return (workHours?.count ?? 0) - ((workHours?.filter{ $0 == HoursCellState.Unavailable })?.count ?? 0)
    }
    
    func setSelectedHour() {
        selectedHourLabel.text = " (\(getTotalWorkHours())) "
    }
    
    func updateCell(row: Int, cellState: HoursCellState) {
        workHours?[row] = cellState
        setSelectedHour()
        delegate?.saveViewLogicData(weekDay: weekDay ?? .Monday,
                                    updatedHoursInformation: workHours ?? [])
    }
}

extension LabelAndCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workHours?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: subCellId, for: indexPath) as? HourAvailabilityCell {
            cell.cellState = workHours?[indexPath.row] ?? .Unavailable
            cell.configCell(hourOfTheDay: String(indexPath.row + 1))
            cell.setCellColor()
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 57, height: 57)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        let cell = collectionView.cellForItem(at: indexPath) as! HourAvailabilityCell
        cell.assignCellState(userType: .Employee)
        updateCell(row: indexPath.row, cellState: cell.cellState)
    }
}
