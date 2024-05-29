//
//  PostCell.swift
//  InterviewAssignment
//
//  Created by Vivek Goswami on 29/05/24.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var cellViewModel: PostCellViewModel? {
        didSet {
            idLabel.text = cellViewModel?.id
            titleLabel.text = cellViewModel?.title
            bodyLabel.text = cellViewModel?.body
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
