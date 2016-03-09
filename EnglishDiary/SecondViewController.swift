//
//  SecondViewController.swift
//  EnglishDiary
//
//  Created by 三浦宏予 on 2016/02/20.
//  Copyright © 2016年 Hiroyo Miura. All rights reserved.
//
import UIKit

class SecondViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var secSelect = -1
    var englist:[NSDictionary] = []
  
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    @IBOutlet weak var dateText001: UITextField!
    @IBOutlet weak var titleText001: UITextField!
    @IBOutlet weak var secImageView: UIImageView!
    @IBOutlet weak var secTextView: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.edit = ""
        
        

       
    }
    
    override func viewWillAppear(animated: Bool) {
        
        //戻るコード
        //self.dismissViewControllerAnimated(true, completion: nil)

         var langEn = appDelegate.langEn
        secTextView.text = appDelegate.texttmp + langEn
        

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //★の内容をtextfildに表示させる
    
    @IBAction func tapStar(sender: UIButton) {
        appDelegate.texttmp = secTextView.text
        
    }
    
    
    @IBAction func tapPhoto(sender: UIButton) {
        
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
                
                // ImageViewにその画像を設定
                secImageView.image = photo
            }
        }
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    

}

