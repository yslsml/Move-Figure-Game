//
//  StartViewController.swift
//  MoveFigureGame
//
//  Created by Milana Antonova on 7.01.23.
//

import UIKit

class StartViewController: UIViewController {

    @IBAction func startButtonPressed(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
