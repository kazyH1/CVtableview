//
//  ViewController.swift
//  CVtableview
//
//  Created by HuyNguyen on 01/03/2023.
//

import UIKit

struct Data {
    var nameTitle: String
    var nameLbName: String
    var img : String
    var Detail: String
    var SDT: String
    
    
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, TableViewCellDelegate {
    
    func makeCall(with phoneNumber: String) {
        guard let url = URL(string: "tel://\(phoneNumber)") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @IBOutlet weak var tbvCV: UITableView! {
        didSet {
            tbvCV.delegate = self
            tbvCV.dataSource = self
            tbvCV.register(UINib(nibName: "CVTableViewCell", bundle: nil), forCellReuseIdentifier: "cell1")
            tbvCV.register(UINib(nibName: "imageTableViewCell", bundle: nil), forCellReuseIdentifier: "cell2")
            tbvCV.register(UINib(nibName: "buttonTableViewCell", bundle: nil), forCellReuseIdentifier: "cell3")
        }
    }
    
    var data = [Data(nameTitle: "Nguyen Duc Huy",nameLbName: "Student at DTU",img: "Image1", Detail: "Date of birth: 2002/10/16\nAddress: Quang Nam\nZodiac: Libra",SDT: "0944521168"),Data(nameTitle: "Nguyen Duc Minh",nameLbName: "Working at DNTN NguyenMinhHuy",img: "Image2", Detail: "Date of birth: 2000/12/25\nAddress: Quang Nam\nZodiac: Capricorn",SDT: "0948981678")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            
            //AlertController(ValueTitle: data[indexPath.section].nameTitle, ValueMessage: data[indexPath.section].Detail, NameTitleAction: "OK")
            let alert = UIAlertController(title: data[indexPath.section].nameTitle, message: data[indexPath.section].Detail, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                    case .default:
                    print("default")

                    case .cancel:
                    print("cancel")

                    case .destructive:
                    print("destructive")

                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = registerCell(valueInput: "cell1", indexPath: indexPath) as! CVTableViewCell
            //let cell = tbvCV.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CVTableViewCell
            cell.lbTitle.text=data[indexPath.section].nameTitle
            cell.lbName.text=data[indexPath.section].nameLbName
            return cell
        } else if indexPath.row == 1 {
            let cell = registerCell(valueInput: "cell2", indexPath: indexPath) as! imageTableViewCell
            cell.imgUser.image=UIImage(named: data[indexPath.section].img)
            cell.lbDetail.text = data[indexPath.section].Detail
            return cell
            
        } else {
            let cell = registerCell(valueInput: "cell3", indexPath: indexPath) as! buttonTableViewCell
            cell.imgBackground.image=UIImage(named: "Image3")
            let phoneNumber = data[indexPath.section].SDT
            cell.phoneNumber = phoneNumber
            cell.delegate = self
            return cell
        }	
    }
        
    func registerCell(valueInput: String, indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvCV.dequeueReusableCell(withIdentifier: valueInput, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        } else if indexPath.row == 1 {
            return 250
        } else {
            return 170
        }
    }
}

