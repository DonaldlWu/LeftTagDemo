//
//  TagCollectionViewCell.swift
//  LeftTagDemo
//
//  Created by 吳得人 on 2017/10/27.
//  Copyright © 2017年 吳得人. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        backgroundColor = .gray
        textLabel.clipsToBounds = false
        layer.cornerRadius = self.frame.height / 4
    }
    
}
