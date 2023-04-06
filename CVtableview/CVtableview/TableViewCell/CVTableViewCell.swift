//
//  CVTableViewCell.swift
//  CVtableview
//
//  Created by HuyNguyen on 01/03/2023.
//

import UIKit

class CVTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbName: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(data: Data) {
        lbTitle.text = data.nameTitle
        lbName.text = data.nameLbName
    }
    
}
