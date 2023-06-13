//
//  HomeHeaderTableViewCell.swift
//  Demo1
//
//  Created by Jahan on 14/06/2023.
//

import UIKit

class HomeHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel : UILabel!
    @IBOutlet weak var cityImageView : UIImageView!
    @IBOutlet weak var weatherConditionLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configCell(model : HomeModel){
        cityNameLabel.text = model.title
        weatherConditionLabel.text = model.description
        cityImageView.imageFromServerURL(model.Image ?? "", placeHolder: UIImage(systemName: "cloud"))
    }
}
