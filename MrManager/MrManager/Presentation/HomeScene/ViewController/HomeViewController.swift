//
//  HomeViewController.swift
//  MrManager
//
//  Created by dong eun shin on 2022/06/13.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        configure()
        
    }
    
    let tableview: UITableView = {
        let tableView = UITableView()
        tableView.register(RoutineTableViewCell.self, forCellReuseIdentifier: RoutineTableViewCell.identifier)
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private lazy var containerView: UIView = {
        let container = UIView()
        container.backgroundColor = .gray
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var forcastImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.image = UIImage(systemName: "plus")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var addBttnContainerView: UIView = {
        let container = UIView()
        container.backgroundColor = .gray
        container.layer.cornerRadius = 25
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    private lazy var addRoutineButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(tapBackButton), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        let name = "tmpName"
        let greeting = "좋은 아침입니다!"
        label.text = "\(name)님, \(greeting)"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var forcastInfoLabel: UILabel = {
        let label = UILabel()
        let (year, month, day) = ("[ ]", "[ ]", "[ ]")
        label.text = """
                    \(year)년 \(month)월 \(day)일
                    오늘 날씨는 \("[ ]")
                    최저\("[ ]")최고\("[ ]")입니다!
                    어제보다 \("[ ]")도 \("[ ]")했습니다.
                    미세먼지 \("[ ]") 초미세먼지 \("[ ]")
                    """
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var tabBarContainerView: UIView = {
        let container = UIView()
        container.backgroundColor = .clear
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
 
    private lazy var segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.selectedSegmentTintColor = .clear
        segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        segment.insertSegment(withTitle: "Today", at: 0, animated: true)
        segment.insertSegment(withTitle: "All", at: 1, animated: true)
        segment.selectedSegmentIndex = 0
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular)
        ], for: .normal)
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.systemBlue,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)
        ], for: .selected)
        segment.addTarget(self, action: #selector(changeSegmentedControlLinePosition), for: .valueChanged)
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    private lazy var underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var leadingDistance: NSLayoutConstraint = {
        return underLineView.leadingAnchor.constraint(equalTo: segmentControl.leadingAnchor)
    }()
    func configure() {
        view.addSubview(tabBarContainerView)
        tabBarContainerView.addSubview(segmentControl)
        tabBarContainerView.addSubview(underLineView)
        view.addSubview(containerView)
        containerView.addSubview(greetingLabel)
        containerView.addSubview(forcastInfoLabel)
        containerView.addSubview(forcastImgView)
        
        view.addSubview(tableview)
        view.addSubview(addBttnContainerView)
        addBttnContainerView.addSubview(addRoutineButton)
        
        NSLayoutConstraint.activate([
            tabBarContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tabBarContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tabBarContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            tabBarContainerView.heightAnchor.constraint(equalToConstant: 40),
            
            segmentControl.topAnchor.constraint(equalTo: tabBarContainerView.topAnchor),
            segmentControl.leadingAnchor.constraint(equalTo: tabBarContainerView.leadingAnchor),
            segmentControl.centerYAnchor.constraint(equalTo: tabBarContainerView.centerYAnchor),
            segmentControl.centerXAnchor.constraint(equalTo: tabBarContainerView.centerXAnchor),

            underLineView.bottomAnchor.constraint(equalTo: segmentControl.bottomAnchor),
            underLineView.heightAnchor.constraint(equalToConstant: 5),
            leadingDistance,
            underLineView.widthAnchor.constraint(equalTo: segmentControl.widthAnchor, multiplier: 1 / CGFloat(segmentControl.numberOfSegments)),
            
//            addBttnContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            addBttnContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            addBttnContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 650),
            addBttnContainerView.heightAnchor.constraint(equalToConstant: 50),
            addBttnContainerView.widthAnchor.constraint(equalToConstant: 50),
            
            addRoutineButton.topAnchor.constraint(equalTo: addBttnContainerView.topAnchor),
            addRoutineButton.leadingAnchor.constraint(equalTo: addBttnContainerView.leadingAnchor),
            addRoutineButton.centerYAnchor.constraint(equalTo: addBttnContainerView.centerYAnchor),
            addRoutineButton.centerXAnchor.constraint(equalTo: addBttnContainerView.centerXAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.22),
            
            greetingLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
//            greetingLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            greetingLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            
            forcastInfoLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
//            forcastInfoLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            forcastInfoLabel.topAnchor.constraint(equalTo: greetingLabel.topAnchor),
            forcastInfoLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            forcastImgView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            forcastImgView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.3),
            forcastImgView.heightAnchor.constraint(equalToConstant: view.frame.width * 0.3),
            forcastImgView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            tableview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableview.topAnchor.constraint(equalTo: tabBarContainerView.bottomAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    @objc private func changeSegmentedControlLinePosition() {
        let segmentIndex = CGFloat(segmentControl.selectedSegmentIndex)
        let segmentWidth = segmentControl.frame.width / CGFloat(segmentControl.numberOfSegments)
        let leadingDistance = segmentWidth * segmentIndex
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            self?.leadingDistance.constant = leadingDistance
            self?.view.layoutIfNeeded()
        })
    }
    @objc private func tapBackButton() {
        print("Tap!!!")
    }
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = RoutineDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RoutineTableViewCell.identifier, for: indexPath) as? RoutineTableViewCell else { return UITableViewCell()}
        cell.titleLabel.text = "title"
        cell.timeLabel.text = "00:00 - 00:00"
        cell.dayLabel.text = "월 화 수 목 금 토 일"
        cell.separatorInset = UIEdgeInsets(top: 50, left: 0, bottom: 50, right: 0)
        return cell
    }
}
