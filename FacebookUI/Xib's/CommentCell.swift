//
//  CommentCell.swift
//  FacebookUI
//
//  Created by Rohit Saini on 20/02/21.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var commentLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.layer.cornerRadius = 16
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
