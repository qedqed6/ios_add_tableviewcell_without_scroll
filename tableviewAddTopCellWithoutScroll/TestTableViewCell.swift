//
//  TestTableViewCell.swift
//  tableviewAddTopCellWithoutScroll
//
//  Created by peter on 2022/3/11.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
