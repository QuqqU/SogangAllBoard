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
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor : UIColor.white
        ]
        
        [BoardType.General, .Bachelor, .Scholarship, .Calendar].forEach {
            NetManager.shared.get(board: $0)
        }
    }
    
   
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? BoardTableViewController else { return }
        switch segue.identifier {
        case "general_segue":
            vc.board = .General
            vc.navigationItem.title = "일반공지"
        case "bachelor_segue":
            vc.board = .Bachelor
            vc.navigationItem.title = "학사공지"
        case "scholarship_segue":
            vc.board = .Scholarship
            vc.navigationItem.title = "장학공지"
        case "calendar_segue":
            vc.board = .Calendar
            vc.navigationItem.title = "오늘일정"
        default: print("Error - segue.identifier is not invalid.")
        }
        
    }
  

}
