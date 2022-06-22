//
//  RoutineDetailViewController.swift
//  MrManager
//
//  Created by dong eun shin on 2022/06/14.
//

import UIKit

class RoutineDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        configure()
    }
    let tableview : UITableView = {
        let tableView = UITableView()
        tableView.register(RoutineDetailTableViewCell.self, forCellReuseIdentifier: RoutineDetailTableViewCell.identifier)
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
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        let title = "tmpName"
        label.text = "\(title)"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        let startTime = "00:00"
        let endTime = "00:00"
        label.text = "\(startTime) - \(endTime)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.text = "월 화 수 목 금 토 일"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var addTodoBttnContainerView: UIView = {
        let container = UIView()
        container.backgroundColor = .gray
        container.layer.cornerRadius = 25
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    private lazy var addTodoRoutineButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
//        button.addTarget(self, action: #selector(), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var settingButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "rectangle.grid.1x2.fill")
//        button.addTarget(self, action: #selector(), for: .touchDown)
        return button
    }()
    
    func configure() {
        view.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(timeLabel)
        containerView.addSubview(dayLabel)
        view.addSubview(tableview)
        view.addSubview(addTodoBttnContainerView)
        addTodoBttnContainerView.addSubview(addTodoRoutineButton)
        self.navigationItem.rightBarButtonItem = settingButton
        
        NSLayoutConstraint.activate([
 
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.1),

            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),

            timeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            timeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
//            timeLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

            dayLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            dayLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            dayLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            dayLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

            tableview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableview.topAnchor.constraint(equalTo: containerView.bottomAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
//            addTodoBttnContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
//            addTodoBttnContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 650),
            addTodoBttnContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            addTodoBttnContainerView.heightAnchor.constraint(equalToConstant: 50),
            addTodoBttnContainerView.widthAnchor.constraint(equalToConstant: 50),
            addTodoBttnContainerView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            addTodoRoutineButton.topAnchor.constraint(equalTo: addTodoBttnContainerView.topAnchor),
            addTodoRoutineButton.leadingAnchor.constraint(equalTo: addTodoBttnContainerView.leadingAnchor),
            addTodoRoutineButton.centerYAnchor.constraint(equalTo: addTodoBttnContainerView.centerYAnchor),
            addTodoRoutineButton.centerXAnchor.constraint(equalTo: addTodoBttnContainerView.centerXAnchor),
        ])
    }

}
extension RoutineDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RoutineDetailTableViewCell.identifier, for: indexPath) as? RoutineDetailTableViewCell else { return UITableViewCell()}
        let title: String = "title"
        let time: Int = 0
        cell.titleLabel.text = title
        cell.durationLabel.text = "\(time)분"
        cell.separatorInset = UIEdgeInsets(top: 50, left: 0, bottom: 50, right: 0)
        return cell
    }
}
