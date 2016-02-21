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
    
    var englist:[NSDictionary] = []
    var select = -1
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    //行数
    func tableView(tabeleView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return englist.count
    }
    
    //表示するセルの中身
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell{
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
        
        
        //cell.textLabel!.text = "d1"
        
        
        //        cell.textLabel!.text = "\(indexPath.row)行目"
        cell.textLabel!.text = "\(englist[indexPath.row]["En"])"
        //        //文字を茶色にする
        //        cell.textLabel!.textColor = UIColor.brownColor()
        //        //チェックマークをつける
        //        cell.accessoryType = .DisclosureIndicator
        cell.textLabel!.font = UIFont.systemFontOfSize(15)
        
        return cell
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        //json.txtファイルを読み込んで
        var path = NSBundle.mainBundle().pathForResource("json", ofType: "txt")
        var jsondata = NSData(contentsOfFile: path!)
        
        
        let jsonDictionaray = (try! NSJSONSerialization.JSONObjectWithData(jsondata!, options: [])) as! NSArray
        
        
        for data in jsonDictionaray {
            var d1 = data["En"] as! String
            var d2 = data["Ja"] as! String
            
            print(d1)
            self.englist.append(data as! NSDictionary)
            
        }
        
    }
    
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
