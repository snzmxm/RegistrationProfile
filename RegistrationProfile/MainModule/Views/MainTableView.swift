//
//  MainTableView.swift
//  RegistrationProfile
//
//  Created by SNZ on 07.03.2023.
//

import UIKit

class MainTableView: UITableView {

    private var valueArray = [String]()

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)

       register(MainTableViewCell.self)

        delegate = self
        dataSource = self

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: -  UITableViewDataSource
extension MainTableView: UITableViewDataSource {

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameFields.allCases.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeReusableCell(MainTableViewCell.self) else {
            return UITableViewCell()
        }

        let nameField = Resources.NameFields.allCases[indexPath.row].rawValue
         let value = valueArray[indexPath.row]
        cell.configure(name: nameField, value: value)
        return cell
    }

    public func setValueArray(_ array: [String]) {
        valueArray = array
    }
}
//MARK: -  UITableViewDelegate
extension MainTableView: UITableViewDelegate {
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

