//
//  ViewController.swift
//  SwiftPullToRefreshDemo
//
//  Created by Leo Zhou on 2017/4/30.
//  Copyright © 2017年 Leo Zhou. All rights reserved.
//

import UIKit

let refreshViews = ["IndicatorHeader", "TextHeader", "SmallGIFHeader", "GIFTextHeader", "BigGIFHeader", "SuperCatHeader", "IndicatorFooter", "TextFooter", "IndicatorAutoFooter", "TextAutoFooter"]

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refreshViews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = refreshViews[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let test = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
        test.style = TestViewController.Style(rawValue: indexPath.row) ?? .indicatorHeader
        navigationController?.pushViewController(test, animated: true)
    }
}
