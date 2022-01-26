//
//  TaskViewController.swift
//  MyCoreData
//
//  Created by Kuat Bodikov on 26.01.2022.
//

import UIKit

class TaskViewController: UIViewController {
    
    private lazy var taskTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "New Task"
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        createButton(
            withTitle: "Save Task",
            andColor: UIColor(
                red: 21/255,
                green: 101/255,
                blue: 192/255,
                alpha: 194/255),
            action: UIAction { _ in self.dismiss(animated: true)})
    }()
    
    private lazy var cancelButton: UIButton = {
        createButton(withTitle: "Cancel",
                     andColor: .systemRed,
                     action: UIAction { _ in self.dismiss(animated: true)})
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubViews(subviews: taskTextField, saveButton, cancelButton)
        setConstrains()
    }
    

    private func setupSubViews(subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstrains() {
        taskTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taskTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            taskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            taskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: taskTextField.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    private func createButton(withTitle title: String, andColor color: UIColor, action: UIAction) -> UIButton {
        var buttonCofig = UIButton.Configuration.filled()
        buttonCofig.baseBackgroundColor = color
        
        var atributes = AttributeContainer()
        
        atributes.font = UIFont.boldSystemFont(ofSize: 18)
        buttonCofig.attributedTitle = AttributedString(title, attributes: atributes)
        
        return UIButton(configuration: buttonCofig, primaryAction: action)
    }
}
