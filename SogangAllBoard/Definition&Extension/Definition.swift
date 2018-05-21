//
//  Definition.swift
//  SogangAllBoard
//
//  Created by 정기웅 on 2018. 5. 21..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import Foundation


enum BoardType: String {
    case General = "front/boardlist.do?bbsConfigFK=1"
    case Bachelor = "front/boardlist.do?currentPage=1&menuGubun=1&siteGubun=1&bbsConfigFK=2&searchField=ALL&searchValue=&searchLowItem=ALL"
    case Scholarship = "front/boardlist.do?bbsConfigFK=141"
    case Calendar = "front/calendar.do?searchYear=2018&searchMonth=05&searchDay=21"
}


struct LineInfo {
    var docNo: String = ""
    var subject: String = ""
    var uploader: String = ""
    var uploadDate: String = ""
    var period: String = ""
    var views: String = ""
    var href: String = ""
}
