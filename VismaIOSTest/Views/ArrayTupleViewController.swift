//
//  ArrayTupleViewController.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 1/6/21.
//

import UIKit

class ArrayTupleViewController: UIViewController {
    var arrayTupleViewModel: ArrayTupleViewModel?

    @IBOutlet weak var arrayLabel: UILabel!

    @IBOutlet weak var rangeUnder10Label: UILabel!
    @IBOutlet weak var rangeUnder100Label: UILabel!
    @IBOutlet weak var rangeOver100Label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        arrayTupleViewModel = ArrayTupleViewModel(arrayTupleViewController: self)
    }
}
