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
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.tintColor = .white
        NetManager.shared.get(board: .General)
        NetManager.shared.get(board: .Bachelor)
        NetManager.shared.get(board: .Scholarship)
        NetManager.shared.get(board: .Calendar)
    }

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? BoardTableViewController else { return }
        switch segue.identifier {
        case "general_segue": vc.board = .General
        case "bachelor_segue": vc.board = .Bachelor
        case "scholarship_segue": vc.board = .Scholarship
        case "calendar_segue": vc.board = .Calendar
        default: print("Error - segue.identifier is not invalid.")
        }
        
    }
  

}
