//
//  MainTableViewCell.swift
//  RegistrationProfile
//
//  Created by SNZ on 07.03.2023.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    private let nameLabel = UILabel()

    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = "test"
        label.font = Resources.Fonts.avenirNextRegular(with: 18)
        label.numberOfLines = 0
        return label
    }()

    static var idMainTableViewCell = "idMainTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setConstrains()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        selectionStyle = .none
        nameLabel.font = Resources.Fonts.avenirNextRegular(with: 18)
        addView(nameLabel)
        addView(valueLabel)
    }

    public func configure(name: String, value: String) {
        nameLabel.text = name
        valueLabel.text = value == "" ? "Нет данных" : value
    }
}

extension MainTableViewCell {

    private func setConstrains() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(greaterThanOrEqualToConstant: 44),

            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),

            valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            valueLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10)

        ])
    }
}
