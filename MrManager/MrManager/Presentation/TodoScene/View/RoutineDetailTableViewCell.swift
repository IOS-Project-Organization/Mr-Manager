//
//  RoutineDetailTableViewCell.swift
//  MrManager
//
//  Created by dong eun shin on 2022/06/14.
//

import UIKit

class RoutineDetailTableViewCell: UITableViewCell {
    static let identifier = "RoutineDetailTableViewCell"

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var durationLabel: UILabel = {
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
        setConstraints()
    }
    
    private func setConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(durationLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: durationLabel.leadingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            durationLabel.topAnchor.constraint(equalTo: self.topAnchor),
            durationLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            durationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
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
