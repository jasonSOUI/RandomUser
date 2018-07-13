//
//  ViewController.swift
//  UserProfileAPI
//
//  Created by 黃俊傑 on 2018/7/13.
//  Copyright © 2018年 Soui. All rights reserved.
//

import UIKit

struct User {
    
    var name: String?
    
    var email: String?
    
    var phon: String?
    
    var image: String?
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    var infoTableViewController: TableViewController?
    
    let defaultUser = User(name: "Jason", email: "jason@gmail.com", phon: "123-456-987", image: "https://www.soui.com.tw/index.html")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色
        self.navigationController?.navigationBar.barTintColor = UIColor(hue: 0.67, saturation: 0.2, brightness: 0.157, alpha: 1)
        
        // navigationBar顏色
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.white
        ]
        
        
        settingUserInfo(user: defaultUser)
    }
    
    // 設定人員資料
    func settingUserInfo(user: User) {
        
        userName.text = user.name
        infoTableViewController?.phone.text = user.phon
        infoTableViewController?.email.text = user.email
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "moreInfo") {
            infoTableViewController = segue.destination as? TableViewController
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 圖片圓形
        userImage.layer.cornerRadius = userImage.frame.width / 2
        userImage.clipsToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

