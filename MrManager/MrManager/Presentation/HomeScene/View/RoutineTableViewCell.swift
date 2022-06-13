//
//  RoutineTableViewCell.swift
//  MrManager
//
//  Created by dong eun shin on 2022/06/13.
//

import UIKit

class RoutineTableViewCell: UITableViewCell {
    static let identifier = "RoutineTableViewCell"

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .brown
        contentView.layer.cornerRadius = 30
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
        contentView.layer.borderColor = UIColor.separator.cgColor
        contentView.layer.borderWidth = 10
        selectionStyle = .none

        addContentView()
        setConstraints()
    }
    
    private func addContentView() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(dayLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: -10),
            
            timeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: 10),
            
            dayLabel.topAnchor.constraint(equalTo: self.topAnchor),
            dayLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            dayLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
