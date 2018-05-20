//
//  HTMLParser.swift
//  SogangAllBoard
//
//  Created by 정기웅 on 2018. 5. 20..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import Foundation
import SwiftSoup


class HTMLParser {
    static let shared = HTMLParser()
    

    func parse(html: String, board type: BoardType) {
        switch type {
        case .General: parseGeneral(html: html)
        case .Bachelor: parseBachelor(html: html)
        }
    }
    
    func parseGeneral(html: String){
        do {
            Boards.shared.GeneralBoard.removeAll()
            try SwiftSoup
                .parse(html).select("tr").forEach {
                    let elements = try $0.select("td").array()
                    if elements.count != 6 { return }
                    var newLine = LineInfo()
                    
                    for i in 0..<6 {
                        let element = try elements[i].text()
                        switch i {
                        case 0: newLine.docNo = element
                        case 1: newLine.subject = element
                        case 2:
                            newLine.uploader = element
                            newLine.href = try $0.select("a").attr("href")
                        case 3: continue
                        case 4: newLine.uploadDate = element
                        case 5: newLine.views = element
                        default: ()
                        }
                    }
                    Boards.shared.GeneralBoard.append(newLine)
            }
        } catch(let err) {
            print(err.localizedDescription)
        }
        dump(Boards.shared.GeneralBoard)
    }
    
    
    func parseBachelor(html: String){
        do {
            Boards.shared.BachelorBoard.removeAll()
            try SwiftSoup
                .parse(html).select("tr").forEach {
                    let elements = try $0.select("td").array()
                    if elements.count != 6 { return }
                    var newLine = LineInfo()
                    
                    for i in 0..<6 {
                        let element = try elements[i].text()
                        switch i {
                        case 0: newLine.docNo = element
                        case 1: newLine.subject = element
                        case 2:
                            newLine.uploader = element
                            newLine.href = try $0.select("a").attr("href")
                        case 3: continue
                        case 4: newLine.uploadDate = element
                        case 5: newLine.views = element
                        default: ()
                        }
                    }
                   Boards.shared.BachelorBoard.append(newLine)
                }
        } catch(let err) {
            print(err.localizedDescription)
        }
        dump(Boards.shared.BachelorBoard)
    }
    
    
    
    
}
