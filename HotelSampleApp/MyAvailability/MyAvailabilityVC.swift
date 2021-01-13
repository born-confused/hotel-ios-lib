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
    
    let dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let parentLegendView = LegendView()
    
    private let weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    private let totalHoursSelected = [0, 0, 0, 0, 0, 0, 0]
    private let cellId = "myCollectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        setAvailabilityLabel()
        setupCollectionView()
        setupDivider()
        setupLegendView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return weekDays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? LabelAndCollectionViewCell {
            cell.configCell(weekDay: weekDays[indexPath.row], selectedHours: totalHoursSelected[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 70)
    }
}
