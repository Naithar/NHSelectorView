//
//  ITCSelectorView.swift
//  Shaker
//
//  Created by Naithar on 16.09.14.
//  Copyright (c) 2014 'ITC Project' LLC. All rights reserved.
//
//
//import Foundation
//
//class ITCSelectorView : UIView {
//    
//    var selectedItemBackgroundColor : UIColor! = UIColor.blackColor()
//    var selectedItemTextColor : UIColor! = UIColor.whiteColor()
//    var highlightedItemBackgroundColor : UIColor!
//    var highlightedItemTextColor : UIColor!
//    //    var unselectedItemBackgroundColor : UIColor!
//    var unselectedItemTextColor : UIColor! = UIColor.blackColor()
//    
//    var textFont : UIFont = UIFont.systemFontOfSize(16)
//    var useCornerRadius : Bool = true
//    
//    dynamic var currentPage : Int// {
//    //        willSet {
//    //            self.willChangeValueForKey("currentPage")
//    //        }
//    //        didSet {
//    //            self.didChangeValueForKey("currentPage")
//    //        }
//    //    }
//    var selectionView : UIView!
//    
//    var bottomLine: Bool = false
//    var bottomLineView: UIView!
//    var bottomLineColor: UIColor?
//    var bottomLineHeight: CGFloat = 0.5
//    var bottomSelectionLineHeight: CGFloat = 0.5
//    
//    var animateChange: Bool = true
//    
//    var textItems : [String] = [String]()
//    
//    var imageItems : [UIImage] = [UIImage]()
//    var selectedImageItems : [UIImage] = [UIImage]()
//    
//    var buttons : [UIButton] = [UIButton]()
//    
//    required init?(coder aDecoder: NSCoder) {
//        self.currentPage = 0
//        
//        super.init(coder: aDecoder)
//        self.clipsToBounds = true
//        //        self.reloadView()
//    }
//    
//    override init(frame: CGRect) {
//        self.currentPage = 0
//        
//        super.init(frame: frame)
//        self.clipsToBounds = true
//        //        self.reloadView()
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        self.reloadView()
//        
//        self.layoutIfNeeded()
//    }
//    
//    override func awakeFromNib() {
//        self.reloadView()
//    }
//    
//    func reloadView() {
//        for button in self.buttons {
//            button.removeFromSuperview()
//            
//        }
//        
//        self.selectionView?.removeFromSuperview()
//        self.bottomLineView?.removeFromSuperview()
//        
//        self.buttons = []
//        
//        //        self.currentPage = 0
//        
//        let height = self.bounds.height
//        
//        self.createBottomLine()
//        self.createSelectionView(height)
//        
//        if self.textItems.count > 0 {
//            let width = self.bounds.width / CGFloat(self.textItems.count)
//            
//            for var i = 0; i < self.textItems.count; i++ {
//                let button = self.createButton(i, width: width, height: height, text: self.textItems[i])
//                self.addSubview(button)
//                self.buttons.append(button)
//            }
//            
//            return
//        }
//        
//        if self.imageItems.count > 0 {
//            let width = self.bounds.width / CGFloat(self.imageItems.count)
//            
//            for var i = 0; i < self.imageItems.count; i++ {
//                let selectionImage : UIImage! = self.selectedImageItems.count > i ? self.selectedImageItems[i] : nil
//                let button = self.createButton(i, width: width, height: height, text: nil, image: self.imageItems[i], selectionImage: selectionImage)
//                self.addSubview(button)
//                self.buttons.append(button)
//            }
//            
//            
//        }
//    }
//    
//    func createBottomLine() {
//        if self.bottomLine {
//            self.bottomLineView = UIView(frame: CGRect(x: 0, y: self.bounds.height - self.bottomLineHeight, width: self.bounds.width, height: self.bottomLineHeight))
//            self.bottomLineView.backgroundColor = self.bottomLineColor ?? rgb(200, g: 200, b: 200)
//            self.addSubview(self.bottomLineView)
//        }
//    }
//    
//    func createSelectionView(height: CGFloat) {
//        self.selectionView = UIView(frame: CGRectZero)
//        self.selectionView.backgroundColor = self.selectedItemBackgroundColor
//        
//        if !self.bottomLine {
//            self.selectionView.layer.cornerRadius = self.useCornerRadius ?  height / 2 : 0
//        }
//        
//        self.addSubview(self.selectionView)
//    }
//    
//    func createButton(index: Int, width: CGFloat, height: CGFloat, text: String!, image: UIImage! = nil, selectionImage: UIImage! = nil) -> UIButton {
//        var button = UIButton(
//                              frame: CGRect(
//                                            x: CGFloat(width) * CGFloat(index),
//                                            y: 0,
//                                            width: width,
//                                            height: height))
//        
//        
//        if text != nil {
//            button.setTitle(text, forState: .Normal)
//        }
//        
//        if image != nil {
//            button.setImage(image, forState: .Normal)
//        }
//        
//        if selectionImage != nil {
//            button.adjustsImageWhenDisabled = false
//            button.adjustsImageWhenHighlighted = false
//            button.setImage(selectionImage, forState: .Disabled)
//        }
//        
//        button.titleLabel?.font = self.textFont
//        button.setTitleColor(self.highlightedItemTextColor, forState: .Highlighted)
//        button.setTitleColor(self.selectedItemTextColor, forState: .Disabled)
//        button.setTitleColor(self.unselectedItemTextColor, forState: .Normal)
//        button.backgroundColor = UIColor.clearColor()
//        button.titleLabel?.adjustsFontSizeToFitWidth = true
//        button.titleLabel?.minimumScaleFactor = 0.75
//        button.titleLabel?.lineBreakMode = NSLineBreakMode.ByTruncatingMiddle
//        button.titleLabel?.contentMode = UIViewContentMode.Center
//        
//        button.layer.cornerRadius = self.useCornerRadius ? height / 2 : 0
//        
//        if index == self.currentPage {
//            button.enabled = false
//            
//            if !self.bottomLine {
//                self.selectionView.frame = button.frame
//            }
//            else {
//                var selectionLineRect = CGRect(
//                                               x: button.frame.origin.x,
//                                               y: self.bounds.height - self.bottomSelectionLineHeight,
//                                               width: button.frame.size.width,
//                                               height: self.bottomSelectionLineHeight)
//                
//                self.selectionView.frame = selectionLineRect
//            }
//        }
//        else {
//            button.enabled = true
//        }
//        
//        RACObserve(button, keyPath: "highlighted")
//        .subscribeNext { (data: AnyObject!) -> Void in
//            if button.highlighted {
//                button.backgroundColor = self.highlightedItemBackgroundColor
//            }
//            else {
//                button.backgroundColor = UIColor.clearColor()
//            }
//        }
//        //
//        button.rac_signalForControlEvents(.TouchUpInside).subscribeNext { (data: AnyObject!) -> Void in
//            self.changeCurrentPageTo(index)
//        }
//        
//        return button
//    }
//    
//    func changeCurrentPageTo(index: Int) {
//        
//        if index < 0
//            || index >= self.buttons.count
//            || index == self.currentPage {
//                return
//            }
//        
//        UIView.transitionWithView(self.buttons[self.currentPage], duration: 0.15, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
//            self.buttons[self.currentPage].enabled = true
//        }, completion: nil)
//        
//        
//        UIView.transitionWithView(self.buttons[index], duration: 0.15, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
//            self.buttons[index].enabled = false
//        }, completion: nil)
//        
//        
//        self.currentPage = index
//        
//        
//        if self.animateChange {
//            
//            var futureRect = self.selectionView?.frame
//            
//            if !self.bottomLine {
//                futureRect = self.buttons[self.currentPage].frame
//            }
//            else {
//                let selectionLineRect = CGRect(
//                                               x: self.buttons[self.currentPage].frame.origin.x,
//                                               y: self.bounds.height - self.bottomSelectionLineHeight,
//                                               width: self.buttons[self.currentPage].frame.size.width,
//                                               height: self.bottomSelectionLineHeight)
//                
//                futureRect = selectionLineRect
//            }
//            
//            if self.selectionView?.frame == futureRect {
//                return
//            }
//            
//            
//            UIView.animateWithDuration(
//                                       0.2,
//                                       delay: 0,
//                                       options: [UIViewAnimationOptions.BeginFromCurrentState, UIViewAnimationOptions.AllowUserInteraction, UIViewAnimationOptions.CurveLinear],
//                                       animations: {
//                                           
//                                           if let frame = futureRect {
//                                               self.selectionView?.frame = frame
//                                           }
//                                           return
//                                       }, completion: {
//                                           _ in
//                                           return
//                                       })
//        }
//    }
//    
//    func setImagesForStates(normal normal: [UIImage], selected: UIImage...) {
//        self.imageItems = normal
//        self.selectedImageItems = selected
//    }
//    func setTextFont(font: UIFont, andItems items: String...) {
//        self.textFont = font
//        self.textItems = items
//        
//    }
//    func setBackgroundColorForStates(selected selected: UIColor!, highlighted: UIColor!) {
//        self.selectedItemBackgroundColor = selected
//        self.highlightedItemBackgroundColor = highlighted
//        
//        self.selectionView?.backgroundColor = self.selectedItemBackgroundColor
//        
//    }
//    
//    func setTextColorForStates(selected selected: UIColor!, highlighted: UIColor!, unselected: UIColor!) {
//        self.selectedItemTextColor = selected
//        self.highlightedItemTextColor = highlighted
//        self.unselectedItemTextColor = unselected
//        
//        for button in self.buttons {
//            button.setTitleColor(self.highlightedItemTextColor, forState: .Highlighted)
//            button.setTitleColor(self.selectedItemTextColor, forState: .Disabled)
//            button.setTitleColor(self.unselectedItemTextColor, forState: .Normal)
//        }
//    }
//}