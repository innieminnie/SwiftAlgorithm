//
//  929_UniqueEmailAddresses.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/09/22.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation
import XCTest

class UniqueEmailAddresses{
    func numUniqueEmails(_ emails: [String]) -> Int {
        var emailSet = Set<Substring>()
        
        for val in emails{
            let email = val.split(separator: "@")
            let localName = email.first!.split(separator:".").joined().split(separator: "+").first!
            let domainName = email.last!
            let fullName = localName+"@"+domainName
            
            if !emailSet.contains(fullName){
                emailSet.insert(fullName)
            }
        }
        return emailSet.count
    }
}
extension SolutionTests{
    func testnumUniqueEmail_case1(){
        let emails = ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
        let expected = 2
        
        let actual = UniqueEmailAddresses().numUniqueEmails(emails)
        
        XCTAssertEqual(expected, actual)
        
        
    }
    
    func testnumUniqueEmail_case2(){
        let emails = ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
        let expected = 2
        
        let actual = UniqueEmailAddresses().numUniqueEmails(emails)
        
        XCTAssertEqual(expected, actual)
    }

    func testnumUniqueEmail_case3(){
        let emails = ["test.email+alex@leetcode.com","test.email.leet+alex@code.com"]
        let expected = 2
        
        let actual = UniqueEmailAddresses().numUniqueEmails(emails)
        
        XCTAssertEqual(expected, actual)
    }
}
