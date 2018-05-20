//
//  Definition.swift
//  SogangAllBoard
//
//  Created by 정기웅 on 2018. 5. 20..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import Foundation


enum BoardType: String {
    case General = "front/boardlist.do?bbsConfigFK=1"
    case Bachelor = "front/boardlist.do?currentPage=1&menuGubun=1&siteGubun=1&bbsConfigFK=2&searchField=ALL&searchValue=&searchLowItem=ALL"
}

struct LineInfo {
    var docNo: String = ""
    var subject: String = ""
    var uploader: String = ""
    var uploadDate: String = ""
    var views: String = ""
    var href: String = ""
}
