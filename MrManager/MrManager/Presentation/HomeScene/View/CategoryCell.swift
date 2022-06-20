//
//  CollectionViewCell.swift
//  MrManager
//
//  Created by dong eun shin on 2022/06/13.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    static let identifier = "CategoryCell"
    
    private var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            textLabel.font = isSelected ? UIFont.boldSystemFont(ofSize: 14) : UIFont.systemFont(ofSize: 14)
            textLabel.textColor = isSelected ? .blue : .black
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(textLabel)
        setAutoLayout()
    }
    
    private func setAutoLayout() {
        NSLayoutConstraint.activate([
            textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
