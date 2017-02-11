//
//  WebListTableViewController.swift
//  2ChBrowser
//
//  Created by Shigeo Sakamoto on 2017/02/11.
//  Copyright © 2017年 Shigeo Sakamoto. All rights reserved.
//

import UIKit

class WebListTableViewController: UITableViewController {

    let webList = [
        (name:"アップル", url:"https://www.apple.com/jp/"),
        (name:"国立天文台", url:"http://www.nao.ac.jp"),
        (name:"東京都美術館", url:"http://www.tobikan.jp"),
        (name:"amazon", url:"http://www.amazon.co.jp")
    ]


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return webList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let webData = webList[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = webData.name
        cell.detailTextLabel?.text = webData.url

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWebPage" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let webData = webList[(indexPath as NSIndexPath).row]

                (segue.destination as! WKWebViewController).data = webData
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
