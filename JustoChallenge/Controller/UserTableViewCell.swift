//
//  UserTableViewCell.swift
//  JustoChallenge
//
//  Created by Miguel Elduque on 30/07/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var userIconImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(with user: Result) {
        nameLabel.text = user.name.fullName(withTitle: true)
        if let imageUrl = URL(string: user.picture.thumbnail) {
            userIconImageView.load(url: imageUrl)
            userIconImageView.rounded()
        }
    }
    
}
