//
//  DatePickerTableViewCell.swift
//  RegistrationProfile
//
//  Created by SNZ on 07.03.2023.
//

import UIKit

class DatePickerTableViewCell: UITableViewCell {

    static var idDatePickerCell = "idDatePickerCell"

    private let nameLabel = UILabel()

    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.subviews[0].subviews[0].subviews[0].alpha = 0
        return datePicker
    }()


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
        contentView.addView(datePicker)
    }

    public func configure(name: String, date: Date) {
        nameLabel.text = name
        datePicker.date = date
    }

    public func getCellValue() -> String {

        if  datePicker.date.getStringFromDate() == Date().getStringFromDate() {
            return ""
        } else {
            return datePicker.date.getStringFromDate()
        }
    }
}
//MARK:  - setConstrains

extension DatePickerTableViewCell {

    private func setConstrains() {
        NSLayoutConstraint.activate([

            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),

            datePicker.centerYAnchor.constraint(equalTo: centerYAnchor),
            datePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
}
