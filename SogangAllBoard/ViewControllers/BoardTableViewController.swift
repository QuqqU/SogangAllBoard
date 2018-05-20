//
//  BoardTableViewController.swift
//  SogangAllBoard
//
//  Created by 정기웅 on 2018. 5. 21..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit

class BoardTableViewController: UITableViewController {

    var board: BoardType = .General

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch self.board {
        case .General: return Boards.shared.GeneralBoard.count
        case .Bachelor: return Boards.shared.BachelorBoard.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! BoardTableCell
        
        let info: LineInfo
        switch self.board {
        case .General: info = Boards.shared.GeneralBoard[indexPath.row]
        case .Bachelor: info = Boards.shared.BachelorBoard[indexPath.row]
        }
        
        cell.subject.text = info.subject
        cell.number.text = info.docNo
        cell.uploadDate.text = info.uploadDate
        cell.views.text = info.views
        return cell
    }
    

   


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
