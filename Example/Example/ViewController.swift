//
//  ViewController.swift
//  Example
//
//  Created by Jonathan on 07/06/2017.
//  Copyright © 2017 Jonathan Tribouharet. All rights reserved.
//

import UIKit
import JT3DScrollView

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: JT3DScrollView?
    @IBOutlet weak var nextButton: UIButton?
    @IBOutlet weak var previousButton: UIButton?
    
    @IBOutlet weak var leftNextButtonConstraint: NSLayoutConstraint?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView?.effect = .cards
        
        scrollView?.delegate = self // Use only for animate nextButton and previousButton
        
        createCardWithColor()
        createCardWithColor()
        createCardWithColor()
        createCardWithColor()
        
        nextButton?.backgroundColor = UIColor(colorLiteralRed: 33/255, green: 158/255, blue: 238/255, alpha: 1)
        nextButton?.layer.cornerRadius = 5
        previousButton?.layer.cornerRadius = 5
    }
    
    func createCardWithColor () {
        guard let scrollView = scrollView else {
            return
        }
        
        let width = scrollView.frame.width
        let height = scrollView.frame.height
        
        let x = CGFloat(scrollView.subviews.count) * width
        
        let view = UIView(frame: CGRect(x: x, y: 0, width: width, height: height))
        view.backgroundColor = UIColor(colorLiteralRed: 33/255, green: 158/255, blue: 238/255, alpha: 1)
        view.layer.cornerRadius = 8
        scrollView.addSubview(view)
        scrollView.contentSize = CGSize(width: x + width, height: height)
    }
    
    //MARK - SegmentControl
    
    @IBAction func didChangeMode(_ sender: UISegmentedControl) {
    
        let effect: JT3DScrollViewEffect
        
        switch (sender.selectedSegmentIndex) {
        case 0:
            effect = .cards
        case 1:
            effect = .carousel
        case 2:
            effect = .depth
        case 3:
            effect = .translation
        default:
            effect = .none
        }
        
        scrollView?.effect = effect
    }
    
    
    // MARK - Next / Previous buttons
    
    @IBAction func loadNextPage(_ sender: UIButton) {
        scrollView?.loadNextPage(animated: true)
    }
    
    @IBAction func loadPreviousPage(_ sender: UIButton) {
        scrollView?.loadPreviousPage(animated: true)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        updateButtons()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        updateButtons()
    }
    
    func updateButtons () {
        guard let scrollView = scrollView else {
            return
        }
        
        if(scrollView.currentPage >= scrollView.subviews.count - 1){
            showPreviousButton()
        }
        else{
            showNextButton()
        }
    }
    
    func showPreviousButton () {
        UIView.animate(withDuration: 0.3, animations: { 
            self.leftNextButtonConstraint?.constant = -self.view.frame.width
            self.view.layoutIfNeeded()
        })
    }
    
    func showNextButton () {
        UIView.animate(withDuration: 0.3, animations: {
            self.leftNextButtonConstraint?.constant = 40
            self.view.layoutIfNeeded()
        })
    }

}
