//
//  PostTableViewCell.swift
//  DataFetchAssignment4TableView
//
//  Created by Mac on 21/12/23.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postIdLabel: UILabel!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var bodyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
