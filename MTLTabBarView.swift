//
//  MTLTabBarView.swift
//  Motel Is, LLC
//
//  Created by Caleb Oller on 5/9/15.
//  Copyright (c) 2015 Motel. All rights reserved.
//

import UIKit

protocol MTLTabBarViewDelegate {
    func buttonTappedAtIndex(index: Int)
}

class MTLTabBarView: UIView {
    //Private Variables
    private let activeView:UIView! = UIView()
    private var buttons = [UIButton]()
    private var selectedButton:UIButton!
    
    //Public Variables
    var delegate:MTLTabBarViewDelegate?
    var font:UIFont! {
        didSet {
            for button in self.buttons{
                button.titleLabel?.font = font
            }
        }
    }
    
    var titleColorNormal:UIColor! {
        didSet {
            for button in self.buttons{
                button.setTitleColor(titleColorNormal, forState: UIControlState.Normal)
            }
        }
    }
    
    var titleColorSelected:UIColor! {
        didSet {
            for button in self.buttons{
                button.setTitleColor(titleColorSelected, forState: UIControlState.Selected)
            }
        }
    }
    
    var titleColorHighlighted:UIColor! {
        didSet {
            for button in self.buttons{
                button.setTitleColor(titleColorHighlighted, forState: UIControlState.Highlighted)
            }
        }
    }
    
    init(frame: CGRect, titles: [String]){
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.blackColor()
        self.clipsToBounds = true
        
        var index:Int = 0
        var buttonWidth = frame.size.width/CGFloat(titles.count)
        var buttonHeight = frame.size.height
        
        for title in titles{
            var button:UIButton = UIButton(frame: CGRectMake(CGFloat(index) * buttonWidth, 0, buttonWidth, buttonHeight))
            button.setTitle(title, forState: UIControlState.Normal)
            button.addTarget(self, action: "buttonSelected:", forControlEvents: .TouchUpInside)
            button.tag = index
            if (index == 0){
                button.selected = true
                selectedButton = button
            }
            self.addSubview(button)
            buttons.append(button)
            index++
        }
        
        activeView.frame = CGRectMake(selectedButton.frame.size.width * 0.2, CGRectGetMaxY(selectedButton.frame) - 4, selectedButton.frame.size.width * 0.6, 10)
        activeView.backgroundColor = UIColor.whiteColor()
        activeView.layer.cornerRadius = 5
        self.addSubview(activeView)
    }
    
    func buttonSelected(button: UIButton){
        self.clearSelect()
        
        self.selectedButton = button
        self.activeView.frame = CGRectMake(CGRectGetMinX(self.selectedButton.frame) + self.selectedButton.frame.size.width * 0.2, CGRectGetMaxY(self.selectedButton.frame) - 4, self.selectedButton.frame.size.width * 0.6, 10)
        self.selectedButton.selected = true
        self.delegate?.buttonTappedAtIndex(self.selectedButton.tag)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func clearSelect() {
        for button in self.buttons{
            button.selected = false
        }
    }
}
