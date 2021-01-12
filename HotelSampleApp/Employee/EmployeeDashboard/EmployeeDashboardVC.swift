//
//  EmployeeDashboardVC.swift
//  HotelSampleApp
//
//  Created by Aditya Nand on 09/01/21.
//

import UIKit

class EmployeeDashboardVC: UIPageViewController {
    
    var pages = [UIViewController]()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        pageControl.pageIndicatorTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.15)
        return pageControl
    }()
    
    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        configureToolbar()
        setupPageControl()
        setupPageViewController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

private extension EmployeeDashboardVC {
    
    func setupPageViewController() {
        self.dataSource = self
        self.delegate = self
        let initialPage = 0
        let vc1 = EmployerProfileConfigurator.makeScreen()
        let vc2 = MyAvailabilityConfigurator.makeScreen()
//        let vc3 = EmployerProfileConfigurator.makeScreen()
        
        pages.append(vc1)
        pages.append(vc2)
//        pages.append(vc3)
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        pageControl.numberOfPages = pages.count
    }
    
    func configureToolbar() {
        navigationItem.title = "My Dashboard"
    }
    
    func setupPageControl() {
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            pageControl.heightAnchor.constraint(equalToConstant: 40),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension EmployeeDashboardVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.pages.firstIndex(of: viewController) {
            if viewControllerIndex == 0 {
                // wrap to last page in array
                return nil
            } else {
                // go to previous page in array
                return self.pages[viewControllerIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.pages.firstIndex(of: viewController) {
            if viewControllerIndex < self.pages.count - 1 {
                // go to next page in array
                return self.pages[viewControllerIndex + 1]
            } else {
                // wrap to first page in array
                return nil
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if let viewControllers = pageViewController.viewControllers {
            if let viewControllerIndex = self.pages.firstIndex(of: viewControllers[0]) {
                self.pageControl.currentPage = viewControllerIndex
            }
        }
    }
}
