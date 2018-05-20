//
//  NetManager.swift
//  SogangAllBoard
//
//  Created by 정기웅 on 2018. 5. 20..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetManager {
    static let shared = NetManager()
    
    let ROOT_URL: String = "http://www.sogang.ac.kr/"
    var currentPage = 1
    
    
    func get(board target: Board) {
        let URL = ROOT_URL + target.rawValue
        Alamofire
            .request(URL)
            .responseString { response in
                switch response.result {
                case .success(let value):
                    HTMLParser.shared.parseBachelor(html: value)
                case .failure(let error):
                    print("Network Get Error-- where:/\(target) error:\(error)")
                }
            }
    }
}



