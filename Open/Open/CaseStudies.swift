//
//  CaseStudies.swift
//  OSL
//
//  Created by ramirez herbert on 2/26/18.
//  Copyright © 2018 ramirez herbert. All rights reserved.
//

import UIKit

class CaseTableViewCell: UITableViewCell {
    
    @IBOutlet var caseStudyLabel: UILabel?
    @IBOutlet var caseStudyImage: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.frame.height / 2
        self.caseStudyImage!.layer.cornerRadius = self.caseStudyImage!.frame.height / 2
    }
    
}
