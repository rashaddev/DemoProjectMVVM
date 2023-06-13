//
//  HomeTableViewCell.swift
//  Demo1
//
//  Created by Jahan on 14/06/2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var detailLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configCell(model : HomeModel){
        titleLabel.text = model.title
        detailLabel.text = model.description
    }
    
}
