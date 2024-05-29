//
//  Filename: LalsinghaniNirav-HW9(ViewController.swift)
//  EID: NVL225
//  Course: CS371L
//
//  Created by Nirav Lalsinghani on 11/9/20.
//  Copyright 2020. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gridSquare: UIView!
    var timer: Timer?
    let squareWidth = UIScreen.main.bounds.width / 9.0
    let squareHeight = UIScreen.main.bounds.height / 19.0
    var dy = 1.0
    var dx = 0.0
    var gridX = 5
    var gridY = 10
    var gameRunning = false

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        gridSquare = UIView(frame: CGRect(x: 0.0, y: 0.0, width: squareWidth, height: squareHeight))
        gridSquare.backgroundColor = UIColor.green
        gridSquare.center = self.view.center
        gridSquare.isHidden = true
        view.addSubview(gridSquare)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(recognizeTapGesture(recognizer:)))
        let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(recognizeSwipeGesture(recognizer:)))
        swipeRightRecognizer.direction = UISwipeGestureRecognizer.Direction.right
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(recognizeSwipeGesture(recognizer:)))
        swipeLeftRecognizer.direction = UISwipeGestureRecognizer.Direction.left
        let swipeDownRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(recognizeSwipeGesture(recognizer:)))
        swipeDownRecognizer.direction = UISwipeGestureRecognizer.Direction.down
        let swipeUpRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(recognizeSwipeGesture(recognizer:)))
        swipeUpRecognizer.direction = UISwipeGestureRecognizer.Direction.up
        
        self.view.addGestureRecognizer(tapRecognizer)
        self.view.addGestureRecognizer(swipeRightRecognizer)
        self.view.addGestureRecognizer(swipeLeftRecognizer)
        self.view.addGestureRecognizer(swipeDownRecognizer)
        self.view.addGestureRecognizer(swipeUpRecognizer)
        
        let timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(runGame), userInfo: nil, repeats: true)
    }
    
    @IBAction func recognizeTapGesture(recognizer: UITapGestureRecognizer){
        if(gameRunning == false){
            gridX = 5
            gridY = 10
            dy = 1.0
            dx = 0.0
            gameRunning = true
            gridSquare.center = self.view.center
            gridSquare.backgroundColor = UIColor.green
            gridSquare.isHidden = false
        }
    }
    
    @IBAction func recognizeSwipeGesture(recognizer: UISwipeGestureRecognizer){
        if let swipeGesture = recognizer as? UISwipeGestureRecognizer {
            switch swipeGesture.direction{
                case UISwipeGestureRecognizer.Direction.right:
                    dy = 0.0
                    dx = 1.0
                case UISwipeGestureRecognizer.Direction.left:
                    dy = 0.0
                    dx = -1.0
                case UISwipeGestureRecognizer.Direction.up:
                    dy = -1.0
                    dx = 0.0
                case UISwipeGestureRecognizer.Direction.down:
                    dy = 1.0
                    dx = 0.0
                default:
                    break
            }
        }
    }
    
    @objc func runGame(){
        if(gameRunning){
            self.gridSquare.frame = CGRect(x: self.gridSquare.frame.origin.x + (self.squareWidth * CGFloat(self.dx)), y: self.gridSquare.frame.origin.y + (self.squareHeight * CGFloat(self.dy)), width: self.squareWidth , height: self.squareHeight)
            gridX = gridX + Int(dx)
            gridY = gridY + Int(dy)
            if(gridX == 1 || gridX == 9 || gridY == 1 || gridY == 19){
                gameRunning = false
                gridSquare.backgroundColor = UIColor.red
                timer?.invalidate()
                timer = nil
            }
        }
    }
    
    


}

