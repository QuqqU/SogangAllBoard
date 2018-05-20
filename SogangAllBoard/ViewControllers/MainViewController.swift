//
//  MainViewController.swift
//  SogangAllBoard
//
//  Created by 정기웅 on 2018. 5. 21..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetManager.shared.get(board: .General)
        NetManager.shared.get(board: .Bachelor)
    }

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? BoardTableViewController else { return }
        switch segue.identifier {
        case "bachelor_segue": vc.board = .Bachelor
        case "general_segue": vc.board = .General
        default: ()
        }
        
    }
  

}
