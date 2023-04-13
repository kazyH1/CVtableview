//
//  CollectionViewCell.swift
//  CVtableview
//
//  Created by HuyNguyen on 09/03/2023.
//

import UIKit

protocol CollectionViewCellDelegate: AnyObject {
    func actionIcon(with rowSelect: Int)
}

class CollectionViewCell: UICollectionViewCell {
    var row = 0
    weak var delegate: CollectionViewCellDelegate?
    @IBAction func btnIcon(_ sender: Any) {
        delegate?.actionIcon(with: row)
    }
    @IBOutlet weak var btnIcon: UIButton!
    @IBOutlet weak var lbText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configCell(dataclv: DataCLV, row: Int) {
        self.row = row
        backgroundColor = dataclv.color
        lbText.text = dataclv.nameItem
        if let image = UIImage(named: dataclv.icon) {
            let resizedImage = image.resizeImage(targetSize: CGSize(width: 30, height: 30))
            btnIcon.setImage(resizedImage, for: .normal)
        }
    }
}
extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage {
        let size = self.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Tính toán tỷ lệ giữa chiều rộng và chiều cao để tìm ra tỷ lệ nhỏ nhất
        let ratio = min(widthRatio, heightRatio)
        
        // Tính toán kích thước mới dựa trên tỷ lệ nhỏ nhất đã tính toán
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        
        // Vẽ lại hình ảnh với kích thước mới đã tính toán
        let renderer = UIGraphicsImageRenderer(size: newSize)
        let newImage = renderer.image { (context) in
            self.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        }
        return newImage
    }
}
