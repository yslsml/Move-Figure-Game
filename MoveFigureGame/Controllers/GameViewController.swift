//
//  ViewController.swift
//  MoveFigureGame
//
//  Created by Milana Antonova on 6.01.23.
//

import UIKit

class GameViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var upButton: UIButton!
    
    //MARK: - var/let
    let figure = UIView()
    let size: CGFloat = 100
    let step: CGFloat = 30
    
    //MARK: - lifecycle funcs
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.messageLabel.text = ""
        self.createFugure()
        
        let upSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(upSwipeDetected))
        upSwipeRecognizer.direction = .up
        self.view.addGestureRecognizer(upSwipeRecognizer)
        
        let downSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(downSwipeDetected))
        downSwipeRecognizer.direction = .down
        self.view.addGestureRecognizer(downSwipeRecognizer)
        
        let leftSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeDetected))
        leftSwipeRecognizer.direction = .left
        self.view.addGestureRecognizer(leftSwipeRecognizer)
        
        let rightSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipeDetected))
        rightSwipeRecognizer.direction = .right
        self.view.addGestureRecognizer(rightSwipeRecognizer)
    }

    //MARK: - IBActions
    @IBAction func upButtonPressed(_ sender: UIButton) {
        move(direction: .up)
    }
    
    @IBAction func downButtonPressed(_ sender: UIButton) {
        move(direction: .down)
    }
    
    @IBAction func leftButtonPressed(_ sender: Any) {
        move(direction: .left)
    }
    
    @IBAction func rightButtonPressed(_ sender: UIButton) {
        move(direction: .right)
    }
    
    @IBAction func upSwipeDetected() {
        move(direction: .up)
    }
    
    @IBAction func downSwipeDetected() {
        move(direction: .down)
    }
    
    @IBAction func leftSwipeDetected() {
        move(direction: .left)
    }
    
    @IBAction func rightSwipeDetected() {
        move(direction: .right)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - flow funcs
    private func createFugure() {
        let screenWidth: CGFloat = self.view.frame.width
        let screenHeight: CGFloat = self.view.frame.height
        
        figure.frame = CGRect(x: CGFloat(Int(screenWidth)/2) - self.size/2, y: CGFloat(Int(screenHeight)/2) - self.size/2, width: self.size, height: self.size)
        figure.layer.cornerRadius = figure.frame.width/2
        figure.backgroundColor = .orange
        self.view.addSubview(figure)
    }
    
    private func move(direction: Direction) {
        switch direction {
        case .left:
            if figure.frame.origin.x - step > 0 {
                figure.frame.origin.x -= step
                showMessageDirection(.left)
            } else {
                showMessageError(.left)
            }
        case .right:
            if figure.frame.origin.x + step + self.size < self.view.frame.width {
                figure.frame.origin.x += step
                showMessageDirection(.right)
            } else {
                showMessageError(.right)
            }
        case .up:
            if figure.frame.origin.y - step - self.view.safeAreaInsets.top > 0 {
                figure.frame.origin.y -= step
                showMessageDirection(.up)
            } else {
                showMessageError(.up)
            }
        case .down:
            if figure.frame.origin.y + step + self.size < upButton.frame.minY {
                figure.frame.origin.y += step
                showMessageDirection(.down)
            } else {
                showMessageError(.down)
            }
        }
    }
    
    private func showMessageError(_ direction: Direction) {
        messageLabel.text = "Sorry, you cannot move \(direction.rawValue) anymore"
    }
    
    private func showMessageDirection(_ direction: Direction) {
        messageLabel.text = "You are moving \(direction.rawValue)"
    }
}

