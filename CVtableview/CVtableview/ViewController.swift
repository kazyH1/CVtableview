//
//  ViewController.swift
//  CVtableview
//
//  Created by HuyNguyen on 01/03/2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    struct Data {
        var nameLbName: String
        var textTxtIntro: String
        
    }
    @IBOutlet weak var tbvCV: UITableView!{
        didSet{
            tbvCV.delegate = self
            tbvCV.dataSource = self
            tbvCV.register(UINib(nibName: "CVTableViewCell", bundle: nil), forCellReuseIdentifier: "CVTableViewCell")
        }
    }
    var data = [Data(nameLbName: "Huy",textTxtIntro: "da di lam\n23tuoi"),Data(nameLbName: "Minh",textTxtIntro: "sinh vien DTU\n21 tuoi")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvCV.dequeueReusableCell(withIdentifier: "CVTableViewCell", for: indexPath) as! CVTableViewCell
        let dataCell = data[indexPath.row]
        cell.lbName.text=dataCell.nameLbName
        cell.txtIntro.text = dataCell.textTxtIntro
        return cell
    }

   


}

