//
//  PostCell.swift
//  FacebookUI
//
//  Created by Rohit Saini on 20/02/21.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var commentsCountLbl: UIButton!
    @IBOutlet weak var postTitleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
