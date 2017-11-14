//
//  LiveViewController.swift
//  DYZB
//
//  Created by 郭明健 on 2017/9/13.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

class LiveViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        //self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgView : UIImageView = UIImageView()
        bgView.image = UIImage.init(named: "bg.jpg")
        bgView.frame = CGRect.init(x: 0, y: 0, width: kScreenW, height: kScreenH)
        
        self.view.addSubview(bgView)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
