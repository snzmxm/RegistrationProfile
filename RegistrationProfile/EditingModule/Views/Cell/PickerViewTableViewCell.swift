//
//  PickerViewTableViewCell.swift
//  RegistrationProfile
//
//  Created by SNZ on 07.03.2023.
//

import UIKit

class PickerViewTableViewCell: UITableViewCell {

    static var idPickerViewCell = "idPickerViewCell"

    private let nameLabel = UILabel()
    private let sexPickerView = SexPickerView()
    private let sexTextField = SexTextField()



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

        sexPickerView.sexDelegate = self
        sexTextField.inputView = sexPickerView
        contentView.addView(sexTextField)

    }

    public func configure(name: String, value: String) {
        nameLabel.text = name
        sexTextField.text = value
    }

    public func getCellValue() -> String {
        guard let text = sexTextField.text else { return ""}
        return text
    }
}
//MARK: - SexPickerViewProtocol
//При открытии ПОЛ выскакивает пиккер и при выборе нужного варианта(отпускаем курсор), пиккер пропадает и выдает нужный нам вариант
extension PickerViewTableViewCell: SexPickerViewProtocol {

    func didSelect(row: Int) {
        sexTextField.text = Resources.Sex.allCases[row].rawValue
        sexTextField.resignFirstResponder()
    }
}
//MARK:  - setConstrains

extension PickerViewTableViewCell {

    private func setConstrains() {
        NSLayoutConstraint.activate([

            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),

            sexTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            sexTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            sexTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17),
            sexTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)


        ])
    }
}
