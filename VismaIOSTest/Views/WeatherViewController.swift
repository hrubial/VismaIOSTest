//
//  WeatherViewController.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 31/5/21.
//

import UIKit

class WeatherViewController: UIViewController {
    var weatherViewModel: WeatherViewModel?


    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!

    @IBOutlet weak var gpsStatusLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        weatherViewModel = WeatherViewModel(weatherViewController: self)
    }


    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        weatherViewModel?.stopUpdating()
    }
}
