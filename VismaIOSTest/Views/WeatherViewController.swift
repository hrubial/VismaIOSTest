//
//  WeatherViewController.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 31/5/21.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!

    @IBOutlet weak var gpsStatusLabel: UILabel!

    var weatherViewModel: WeatherViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherViewModel = WeatherViewModel(weatherViewController: self)
    }
}
