//
//  ArrayTupleViewModel.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 1/6/21.
//

import Foundation


class ArrayTupleViewModel {
    let arrayTupleViewController: ArrayTupleViewController

    var intArray = [42, 7, 23, 146, 19]

    init(arrayTupleViewController: ArrayTupleViewController) {
        self.arrayTupleViewController = arrayTupleViewController
        updateArrayLabel(array: intArray)
        updateTuplesCount(intArray: intArray)
    }
}

// - MARK: refresh UI methods
extension ArrayTupleViewModel {
    func updateArrayLabel(array:Array<Int>) {
        var text = ""
        for item in array {
            if text.isEmpty {
                text = "\(item)"
            } else {
                text.append(", \(item)")
            }
        }
        text = "[ \(text) ]"
        arrayTupleViewController.arrayLabel.text = text
    }


    func updateTuplesCount(intArray: [Int]) {
        let tuples = getTheNumbersInRanges(intArray: intArray)
        arrayTupleViewController.rangeUnder10Label.text = "\(tuples.0)"
        arrayTupleViewController.rangeUnder100Label.text = "\(tuples.1)"
        arrayTupleViewController.rangeOver100Label.text = "\(tuples.2)"
    }
}

extension ArrayTupleViewModel {
    func getTheNumbersInRanges(intArray: [Int]) -> (Int, Int, Int) {
        let theNumberValuesInRange1 = intArray.filter {0..<10 ~= $0}.count
        let theNumberValuesInRange2 = intArray.filter {10..<100 ~= $0}.count
        let theNumberValuesInRange3 = intArray.filter {100 < $0}.count
        return (theNumberValuesInRange1, theNumberValuesInRange2, theNumberValuesInRange3)
    }
}
