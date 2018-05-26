//
//  BoardTableViewController.swift
//  SogangAllBoard
//
//  Created by 정기웅 on 2018. 5. 21..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit

class BoardTableViewController: UITableViewController {

    var board: BoardType = .Bachelor

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch self.board {
        case .General: return Boards.shared.GeneralBoard.count
        case .Bachelor: return Boards.shared.BachelorBoard.count
        case .Scholarship: return Boards.shared.ScholarshipBoard.count
        case .Calendar: return Boards.shared.CalendarBoard.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! BoardTableCell
        let info: LineInfo
        switch self.board {
        case .General: info = Boards.shared.GeneralBoard[indexPath.row]
        case .Bachelor: info = Boards.shared.BachelorBoard[indexPath.row]
        case .Scholarship: info = Boards.shared.ScholarshipBoard[indexPath.row]
        case .Calendar:
            info = Boards.shared.CalendarBoard[indexPath.row]
            cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier2", for: indexPath) as! BoardTableCell
            cell.subject.text = info.subject
            cell.period.text = info.period
            
            return cell
        }
        
        cell.subject.text = info.subject
        cell.number.text = info.docNo
        cell.uploadDate.text = info.uploadDate
        cell.views.text = info.views
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let handler = { (context: String) in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "href_view")
            let wv = UIWebView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: UIScreen.main.bounds.width,
                                             height: UIScreen.main.bounds.height))
            wv.loadHTMLString(context, baseURL: nil)
            vc?.view.addSubview(wv)
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        

        let href: String
        switch self.board {
        case .General: href = Boards.shared.GeneralBoard[indexPath.row].href
        case .Bachelor: href = Boards.shared.BachelorBoard[indexPath.row].href
        case .Scholarship: href = Boards.shared.ScholarshipBoard[indexPath.row].href
        case .Calendar: href = Boards.shared.CalendarBoard[indexPath.row].href
        }
        
        switch self.board {
        case .Calendar: NetManager.shared.getCalendarInfo(URL: href, handler)
        default: NetManager.shared.get(URL: href, handler)
        }
    }
   

}
