//
//  fourthViewController.swift
//  OSL
//
//  Created by ramirez herbert on 2/25/18.
//  Copyright © 2018 ramirez herbert. All rights reserved.
//

import UIKit

class fourthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     let elements = ["qxgo", "christinacape", "lovejacket", "kieran", "wearone", "supportvest"]

    @IBOutlet var tableView: UITableView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "caseCell") as! CaseTableViewCell
        
        cell.caseStudyLabel!.text = elements[indexPath.row]
        cell.caseStudyImage!.image = UIImage(named: elements[indexPath.row])
        
        return cell
    }

}
