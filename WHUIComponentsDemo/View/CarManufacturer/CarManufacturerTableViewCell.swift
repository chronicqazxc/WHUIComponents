//
//  CarManufacturerTableViewCell.swift
//  WHUIComponentsDemo
//
//  Created by Wayne Hsiao on 2019/9/22.
//  Copyright © 2019 Wayne Hsiao. All rights reserved.
//

import UIKit
import WHUIComponents

class ManufacturerTableViewCell: UITableViewCell {
    
    static func nib() -> UINib {
        let manufacturerTableViewCellNib = UINib(nibName: "CarManufacturerTableViewCell", bundle: Bundle.main)
        return manufacturerTableViewCellNib
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        textLabel?.textAlignment = .center
        textLabel?.font = UIFont.whTitle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configBy(viewModel: CarManufacturerViewModel, indexPath: IndexPath) {
        if indexPath.row % 2 != 0 {
            backgroundColor = UIColor.lightGray
        } else {
            backgroundColor = UIColor.white
        }
        let manufacturer = viewModel.data[indexPath.row]
        textLabel?.text = manufacturer.title
    }
    
}
