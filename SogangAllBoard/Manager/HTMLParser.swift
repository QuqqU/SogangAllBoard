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
        case .General, .Bachelor, .Scholarship: parseSogangMain(html: html, board: type)
        case .Calendar: parseCalendar(html: html)
        }
    }
    
    func parseCalendar(html: String) {
        do {
            var calInfo = [LineInfo]()
            try SwiftSoup
                .parse(html).getElementsByClass("select_list").select("li").forEach {
                    var newCalInfo = LineInfo()
                    newCalInfo.subject = try $0.select("a").text()
                    newCalInfo.period = try $0.getElementsByClass("date").text()
                    newCalInfo.href = try $0.select("a").attr("href")
                    
                    calInfo.append(newCalInfo)
                }
            Boards.shared.CalendarBoard = calInfo
        }
        catch(let err) {
            print(err.localizedDescription)
        }
    }
    
    func parseSogangMain(html: String, board type: BoardType){
        do {
            var board = [LineInfo]()
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
                    board.append(newLine)
                }
            
            switch type {
            case .General:
                Boards.shared.GeneralBoard = board
            case .Bachelor:
                Boards.shared.BachelorBoard = board
            case .Scholarship:
                Boards.shared.ScholarshipBoard = board
            default: ()
            }
        }
        catch(let err) {
            print(err.localizedDescription)
        }
    }
    

    
    
    
    
}
