//
//  MyAvailabilityVC.swift
//  HotelSampleApp
//
//  Created by Aditya Nand on 10/01/21.
//

import UIKit

class MyAvailabilityVC: UIViewController {
    
    private let myAvailabilitySectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.backgroundColor = .red
        label.textColor = .white
        label.text = "My Availability"
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.bounces = false
        collectionView.backgroundColor = .white
        collectionView.clipsToBounds = true
        collectionView.isDirectionalLockEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let parentLegendView = LegendView()
    let hotelConfig: HotelConfiguration
    var viewLogic: MyAvailabilityViewLogic
    
    private let cellId = "myCollectionViewCell"

    init(hotelConfig: HotelConfiguration) {
        self.hotelConfig = hotelConfig
        viewLogic = MyAvailabilityViewLogic(weekDay: hotelConfig.weekDays, availableHours: hotelConfig.availableHours)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        setAvailabilityLabel()
        setupCollectionView()
        setupDivider()
        setupLegendView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

private extension MyAvailabilityVC {
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -225)
        ])
        collectionView.register(LabelAndCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setAvailabilityLabel() {
        view.addSubview(myAvailabilitySectionLabel)
        
        NSLayoutConstraint.activate([
            myAvailabilitySectionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            myAvailabilitySectionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myAvailabilitySectionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myAvailabilitySectionLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupDivider() {
        view.addSubview(dividerView)
        
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: CGFloat(1))
        ])
        dividerView.backgroundColor = .gray
    }
    
    func setupLegendView() {
        view.addSubview(parentLegendView)
        parentLegendView.configUI()
        NSLayoutConstraint.activate([
            parentLegendView.topAnchor.constraint(equalTo: dividerView.topAnchor, constant: 15),
            parentLegendView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            parentLegendView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            parentLegendView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90)
        ])
    }
}

extension MyAvailabilityVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewLogic.getWeekdaysCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? LabelAndCollectionViewCell {
            cell.configCell(weekDay: viewLogic.getWeekDay(row: indexPath.row),
                            workHours: viewLogic.getWorkHoursOfDay(row: indexPath.row),
                            delegate: self)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 70)
    }
}

extension MyAvailabilityVC: SaveHoursData {
    func saveViewLogicData(weekDay: WeekDay, updatedHoursInformation: [HoursCellState]) {
        viewLogic.saveUpdatedHoursState(weekDay: weekDay, updatedHoursInformation: updatedHoursInformation)
    }
}
