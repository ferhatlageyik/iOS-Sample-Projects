//
//  DailyViewController.swift
//  Weather App
//
//  Created by Ferhat Geyik on 4.06.2022.
//

import UIKit

class DailyViewController: UIViewController {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherStatusLabel: UILabel!
    
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var getWeatherButton: UIButton!
    
    
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    @IBOutlet weak var windwardLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()

    }
    
    private func initViews() {
        getWeatherButton.layer.cornerRadius = 10
    }
    
    
    //MARK: - Actions
    
    @IBAction func getWeatherButtonTapped(_ sender: UIButton) {
        
        self.hideKeyboardWhenTappedAround()
        
        if let cityName = cityNameTextField.text, cityNameTextField.text != "" {
                updateUI(cityName: cityName)
            
                } else {
                    showAlertEmptyCityName()
                }
            
    }
    
    //MARK: - Functions
    
    func updateUI(cityName: String) {
        
        let clientService = ClientNetworkService()
          clientService.searchCity(cityName: cityName) {[weak self] response, error in
              guard let weatherDescription = response?.weather.first, let today = response else { return }
              
              DispatchQueue.main.async {
                  self?.dateLabel.text = today.dt.convertDateIntervalToHourString()
                  self?.temperatureLabel.text = String(Int(today.main.temperature.kelvinToCelcius())) + "º"
                  self?.cityNameLabel.text = today.name
                  self?.weatherStatusLabel.text = weatherDescription.weatherDescription
                  
                  self?.maxTempLabel.text = String(Int(today.main.tempMax.kelvinToCelcius())) + "º"
                  self?.minTempLabel.text = String(Int(today.main.tempMin.kelvinToCelcius())) + "º"
                  
                  self?.windwardLabel.text = String(today.wind.deg)
                  self?.windSpeedLabel.text = "\(String(format: "%1.f", today.wind.speed)) km/h"
                  
                  self?.pressureLabel.text = String(Double(today.main.pressure / 1000))
                  self?.humidityLabel.text = "%\(String(today.main.humidity))"
                  
                }
              
            }
            
        }
    
    
    func showAlertEmptyCityName() {
        
        let alert = UIAlertController(title: "Warning", message: "Please enter a city name", preferredStyle: .alert)
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    
   
}
