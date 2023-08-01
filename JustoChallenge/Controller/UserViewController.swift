//
//  UserViewController.swift
//  JustoChallenge
//
//  Created by Miguel Elduque on 30/07/23.
//

import UIKit

class UserViewController: UIViewController {
    // MARK: - Properties
    var userInfo: Result?
    
    // MARK: - IBOutlets
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userTitleLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var cellPhoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityAndStateLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "User Info"
        if let userInfo = userInfo {
            configureView(with: userInfo)
        }
    }
    
    // MARK: - Helpers
    private func configureView(with user: Result) {
        userNameLabel.text = user.login.username
        genderLabel.text = user.gender
        dateOfBirthLabel.text = user.dob.convertDateFormat()
        phoneLabel.text = user.phone
        cellPhoneLabel.text = user.cell
        emailLabel.text = user.email
        if let imageUrl = URL(string: user.picture.large) {
            userImageView.load(url: imageUrl)
            userImageView.rounded()
        }
        configureNameInfoSection(with: user.name)
        configureLocationSection(with: user.location)
    }
    
    private func configureNameInfoSection(with name: Name) {
        userTitleLabel.text = name.title
        firstNameLabel.text = name.first
        lastNameLabel.text = name.last
    }
    
    private func configureLocationSection(with location: Location) {
        countryLabel.text = location.country
        cityAndStateLabel.text = "\(location.city), \(location.state)"
        addressLabel.text = location.street.fullStreet()
        zipCodeLabel.text = String(location.postcode)
    }

}
