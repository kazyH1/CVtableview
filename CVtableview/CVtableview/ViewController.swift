//
//  ViewController.swift
//  CVtableview
//
//  Created by HuyNguyen on 01/03/2023.
//

import UIKit
import Alamofire

//struct Cat {
//    var fact: String
//    var length: Int
//    var testArray: []
//}

struct Data {
    var nameTitle: String
    var nameLbName: String
    var img : String
    var Detail: String
    var SDT: String
}
struct DataCLV {
    var color: UIColor
    var icon, nameItem, inputMessage: String
}


class ViewController: UIViewController {
    
    @IBOutlet weak var tbvCV: UITableView!
    @IBOutlet weak var clvMyWorkflows: UICollectionView!
    @IBAction func btnSwitchView(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            tbvCV.isHidden = true
            clvMyWorkflows.isHidden = false
        case 1:
            tbvCV.isHidden = false
            clvMyWorkflows.isHidden = true
        default:
            break
        }
    }
    var dataCLV = [DataCLV(color:.systemOrange, icon: "PlayIcon",nameItem: "Play Music", inputMessage: "Bạn có muốn phát nhạc không?"), DataCLV(color:.systemOrange, icon: "PauseIcon",nameItem: "Pause Music", inputMessage: "Bạn có muốn dừng nhạc không?"), DataCLV(color:.systemBlue, icon: "SkipBackIcon",nameItem: "Skip Back",inputMessage: "Bạn có muốn tua lại bài đã phát không?"), DataCLV(color:.systemBlue, icon: "SkipFowardIcon",nameItem: "Skip Forward",inputMessage: "Bạn có muốn tua đến bài tiếp theo không?"), DataCLV(color:.systemPink, icon: "ClearIcon",nameItem: "Clear All ClipBoard",inputMessage: "Bạn có muốn xoá hết tất cả ClipBoard không?"), DataCLV(color:.systemPink, icon: "GetClipIcon",nameItem: "Get ClipBoard",inputMessage: "Bạn có muốn mở ClipBoard không?"), DataCLV(color:.systemPink, icon: "TranslateIcon",nameItem: "Translate ClipBoard",inputMessage: "Bạn có muốn chuyển đổi ClipBoard không?"), DataCLV(color:.systemPink, icon: "ChangeIcon",nameItem: "Change ClipBoard", inputMessage: "Bạn có muốn cắt ClipBoard không?"), DataCLV(color:.systemOrange, icon: "BatteryIcon",nameItem: "Iphone Battery Level",inputMessage: "Bạn có muốn xem % pin không?"), DataCLV(color:.systemGray, icon: "PlaylistIcon",nameItem: "Play Playlist Part 1.",inputMessage: "Bạn có muốn phát nhạc ở PlayList Music 1. không?")]
    var data = [Data(nameTitle: "Nguyen Duc Huy",nameLbName: "Student at DTU",img: "Image1", Detail: "Date of birth: 2002/10/16\nAddress: Quang Nam\nZodiac: Libra",SDT: "0944521168"),Data(nameTitle: "Nguyen Duc Minh",nameLbName: "Working at DNTN NguyenMinhHuy",img: "Image2", Detail: "Date of birth: 2000/12/25\nAddress: Quang Nam\nZodiac: Capricorn",SDT: "0948981678")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTablview()
        registerCollectionView()
        tbvCV.isHidden = true
    }
    
    private func registerTablview() {
        tbvCV.delegate = self
        tbvCV.dataSource = self
        tbvCV.register(UINib(nibName: "CVTableViewCell", bundle: nil), forCellReuseIdentifier: "cell1")
        tbvCV.register(UINib(nibName: "imageTableViewCell", bundle: nil), forCellReuseIdentifier: "cell2")
        tbvCV.register(UINib(nibName: "buttonTableViewCell", bundle: nil), forCellReuseIdentifier: "cell3")
    }
    
    private func registerCollectionView() {
        clvMyWorkflows.delegate = self
        clvMyWorkflows.dataSource = self
        clvMyWorkflows.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        //clvMyWorkflows.collectionViewLayout = UICollectionViewLayout()
    }
    
    private func registerCell(valueInput: String, indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvCV.dequeueReusableCell(withIdentifier: valueInput, for: indexPath)
        return cell
    }
    
    private func alertController(inputTitleController: String, titleButtonOK: String, titleButtonCancel: String, inputMessage: String, completion: @escaping (_ result: Bool) -> Void) {
        let alert = UIAlertController(title: inputTitleController, message: inputMessage, preferredStyle: .alert)
        if titleButtonOK != "" {
            alert.addAction(UIAlertAction(title: titleButtonOK,style: .default, handler: { _ in
                completion(true)
            }))
        }
        if titleButtonCancel != "" {
            alert.addAction(UIAlertAction(title: titleButtonCancel,style: .cancel, handler: { _ in
                completion(false)
            }))
        }
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: TableViewCellDelegate {
    
    func makeCall(with phoneNumber: String) {
        guard let url = URL(string: "tel://\(phoneNumber)") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            alertController(inputTitleController: "Call", titleButtonOK: "OK", titleButtonCancel: "Cancel", inputMessage: "Bạn có muốn thực hiện cuộc gọi?") { result in
                if result {
                    print("default")
                } else {
                    print("cancel")
                }
            }
            
        } else {
            alertController(inputTitleController: "Không thể thực hiện cuộc gọi", titleButtonOK: "OK", titleButtonCancel: "", inputMessage: "Thiết bị hiện tại không hỗ trợ chức năng gọi. Vui lòng kiểm tra lại.") { result in
                print("default")
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            alertController(inputTitleController: data[indexPath.section].nameTitle, titleButtonOK: "Ok", titleButtonCancel: "", inputMessage: data[indexPath.section].Detail) { result in
                print("default")
            }
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
            let cell = tbvCV.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CVTableViewCell
            let data = data[indexPath.section]
            cell.configCell(data: data)
            return cell
        } else if indexPath.row == 1 {
            let cell = registerCell(valueInput: "cell2", indexPath: indexPath) as! imageTableViewCell
            let data = data[indexPath.section]
            cell.configCell(data: data)
            return cell
        } else {
            let cell = registerCell(valueInput: "cell3", indexPath: indexPath) as! buttonTableViewCell
            cell.delegate = self
            let data = data[indexPath.section]
            cell.configCell(data: data)
            return cell
        }
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

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthView = self.view.frame.width
        let width = (widthView - 33)/2
        return CGSize(width: width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clvMyWorkflows.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for:  indexPath) as! CollectionViewCell
        cell.layer.cornerRadius = 10.0
        let dataCLV = dataCLV[indexPath.item]
        cell.delegate = self
        cell.configCell(dataclv: dataCLV, row: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCLV.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        alertController(inputTitleController: dataCLV[indexPath.item].nameItem, titleButtonOK: "OK", titleButtonCancel: "Cancel", inputMessage: dataCLV[indexPath.item].inputMessage) {
            result in
            if result {
                print("default")
            } else {
                print("cancel")
            }
        }
    }
}
extension ViewController: CollectionViewCellDelegate {
    func actionIcon(with rowSelect: Int) {
        alertController(inputTitleController: dataCLV[rowSelect].nameItem, titleButtonOK: "OK", titleButtonCancel: "Cancel", inputMessage: dataCLV[rowSelect].inputMessage) {
            result in
            if result {
                print("default")
            } else {
                print("cancel")
            }
        }
    }
}

