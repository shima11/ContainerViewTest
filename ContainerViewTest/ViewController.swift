//
//  ViewController.swift
//  ContainerViewTest
//
//  Created by shima jinsei on 2016/11/25.
//  Copyright © 2016年 Jinsei Shima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.lightGray
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.panGesture(sender:)))
        containerView.addGestureRecognizer(panGesture)
    }

    func panGesture(sender: UIPanGestureRecognizer) {
        print("pan gesture")
    }

}


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

