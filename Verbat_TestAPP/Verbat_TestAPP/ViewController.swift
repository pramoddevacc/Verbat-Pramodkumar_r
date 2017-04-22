//
//  ViewController.swift
//  Verbat_TestAPP
//
//  Created by Pram on 18/04/17.
//  Copyright © 2017 Pram. All rights reserved.
//

import UIKit


var shoppingList: [UIColor] = [UIColor.green, UIColor.red,UIColor.white,UIColor.gray,UIColor.black,UIColor.blue];

class ViewController: UIViewController {
    var removeCount = 0;
    let dataCount = 8;
    @IBAction func reloadAction(_ sender: Any) {
         generateView()
    }
    @IBAction func swipeLeftAction(_ sender: Any) {
        removeSubviewLeftAnimation()
    }
    
    @IBAction func swipeRightAction(_ sender: Any) {
         removeSubviewRightAnimation()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        generateView();
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeleft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeleft)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func generateView()
    {
        for int2 in 1...5 {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let x=CGFloat(50-int2*4)
        let y = CGFloat(50-int2*4)
        let DynamicView = UIView(frame:CGRect(x: x, y: y, width: screenWidth-100, height: screenHeight-200))
        DynamicView.backgroundColor = shoppingList[int2]
        DynamicView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        DynamicView.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        DynamicView.layer.shadowOpacity = 1.0
        DynamicView.layer.shadowRadius = 10.0
        DynamicView.layer.cornerRadius=25
        DynamicView.layer.borderWidth=2
        self.view.addSubview(DynamicView)
            removeCount += 1
        }
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
                removeSubviewRightAnimation()
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                removeSubviewLeftAnimation()
            default:
                break
            }
        }
    }
    
   func removeSubviewLeftAnimation()
   {
    
    if removeCount > 0
    {
        let subview = view.subviews.last
        UIView.transition(with: subview!, duration: 1.325, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            
            // animations
             subview?.frame.origin.y += 20
             subview?.frame.origin.x -= 50
        }, completion: { (finished: Bool) -> () in
            
             subview?.removeFromSuperview()
            
        })
        
    
    removeCount = removeCount-1;
    }
   }
    func removeSubviewRightAnimation()
    {
        if removeCount > 0
        {
            let subview = view.subviews.last
            UIView.transition(with: subview!, duration: 1.325, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                
                // animations
                subview?.frame.origin.y += 20
                subview?.frame.origin.x += 50
            }, completion: { (finished: Bool) -> () in
                
                subview?.removeFromSuperview()
                
            })
            
            removeCount = removeCount-1;
        }
    }


}

