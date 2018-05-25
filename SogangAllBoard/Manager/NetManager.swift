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
    

    func get(URL: String, _ complete: ( (String) -> Void)? = nil) {
        Alamofire
            .request(ROOT_URL + URL)
            .responseString { response in
                switch response.result {
                case .success(let value):
                    complete?(value)
                case .failure(let error):
                    print("Network Get Error-- where:/\(URL) error:\(error)")
                }
        }
    }
    
    func get(board target: BoardType, _ complete: ( () -> Void )? = nil) {
        let URL = ROOT_URL + target.rawValue
        Alamofire
            .request(URL)
            .responseString { response in
                switch response.result {
                case .success(let value):
                    HTMLParser.shared.parse(html: value, board: target)
                case .failure(let error):
                    print("Network Get Error-- where:/\(target) error:\(error)")
                }
                
                complete?()
            }
    }
    
}



