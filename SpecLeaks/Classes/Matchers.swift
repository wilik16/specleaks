//
//  Matchers.swift
//  Nimble
//
//  Created by Leandro Perez on 01/04/2018.
//

import Foundation
import Quick
import Nimble

public func leak() -> Matcher<LeakTest> {

    return Matcher.simple("leak") { expression in

        guard let leakTest = try expression.evaluate() else {
            return MatcherStatus.fail
        }

        return MatcherStatus(bool: leakTest.isLeaking())
    }
}

public func leakWhen<P>(_ action : @escaping (P) -> Any) -> Matcher<LeakTest> where P: AnyObject {

    return Matcher.simple("leak when") { expression in

        guard let leakTest = try expression.evaluate() else {
            return MatcherStatus.fail
        }

        return leakTest.isLeaking(when: action)
    }
}
