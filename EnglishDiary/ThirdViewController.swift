//
//  ThirdViewController.swift
//  EnglishDiary
//
//  Created by 三浦宏予 on 2016/02/20.
//  Copyright © 2016年 Hiroyo Miura. All rights reserved.
//


import UIKit
import Social

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var thImageView: UIImageView!
    @IBOutlet weak var thTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapFBBtn(sender: UIButton) {
        var facebookVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        facebookVC.setInitialText(thTextView.text)
        //facebookVC.addImage(UIImage(named: "cat.png"))
        
        presentViewController(facebookVC, animated: true, completion: nil)
        
        
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
