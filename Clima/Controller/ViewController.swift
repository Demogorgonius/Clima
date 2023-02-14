//
//  ViewController.swift
//  Clima
//
//  Created by Sergey on 14.02.2023.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    
    //MARK: - Variables
    
    
    
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
        image.image = #imageLiteral(resourceName: "background")
        image.addSubview(verticalStackView)
        return image
    }()
    
    lazy var weatherImageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        image.image = UIImage(systemName: "sun.max")
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
        button.setBackgroundImage( UIImage(systemName: "location.circle.fill") , for: .normal)
        button.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        button.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - UILabels
    
    lazy var townNameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 179, height: 33))
        label.text = "Moscow"
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    lazy var cDegreesLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 67, height: 119.5))
        label.text = "C"
        label.font = UIFont.systemFont(ofSize: 100, weight: .light)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var signDegreesLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 38, height: 119.5))
        label.text = "°"
        label.font = UIFont.systemFont(ofSize: 100, weight: .light)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var degreesLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 93, height: 119.5))
        label.text = "21"
        label.font = UIFont.systemFont(ofSize: 80, weight: .black)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - UITextField
    
    lazy var townTextField: UITextField = {
        let text = UITextField(frame: CGRect(x: 0, y: 0, width: 274, height: 40))
        text.font = UIFont.systemFont(ofSize: 25.0, weight: .regular)
        text.textColor = .black
        text.placeholder = "Enter town"
        text.borderStyle = .line
        text.textAlignment = .right
        text.backgroundColor = .gray
        return text
    }()
    
    
    //MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImageView)
        
    }
    
    
    //MARK: - Setup Constraints
    
    
    //MARK: - Methods

    @objc func locationButtonTapped(_ sender: UIButton) {
        
    }
    
    
    @objc func searchButtonTapped(_ sender: UIButton) {
        
        
    }
    

}

