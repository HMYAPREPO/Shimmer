//
//  ViewController2.swift
//  Shimmer
//
//  Created by Macbook on 11/9/17.
//  Copyright © 2017 Ghoststream. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var viewForLayer: UIView!
    
    var layer: CALayer {
        return viewForLayer.layer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayer()
    }
    
    func setUpLayer() {
        layer.backgroundColor = UIColor.blue.cgColor
        layer.borderWidth = 100.0
        layer.borderColor = UIColor.red.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 10.0
    }
    
    func setUpLayer2()
    {
        let layer = CALayer()
        layer.frame = viewForLayer.bounds
        
        layer.contents = UIImage(named: "star")?.cgImage
        layer.contentsGravity = kCAGravityCenter
    }
    
    @IBAction func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
        layer.shadowOpacity = layer.shadowOpacity == 0.7 ? 0.0 : 0.7
    }
    
    @IBAction func pinchGestureRecognized(_ sender: UIPinchGestureRecognizer) {
        //print (sender.scale)
        let offset: CGFloat = sender.scale < 1 ? 5.0 : -5.0
        let oldFrame = layer.frame
        let oldOrigin = oldFrame.origin
        
        let newOrigin = CGPoint(x: oldOrigin.x + offset, y: oldOrigin.y + offset)
        
        print ("offset = \(offset) \(oldOrigin)    newOrigin = \(newOrigin)")
        let newSize = CGSize(width: oldFrame.width + (offset * -2.0), height: oldFrame.height + (offset * -2.0))
        let newFrame = CGRect(origin: newOrigin, size: newSize)
        if newFrame.width >= 100.0 && newFrame.width <= 300.0 {
            layer.borderWidth -= offset
            layer.cornerRadius += (offset / 2.0)
            layer.frame = newFrame
        }
       // sender.scale = 1
    }}
