//
//  ThirdViewController.swift
//  EnglishDiary
//
//  Created by 三浦宏予 on 2016/02/20.
//  Copyright © 2016年 Hiroyo Miura. All rights reserved.
//


import UIKit
import Social

class ThirdViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    //これから画面遷移＆データを送れるようにする
    
    
    
    @IBOutlet weak var thImageView: UIImageView!
    @IBOutlet weak var thTextView: UITextView!
    
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.edit = "edit"
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        //戻るコード
        //self.dismissViewControllerAnimated(true, completion: nil)
        
        var langEn = appDelegate.langEn
        thTextView.text = thTextView.text + langEn
        
        
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
//    override func viewWillAppear(animated: Bool) {
//        self.dismissViewControllerAnimated(true, completion: nil)
//        
//        var langEn = appDelegate.langEn
//        thTextView.text = thTextView.text + langEn
//        
//        
//        
//    }

    
    @IBAction func tapFBBtn(sender: UIButton) {
        var facebookVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        facebookVC.setInitialText(thTextView.text)
        //facebookVC.addImage(UIImage(named: "cat.png"))
        
        presentViewController(facebookVC, animated: true, completion: nil)
        
        
    }
    
    @IBAction func tapImage(sender: UIButton) {
        
        // フォトライブラリが使用可能か？
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            
            // フォトライブラリの選択画面を表示
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(picker, animated: true, completion: nil)
        }
    }
    
    // 写真選択時に呼ばれる
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // 選択した画像を取得
        if info[UIImagePickerControllerOriginalImage] != nil {
            if let photo:UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
                
                // ImageViewに画像を設定
                thImageView.image = photo
            }
        }
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
     
}
