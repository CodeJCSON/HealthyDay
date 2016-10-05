//
//  StartRunningButton.swift
//  HealthyDay
//
//  Created by Linsw on 16/10/5.
//  Copyright © 2016年 Linsw. All rights reserved.
//

import UIKit

class StartRunningButton: UIButton {

    let buttonDiameter : CGFloat = 100 //buttonRadius, should change in main.storyboard
    let ringGap : CGFloat = 5
    var animationProcess : CGFloat = 0 {
        didSet{
            
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = buttonDiameter/2
        layer.backgroundColor = theme.lightColor.cgColor
        tintColor = UIColor.white
        
        let ringLayer = CALayer()
        ringLayer.frame = CGRect(x: -ringGap, y: -ringGap, width: buttonDiameter+ringGap*2, height: buttonDiameter+ringGap*2)
        ringLayer.cornerRadius = buttonDiameter/2+ringGap
        ringLayer.borderColor = theme.lightColor.cgColor
        ringLayer.borderWidth = 1
        layer.addSublayer(ringLayer)
    }
//MARK: Animation helper    
    private func hide(process:CGFloat){
        alpha = 1 - process
    }
    
    private func show(process:CGFloat){
        alpha = process
    }
    
    func panAnimation(process:CGFloat, currentState:MainVCState){
        assert(process >= -1 && process <= 1)
        switch process {
        case 1:
            show(process: 1)
        case -1:
            hide(process: 1)
        default:
            switch currentState{
            case .step:
                if process > 0{
                    show(process: process)
                }
            case .running:
                if process < 0{
                    hide(process: -process)
                }
            }
            
        }
    }
}