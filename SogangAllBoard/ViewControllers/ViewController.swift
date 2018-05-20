//
//  ViewController.swift
//  SogangAllBoard
//
//  Created by 정기웅 on 2018. 5. 20..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NetManager.shared.get(board: .main)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

