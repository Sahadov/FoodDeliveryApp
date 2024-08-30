//
//  OnboardingViewController.swift
//  FoodDeliveryApp
//
//  Created by Дмитрий Волков on 21.08.2024.
//

import UIKit


// MARK: - OnboardingViewController
class OnboardingViewController: UIViewController {

    // MARK: - Properties
    private var pages = [UIViewController]()
   
    // MARK: - Views
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let pageControl = UIPageControl()
    var viewOutput: OnboardingViewOutput!
    private let btmButton = UIButton()
    
    
    // MARK: - Initializers
    init(pages: [UIViewController] = [UIViewController](), viewOutput: OnboardingViewOutput!) {
        self.pages = pages
        self.viewOutput = viewOutput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life-Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewController()
        setupPageControl()
        setupButton()
    }

}

// MARK: - Layout
private extension OnboardingViewController {
    func setupPageViewController(){
        view.backgroundColor = Colors.accentOrange
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    
    }
    
    // set up dots to control the pages
    func setupPageControl(){
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
    func setupButton(){
        view.addSubview(btmButton)
        btmButton.translatesAutoresizingMaskIntoConstraints = false
        btmButton.backgroundColor = Colors.background
        btmButton.layer.cornerRadius = 24
        btmButton.titleLabel?.font = .Roboto.bold.size(of: 20)
        btmButton.setTitle("Next", for: .normal)
        btmButton.setTitleColor(.darkGray, for: .normal)
        btmButton.addTarget(self, action: #selector(btmButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            btmButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            btmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            btmButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -20),
            btmButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}

// MARK: - Actions: pageControlDidChange amd btmButtonTapped
private extension OnboardingViewController {
    @objc func pageControlDidChange(_ sender: UIPageControl) {
        let currentIndex = pageViewController.viewControllers?.first.flatMap { pages.firstIndex(of: $0) } ?? 0
        let selectedIndex = sender.currentPage
        
        if selectedIndex > currentIndex {
            pageViewController.setViewControllers([pages[selectedIndex]], direction: .forward, animated: true, completion: nil)
        } else if selectedIndex < currentIndex {
            pageViewController.setViewControllers([pages[selectedIndex]], direction: .reverse, animated: true, completion: nil)
        }
        updateButton()
    }
    
    @objc func btmButtonTapped(){
        let currentIndex = pageViewController.viewControllers?.first.flatMap { pages.firstIndex(of: $0) } ?? 0
        if currentIndex < pages.count - 1 {
            pageViewController.setViewControllers([pages[currentIndex + 1]], direction: .forward, animated: true, completion: nil)
            pageControl.currentPage = currentIndex + 1
            updateButton()
        } else {
            viewOutput.onboardingFinish()
        }
        
    }
}

// MARK: - UIPageViewControllerDataSource delegate
extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else { return nil }
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 else { return nil }
        return pages[currentIndex + 1]
    }

}

// MARK: - UIPageViewControllerDelegate delegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {

        if let index = pages.firstIndex(of: pendingViewControllers.first!) {
            pageControl.currentPage = index
            updateButton()
        }
    }
}

// MARK: - Update Button UI
private extension OnboardingViewController {
    func updateButton() {
        if pageControl.currentPage == pages.count - 1 {
            btmButton.setTitle("Start Ordering", for: .normal)
        } else {
            btmButton.setTitle("Next", for: .normal)
        }
    }
}
