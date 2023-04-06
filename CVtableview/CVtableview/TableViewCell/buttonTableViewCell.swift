//
//  buttonTableViewCell.swift
//  CVtableview
//
//  Created by HuyNguyen on 01/03/2023.
//

import UIKit
protocol TableViewCellDelegate: AnyObject {
    func makeCall(with phoneNumber: String)
}

class buttonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var btnCall: UIButton!
    @IBOutlet weak var imgBackground: UIImageView!
    
    weak var delegate: TableViewCellDelegate?
    var phoneNumber: String?
    
    
    @IBAction func btnCallPressed(_ sender: Any) {
        guard let phoneNumber = phoneNumber else { return }
                delegate?.makeCall(with: phoneNumber)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell(data: Data) {
        imgBackground.image = UIImage(named: "Image3")
        phoneNumber = data.SDT
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
