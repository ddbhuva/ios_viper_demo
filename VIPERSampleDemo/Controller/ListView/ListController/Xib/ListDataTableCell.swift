//
//  ListDataTableCell.swift
//  VIPERSampleDemo
//
//  Created by Kevin on 29/11/22.
//

import UIKit

class ListDataTableCell: UITableViewCell {

    @IBOutlet weak var imgVIew: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
