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
    
    func parse(html: String){
        do {
            try SwiftSoup
                .parse(html).select("tr").forEach {
                    try $0.select("td").forEach {
                        print(try! $0.text())
                    }
            }
        } catch Exception.Error( _, let message) {
            print(message)
        } catch {
            print("error")
        }
        
    }
    
    
    
    
}
