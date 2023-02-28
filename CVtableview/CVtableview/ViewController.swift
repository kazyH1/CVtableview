//
//  ViewController.swift
//  CVtableview
//
//  Created by HuyNguyen on 01/03/2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    struct Data {
        var nameTitle: String
        var nameLbName: String
        var img : String
        var Detail: String
        var SDT: String
        
        
    }
    var data = [Data(nameTitle: "Nguyen Duc Huy",nameLbName: "Student at DTU",img: "image1", Detail: "Date of birth: 2002/10/16\nAddress: Quang Nam\nZodiac: Libra",SDT: "0944521168"),Data(nameTitle: "Nguyen Duc Minh",nameLbName: "",img: "image2", Detail: "Date of birth: 2000/12/25\nAddress: Quang Nam\nZodiac: Capricorn",SDT: "0948981678")]
    @IBOutlet weak var tbvCV: UITableView!{
        didSet{
            tbvCV.delegate = self
            tbvCV.dataSource = self
            tbvCV.register(UINib(nibName: "CVTableViewCell", bundle: nil), forCellReuseIdentifier: "cell1")
            tbvCV.register(UINib(nibName: "imageTableViewCell", bundle: nil), forCellReuseIdentifier: "cell2")
            tbvCV.register(UINib(nibName: "buttonTableViewCell", bundle: nil), forCellReuseIdentifier: "cell3")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
       
        if indexPath.row == 0
        {
            let cell = tbvCV.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CVTableViewCell
            cell.lbTitle.text=data[indexPath.section].nameTitle
            cell.lbName.text=data[indexPath.section].nameLbName
            return cell
        }else if indexPath.row == 1
        {
        let cell = tbvCV.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! imageTableViewCell
        cell.imgUser.image=UIImage(named: data[indexPath.section].img)
            cell.txtDetail.text = data[indexPath.section].Detail
            return cell
            
        }
        else  {
            let cell = tbvCV.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! buttonTableViewCell
            cell.imgBackground.image=UIImage(named: data[indexPath.section].img)
            /*cell.btnCall =  URL(string: "tel://" + data[indexPath.section].SDT) else { return }
            UIApplication.shared.open(data[indexPath.section].SDT)*/
            return cell
            }
    }
}

