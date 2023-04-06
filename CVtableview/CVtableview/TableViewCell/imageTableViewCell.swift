//
//  imageTableViewCell.swift
//  CVtableview
//
//  Created by HuyNguyen on 01/03/2023.
//

import UIKit

class imageTableViewCell: UITableViewCell {

    @IBOutlet weak var lbDetail: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(data: Data) {
        imgUser.image = UIImage(named: data.img)
        lbDetail.text = data.Detail
    }
}
