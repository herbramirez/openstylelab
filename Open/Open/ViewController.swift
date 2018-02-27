//
//  ViewController.swift
//  Open
//
//  Created by ramirez herbert on 2/16/18.
//  Copyright © 2018 ramirez herbert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var GifView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GifView.loadGif(name: "sew")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

