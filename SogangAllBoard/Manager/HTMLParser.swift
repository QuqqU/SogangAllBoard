//
//  HTMLParsingManager.swift
//  SogangAllBoard
//
//  Created by 정기웅 on 2018. 5. 20..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import Foundation
import SwiftSoup

class HTMLParsingManager {
    static let shared = HTMLParsingManager()
    
    func f(html: String){
        do {
            let doc: Document = try SwiftSoup.parse(html)
            
            
            //"<p>An <a href='http://example.com/'><b>example</b></a> link.</p>";
            let links: Elements = try! doc.select("a")
            for link in links {
                let linkText: String = try link.text()
                print(linkText)
            }
            
            /*
            
            let text: String = try! doc.body()!.text(); // "An example link"
            let linkHref: String = try! link.attr("href"); // "http://example.com/"
            let linkText: String = try! link.text(); // "example""
            
            let linkOuterH: String = try! link.outerHtml(); // "<a href="http://example.com"><b>example</b></a>"
            let linkInnerH: String = try! link.html(); // "<b>example</b>"
            */
        } catch Exception.Error( _, let message) {
            print(message)
        } catch {
            print("error")
        }
        
    }
    
    
    
    
}
