//
//  Matchers.swift
//  Nimble
//
//  Created by Leandro Perez on 01/04/2018.
//

import Foundation
import Quick
import Nimble

public func leak() -> Nimble.Predicate<LeakTest> {

    return Nimble.Predicate.simple("leak") { expression in

        guard let leakTest = try expression.evaluate() else {
            return PredicateStatus.fail
        }

        return PredicateStatus(bool: leakTest.isLeaking())
    }
}

public func leakWhen<P>(_ action : @escaping (P) -> Any) -> Nimble.Predicate<LeakTest> where P: AnyObject {

    return Nimble.Predicate.simple("leak when") { expression in

        guard let leakTest = try expression.evaluate() else {
            return PredicateStatus.fail
        }

        return leakTest.isLeaking(when: action)
    }
}
