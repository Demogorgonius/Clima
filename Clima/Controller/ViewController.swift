//
//  ViewController.swift
//  Clima
//
//  Created by Sergey on 14.02.2023.
//

import UIKit
import SnapKit
import CoreLocation


class ViewController: UIViewController {
    
    //MARK: - Variables
    
    var weatherManager = WeatherManager()
    var locationManager = CLLocationManager()
    
    
    //MARK: - UIStackView and Views
    
    lazy var verticalStackView: UIStackView = {
        let stack = UIStackView(frame: CGRect(x: 0, y: 0, width: 374, height: 814))
        stack.axis = .vertical
        stack.spacing = 10.0
        stack.alignment = .trailing
        stack.contentMode = .scaleToFill
        stack.distribution = .fill
        [horizontalSearchStackView,
         weatherImageView,
         horizontalConditionStackView,
         townNameLabel,
         putterView].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var horizontalSearchStackView: UIStackView = {
        let stack = UIStackView(frame: CGRect(x: 0, y: 0, width: 374, height: 40))
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        stack.distribution = .fill
        [locationButton,
         townTextField,
         searchButton].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var horizontalConditionStackView: UIStackView = {
        let stack = UIStackView(frame: CGRect(x: 0, y: 0, width: 198, height: 119.5))
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        stack.distribution = .fill
        [degreesLabel,
         signDegreesLabel,
         cDegreesLabel].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 600))
        image.contentMode = .scaleAspectFill
        image.image = #imageLiteral(resourceName: "background")
        //        image.addSubview(verticalStackView)
        return image
    }()
    
    lazy var weatherImageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        image.image = UIImage(systemName: "sun.max")
        image.tintColor = .label
        return image
    }()
    
    lazy var putterView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 240, height: 458.5))
        view.backgroundColor = .clear
        return view
    }()
    
    //MARK: - UIBUttons
    
    lazy var locationButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        button.setBackgroundImage( UIImage(systemName: "location.circle.fill"), for: .normal)
        button.tintColor = .label
        button.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        button.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .label
        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - UILabels
    
    lazy var townNameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 179, height: 33))
        label.text = "Moscow"
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        label.textColor = .label
        label.textAlignment = .right
        return label
    }()
    
    lazy var cDegreesLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 67, height: 119.5))
        label.text = "C"
        label.font = UIFont.systemFont(ofSize: 100, weight: .light)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    lazy var signDegreesLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 38, height: 119.5))
        label.text = "°"
        label.font = UIFont.systemFont(ofSize: 100, weight: .light)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    lazy var degreesLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 93, height: 119.5))
        label.text = "21"
        label.font = UIFont.systemFont(ofSize: 80, weight: .black)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - UITextField
    
    lazy var townTextField: UITextField = {
        let text = UITextField(frame: CGRect(x: 0, y: 0, width: 274, height: 40))
        text.font = UIFont.systemFont(ofSize: 25.0, weight: .regular)
        text.textColor = .label
        text.placeholder = "Enter town"
        text.borderStyle = .line
        text.textAlignment = .right
        text.backgroundColor = .clear
        text.returnKeyType = .go
        text.autocapitalizationType = .words
        text.isUserInteractionEnabled = true
        return text
    }()
    
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.addSubview(backgroundImageView)
        view.addSubview(verticalStackView)
        setupConstraints()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        townTextField.delegate = self
        weatherManager.delegate = self
        
        
    }
    
    
    //MARK: - Setup Constraints
    
    func setupConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(355.67)
        }
        
        horizontalSearchStackView.snp.makeConstraints { make in
            make.top.equalTo(verticalStackView.snp.top)
            make.leading.equalTo(verticalStackView.snp.leading).offset(10)
            make.trailing.equalTo(verticalStackView.snp.trailing)
            make.height.equalTo(40)
        }
        
        townTextField.snp.makeConstraints { make in
            make.width.equalTo(274)
            make.height.equalTo(40)
        }
        
        locationButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        searchButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        weatherImageView.snp.makeConstraints { make in
            make.height.equalTo(120)
            make.width.equalTo(120)
        }
        
    }
    
    //MARK: - Methods
    
    @objc func locationButtonTapped(_ sender: UIButton) {
        
        locationManager.requestLocation()
        
    }
    
    
    @objc func searchButtonTapped(_ sender: UIButton) {
        
        townTextField.endEditing(true)
        if let cityName = townTextField.text {
            
            weatherManager.fetchWeather(cityName: cityName)
            
        }
        
    }
    
    
}

//MARK: - UITextField extension

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        townTextField.endEditing(true)
        
        
        return true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let cityName = townTextField.text {
            weatherManager.fetchWeather(cityName: cityName)
        }
        townTextField.text = ""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if townTextField.text != "" {
            return true
        } else {
            townTextField.placeholder = "Input town name!"
            return false
        }
    }
    
}

//MARK: - Weather manager delegate

extension ViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        
        degreesLabel.text = weather.temperatureString
        weatherImageView.image = UIImage(systemName: weather.conditionName)
        townNameLabel.text = weather.cityName
        
    }
    
    func didFailWithError(error: Error) {
        
        let alert = UIAlertController(title: "Ошибка", message: error.localizedDescription, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .default) { alertAction in
            return
        }
        
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
}

//MARK: - CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
}

