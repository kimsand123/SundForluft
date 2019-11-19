//
//  CustomCommentCell.swift
//  SundForluft
//
//  Created by Kim Sandberg on 07/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import UIKit

class CustomCommentCell: UITableViewCell {

    
    @IBOutlet weak var ppmLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
