//
//  TextViewTableViewCell.swift
//  RegistrationProfile
//
//  Created by SNZ on 07.03.2023.
//

import UIKit

protocol NameTextViewProtocol: AnyObject {
    func changeSize()
}

class TextViewTableViewCell: UITableViewCell {

    weak var nameTextViewDelegate: NameTextViewProtocol?

    static var idTextViewCell = "idTextViewCell"

    private let nameLabel = UILabel()
    private let nameTextView = NameTextView()



    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setConstrains()
        textViewDidChange(nameTextView)
        layoutIfNeeded()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        selectionStyle = .none

        nameLabel.font = Resources.Fonts.avenirNextRegular(with: 18)
        addView(nameLabel)
        contentView.addView(nameTextView)
        nameTextView.delegate = self
    }

    public func configure(name: String, scrollEnable: Bool, value: String) {
        nameLabel.text = name
        nameTextView.isScrollEnabled = scrollEnable
        nameTextView.text = value == "" ? "Введите данные" : value
        nameTextView.textColor = value == "" ? .lightGray : .black
    }

    public func getCellValue() -> String {
        nameTextView.text == "Введите данные" ? "" : nameTextView.text
    }
}
//MARK:  - UITextViewDelegate
extension TextViewTableViewCell: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
        contentView.heightAnchor.constraint(equalTo: nameTextView.heightAnchor, multiplier: 1).isActive = true
        nameTextViewDelegate?.changeSize()
    }
    //при нажатии на текстфилд будет появляться  плейсхолдер и текст при печатании будет черный
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    //при удалении текста в теккстфилде будет снова введите данные
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Введите данные"
            textView.textColor = .lightGray
        }
    }
}
//MARK:  - setConstrains

extension TextViewTableViewCell {

    private func setConstrains() {
        NSLayoutConstraint.activate([

            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),

            nameTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            nameTextView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            nameTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
