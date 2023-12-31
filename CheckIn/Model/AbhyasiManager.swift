//
//  AbhyasiManager.swift
//  CheckIn
//
//  Created by Anokhi Shah on 23.09.23.
//

import Foundation

struct AbhyasiManager{
    var info: String = ""
    
    init(_ info: String) {
        self.info = info
    }
    
    
    func isValidEmail() -> Bool{
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#

        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: info)
    }

    
    func isValidNumber() -> Bool {
        let phoneRegex = #"^\+91[6-9]\d{9}$"#
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: info)
    }
    
    func isValidId() -> Bool {
        let pattern = try! NSRegularExpression(pattern: "^[A-Za-z]{6}\\d{3}|[A-Za-z]\\d{8}$", options: [])
        let range = NSRange(location: 0, length: info.utf16.count)
        let isValid = pattern.firstMatch(in: info, options: [], range: range) != nil
        return isValid
    }
}
