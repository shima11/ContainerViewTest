//
//  ViewController.swift
//  ContainerViewTest
//
//  Created by shima jinsei on 2016/11/25.
//  Copyright © 2016年 Jinsei Shima. All rights reserved.
//

import UIKit

enum ContainerviewState {
    case Top
    case Medium
    case Bottom
}
enum SwipeDirection {
    case Up
    case Down
    case None
}

class ViewController: UIViewController {

    @IBOutlet weak var containerMapView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerViewTopMargin: NSLayoutConstraint!
    
    var state: ContainerviewState = ContainerviewState.Top
    var swipeState: SwipeDirection = SwipeDirection.None
    
    var currentPoint: CGPoint!
    var prePoint: CGPoint!
    var distance: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.panGesture(sender:)))
        containerView.addGestureRecognizer(panGesture)
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        containerViewTopMargin.constant = view.frame.height*0.6
    }
    
    func panGesture(sender: UIPanGestureRecognizer) {
        if sender.state == .began {
            prePoint = sender.location(in: self.view)
        }
        
        if sender.state == .changed {
            currentPoint = sender.location(in: self.view)
            distance = currentPoint.y - prePoint.y
            containerViewTopMargin.constant += distance // ドラッグ移動
            prePoint = currentPoint
        }
        
        if sender.state == .ended {

            if distance > 0 { swipeState = SwipeDirection.Down }
            else if distance < 0 { swipeState = SwipeDirection.Up }
            else if distance == 0 { swipeState = SwipeDirection.None }
            
            if containerViewTopMargin.constant < self.view.frame.height*0.4 {
                switch swipeState {
                case SwipeDirection.Up:
                    moveView(margin: 64)
                case SwipeDirection.None:
                    moveView(margin: view.frame.height*0.6)
                case SwipeDirection.Down:
                    moveView(margin: view.frame.height*0.6)
                }
            }
            else if containerViewTopMargin.constant < self.view.frame.height*0.7 {
                switch swipeState {
                case SwipeDirection.Up:
                    moveView(margin: 64)
                case SwipeDirection.None:
                    moveView(margin: view.frame.height*0.6)
                case SwipeDirection.Down:
                    moveView(margin: view.frame.height-80)
                }
            }
            else if containerViewTopMargin.constant < self.view.frame.height {
                switch swipeState {
                case SwipeDirection.Up:
                    moveView(margin: view.frame.height*0.6)
                case SwipeDirection.None:
                    moveView(margin: view.frame.height-80)
                case SwipeDirection.Down:
                    moveView(margin: view.frame.height-80)
                }
            }

        }
    }
    
    // container viewを移動アニメーション
    func moveView(margin: CGFloat) {
        self.view.setNeedsUpdateConstraints()
        containerViewTopMargin.constant = margin
        UIView.animate(withDuration: 0.4,
                       delay: 0.0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.8,
                       options: UIViewAnimationOptions.curveLinear,
                       animations: { () -> Void in
                        self.view.layoutIfNeeded()
        }) { (Bool) -> Void in
            // finished animation
        }
    }
    
}


// touch event
//extension ViewController {
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
////        let touchEvent = touches.first
//        print("touch began")
//    }
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesEnded(touches, with: event)
//        print("touch ended")
//    }
//    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesMoved(touches, with: event)
//        print("touch moved")
////        let touchEvent = touches.first
////        if (touchEvent?.view?.isEqual(containerView))! {
////            print("container view moved")
////        }
//    }
//}

