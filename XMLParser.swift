//
//  XMLParser.swift
//  GatorFeed
//
//  Created by Calvin Nisbet on 2015-10-03.
//  Copyright © 2015 Lone Pine Creative. All rights reserved.
//

import UIKit

//colours #f37021 - orange, #005496 - blue

@objc protocol XMLParserDelegate{
    func parsingWasFinished()
}

class XMLParser: NSObject, NSXMLParserDelegate {

    //Array of Parsed Object - Each Object is Dictionary with two String values.
   
    var arrParsedData = [Dictionary<String, String>]()
    var currentDataDictionary = Dictionary<String, String>()
    var currentElement = ""
    var foundCharacters = ""
    var delegate: XMLParserDelegate?
 
    
    func startParsingWithContentsOfURL(rssURL: NSURL) {
        let parser = NSXMLParser(contentsOfURL: rssURL)
        parser!.delegate = self
        parser!.parse()
    }
    
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        currentElement = elementName
    }
    
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if (currentElement == "title" && currentElement != "Appcoda") || currentElement == "link" || currentElement == "pubDate"{
            foundCharacters += string
        }
    }
    
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if !foundCharacters.isEmpty {
            
            if elementName == "link"{
                foundCharacters = (foundCharacters as NSString).substringFromIndex(3)
            }
            
            currentDataDictionary[currentElement] = foundCharacters
            
            foundCharacters = ""
            
            if currentElement == "pubDate" {
                arrParsedData.append(currentDataDictionary)
            }
        }
    }
    
    
    func parserDidEndDocument(parser: NSXMLParser) {
        delegate?.parsingWasFinished()
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        print(parseError.description)
    }
    
    
    func parser(parser: NSXMLParser, validationErrorOccurred validationError: NSError) {
        print(validationError.description)
    }
}

