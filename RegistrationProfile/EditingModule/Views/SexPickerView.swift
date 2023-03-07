//
//  SexPickerView.swift
//  RegistrationProfile
//
//  Created by SNZ on 07.03.2023.
//

import UIKit

protocol SexPickerViewProtocol: AnyObject {
    func didSelect(row: Int)
}

class SexPickerView: UIPickerView {

    weak var sexDelegate: SexPickerViewProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)

        delegate = self
        dataSource = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - UIPickerViewDataSource
extension SexPickerView: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Resources.Sex.allCases.count
    }
}
//MARK: - UIPickerViewDelegate
extension SexPickerView: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        Resources.Sex.allCases[row].rawValue
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sexDelegate?.didSelect(row: row)
    }
}
