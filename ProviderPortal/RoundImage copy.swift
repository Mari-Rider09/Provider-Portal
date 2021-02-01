//
//  RoundImage.swift
//  myChatApp
//
//  Created by Apple on 27/08/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class RoundImage: UIImageView {

    override init(image: UIImage?) {
        super.init(image: image)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        self.layer.borderWidth = 5
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
}
