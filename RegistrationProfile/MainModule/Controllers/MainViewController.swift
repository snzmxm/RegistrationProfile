//
//  MainViewController.swift
//  RegistrationProfile
//
//  Created by SNZ on 07.03.2023.
//

import UIKit

final class MainViewController: UIViewController {

    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let mainTableView = MainTableView()

    private var userModel = UserModel()

    override func viewWillLayoutSubviews() {
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.width / 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstrains()
        getUserModel()
        setValueArray()

    }

    private func setupViews() {
        title = "Просмотр"
        view.backgroundColor = .white

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Редактировать",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(edditingTapped))
        view.addView(mainTableView)
        view.addView(userPhotoImageView)
    }
    @objc func edditingTapped() {
        let ediitingTableViewController = EditingViewController(userModel, userPhoto: userPhotoImageView.image)
        navigationController?.pushViewController(ediitingTableViewController, animated: true)
    }

    private func getUserModel() {
        userModel = UserDefaultsHelper.getUserModel()
        let userPhoto = UserDefaultsHelper.loadUserImage()
        userPhotoImageView.image = userPhoto
    }

    private func saveEditModel(_ model: UserModel) {
        UserDefaultsHelper.saveUserValue(Resources.NameFields.firstName.rawValue, model.firstName)
        UserDefaultsHelper.saveUserValue(Resources.NameFields.secondName.rawValue, model.secondName)
        UserDefaultsHelper.saveUserValue(Resources.NameFields.thirdName.rawValue, model.thirdName)
        UserDefaultsHelper.saveUserValue(Resources.NameFields.birdthDay.rawValue, model.birdthDay)
        UserDefaultsHelper.saveUserValue(Resources.NameFields.sex.rawValue, model.sex)

    }

    public func getValueArray() -> [String] {
        var valueArray = [String]()
        for key in Resources.NameFields.allCases {
            let value = UserDefaultsHelper.getUserValue(key.rawValue)
            valueArray.append(value)
        }
        return valueArray
    }

    public func setValueArray() {
        let valueArray = getValueArray()
        mainTableView.setValueArray(valueArray)
        mainTableView.reloadData()
    }

    public func changeUserModel(model: UserModel) {
        //save model
        saveEditModel(model)
        // refresh model
        userModel = model
        setValueArray()
        mainTableView.reloadData()
    }

    public func changeuserPhoto(image: UIImage?) {
        userPhotoImageView.image = image
        guard let userPhoto = image else { return }
        UserDefaultsHelper.saveuserImage(image: userPhoto)
    }

}
//MARK: - v
extension MainViewController {

    private func setConstrains() {
        NSLayoutConstraint.activate([

            userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            userPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100),



            mainTableView.topAnchor.constraint(equalTo: userPhotoImageView.bottomAnchor, constant: 10),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)

        ])

    }
}
