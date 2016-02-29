//
//  FourthViewController.swift
//  EnglishDiary
//
//  Created by 三浦宏予 on 2016/02/20.
//  Copyright © 2016年 Hiroyo Miura. All rights reserved.
//
import UIKit


class FourthViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    
    @IBOutlet weak var foTableView: UITableView!
    
//    var englist:[NSDictionary] = []
    var main = ["Life","Study","Trip"]
    var select = -1
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //背景画像
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "15.jpg")?.drawInRect(self.view.bounds)
        let image: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
        

    }
    
    
    
    //行数
    func tableView(tabeleView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return main.count
    }
    
    //表示するセルの中身
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell{
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
        
        
        //cell.textLabel!.text = "d1"
        
        
        //        cell.textLabel!.text = "\(indexPath.row)行目"
        cell.textLabel!.text = "\(main[indexPath.row])"
        //文字色
        cell.textLabel!.textColor = UIColor.whiteColor()
        //        //チェックマークをつける
        //        cell.accessoryType = .DisclosureIndicator
        
        // 背景色
        cell.backgroundColor = UIColor.clearColor()
        // 選択された時の背景色
        // 選択された時の背景色
        var cellSelectedBgView = UIView()
        cellSelectedBgView.backgroundColor =  UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 0.2)
        cell.selectedBackgroundView = cellSelectedBgView
        
        
        return cell
    }
    
    
    
//    override func viewWillAppear(animated: Bool) {
//        //json.txtファイルを読み込んで
//        var path = NSBundle.mainBundle().pathForResource("json", ofType: "txt")
//        var jsondata = NSData(contentsOfFile: path!)
//        
//        
//        let jsonDictionaray = (try! NSJSONSerialization.JSONObjectWithData(jsondata!, options: [])) as! NSArray
//        
//        
//        for data in jsonDictionaray {
//            var d1 = data["En"] as! String
//            var d2 = data["Ja"] as! String
//            
//            print(d1)
//            self.main.append(data as! NSArray)
//            
//        }
//        
//    }
    
    // 選択された時に行う処理
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath.row)行目を選択")
        select = indexPath.row
        performSegueWithIdentifier("showFifthView",sender: nil)
    }

    // Segueで画面遷移する時データを送る
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var FifthVC = segue.destinationViewController as! FifthViewController
        
            FifthVC.fifSelect = select
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
 
    
}
