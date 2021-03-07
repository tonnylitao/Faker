//
//  Faker.swift
//
//
//  Created by Tonny on 6/03/21.
//

import Foundation
import JavaScriptCore

public protocol FakerFunction {
    var rawValue: String { get }
    
    var value: String { get }
}

public extension FakerFunction {
    
    var value: String {
        Faker.context.evaluateScript("\(name)()").toString()
    }
    
    var name: String {
        String(reflecting: self).split(separator: ".").dropFirst().dropLast().joined(separator: ".").lowercased() + "." + self.rawValue
    }
}

public class Faker: NSObject {
    
    static var context: JSContext! = {
        let bundle = Bundle(for: Faker.self)
        
        // js file download from here and save in local
        // https://cdn.rawgit.com/Marak/faker.js/master/examples/browser/index.html
        
        guard let fileUrl = Bundle.module.url(forResource: "faker", withExtension: ".js"),
            let js = try? String(contentsOf: fileUrl, encoding: .utf8),
            let context = JSContext() else {
                fatalError()
        }
        
        // set global for js
        context.evaluateScript("global=this")
        context.evaluateScript(js)
        
        return context
    }()
}


extension Faker {
    
    enum Address: String, CaseIterable, FakerFunction {
        case zipCode
        case city
        case cityPrefix
        case citySuffix
        case streetName
        case streetAddress
        case streetSuffix
        case streetPrefix
        case secondaryAddress
        case county
        case country
        case countryCode
        case state
        case stateAbbr
        case latitude
        case longitude
    }
    
    enum Commerce: String, CaseIterable, FakerFunction {
        case color
        case department
        case productName
        case price
        case productAdjective
        case productMaterial
        case product
    }
    
    enum Company: String, CaseIterable, FakerFunction {
        case suffixes
        case companyName
        case companySuffix
        case catchPhrase
        case bs
        case catchPhraseAdjective
        case catchPhraseDescriptor
        case catchPhraseNoun
        case bsAdjective
        case bsBuzz
        case bsNoun
    }
    
    enum Database: String, CaseIterable, FakerFunction {
        case column
        case type
        case collation
        case engine
    }
    
    enum Date: String, CaseIterable, FakerFunction {
        case past
        case future
        case between
        case recent
        case month
        case weekday
    }
    
    enum Finance: String, CaseIterable, FakerFunction {
        case account
        case accountName
        case mask
        case amount
        case transactionType
        case currencyCode
        case currencyName
        case currencySymbol
        case bitcoinAddress
        case iban
        case bic
    }
    
    enum Hacker: String, CaseIterable, FakerFunction {
        case abbreviation
        case adjective
        case noun
        case verb
        case ingverb
        case phrase
    }
    
    enum Image: String, CaseIterable, FakerFunction {
        case image
        case avatar
        case imageUrl
        case abstract
        case animals
        case business
        case cats
        case city
        case food
        case nightlife
        case fashion
        case people
        case nature
        case sports
        case technics
        case transport
        case dataUri
    }
    
    enum Internet: String, CaseIterable, FakerFunction {
        case avatar
        case email
        case exampleEmail
        case userName
        case `protocol`
        case url
        case domainName
        case domainSuffix
        case domainWord
        case ip
        case ipv6
        case userAgent
        case color
        case mac
        case password
    }
    
    enum Lorem: String, CaseIterable, FakerFunction {
        case word
        case words
        case sentence
        case slug
        case sentences
        case paragraph
        case paragraphs
        case text
        case lines
    }
    
    enum Name: String, CaseIterable, FakerFunction {
        case firstName
        case lastName
        case findName
        case jobTitle
        case prefix
        case suffix
        case title
        case jobDescriptor
        case jobArea
        case jobType
    }
    
    enum Phone: String, CaseIterable, FakerFunction {
        case phoneNumber
        case phoneNumberFormat
        case phoneFormats
    }
    
    enum Random: String, CaseIterable, FakerFunction {
        case number
        case arrayElement
        case objectElement
        case uuid
        case boolean
        case word
        case words
        case image
        case locale
        case alphaNumeric
    }
    
    enum System: String, CaseIterable, FakerFunction {
        case fileName
        case commonFileName
        case mimeType
        case commonFileType
        case commonFileExt
        case fileType
        case fileExt
        case semver
    }
}


/*
Not Support yet
enum Helpers: String, CaseIterable, FakerFunction {
    case createCard
    case contextualCard
    case userCard
    case createTransaction
}
*/
