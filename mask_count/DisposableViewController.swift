//
//  DisposableViewController.swift
//  mask_count
//
//  Created by maya on 2021/02/06.
//

import UIKit

class DisposableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let UserDefault = UserDefaults.standard
    var mask_count: Int = 0
    var add_mask: Int = 0
    
    var addArray: [Int] = ([Int])(1...100)
    var addcount: Int = 0
    
    @IBOutlet var useMaskLabel: UILabel?
    @IBOutlet var tableView: UITableView!
    
    var cellData = [cell_info]()

    override func viewDidLoad() {
        super.viewDidLoad()

        addArray.append(contentsOf: [150, 200, 250, 300, 350, 400, 450, 500, 600, 700, 800, 900, 1000])
        //let width = self.view.frame.size.width
        //let height = self.view.frame.size.height
        
        tableView = UITableView(frame: self.view.frame, style: UITableView.Style.grouped)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //let Dnib = UINib(nibName: "DMaskTableViewCell", bundle: nil)
        self.tableView.register(DMaskTableViewCell.self, forCellReuseIdentifier: "Cell")
        
        //tableView.frame = CGRect(x: 0, y: 260, width: Int(width), height: Int(height*2/3))
        //self.view.addSubview(tableView)
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Disposable Mask"
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Futura", size: 20) ?? "",
            .foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9529411765, green: 0.7098039216, blue: 0.7294117647, alpha: 1)
        self.tabBarController?.tabBar.barTintColor = #colorLiteral(red: 0.9529411765, green: 0.7098039216, blue: 0.7294117647, alpha: 1)
        self.navigationController?.navigationBar.tintColor = .white
        
        
        cellInit()
        
        useMaskLabel?.textColor = #colorLiteral(red: 0.9529411765, green: 0.7098039216, blue: 0.7294117647, alpha: 1)
        useMaskLabel?.text = "あと\(mask_count)枚"
        view.backgroundColor = #colorLiteral(red: 0, green: 0.5776427984, blue: 0.6491295099, alpha: 1)
    }
    
    func cellInit () {
        cellData.append(cell_info(name: "a", count: 10))
        cellData.append(cell_info(name: "b", count: 5))
        cellData.append(cell_info(name: "c", count: 7))
        
        for i in 0..<cellData.count {
            mask_count += cellData[i].maskCount
        }
    }


//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DMaskTableViewCell
        
        //cell.name.text = String(indexPath.row)
        cell.setCell(info: cellData[indexPath.row])

        cell.useButton.tag = indexPath.row
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    @IBAction func useMask(_ sender: UIButton) {
        print("aa")
        mask_count -= 1
        useMaskLabel?.text = "あと\(mask_count)枚"
        cellData[sender.tag].maskCount -= 1
        print(String(cellData[sender.tag].maskCount))
        
    }
    
    
    @IBAction func addMask() {
        let pv = UIPickerView()
        
        let title = "Add Masks"
        let message = "追加するマスクの枚数を入力してください\n\n\n\n\n\n\n\n\n"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action: UIAlertAction!) -> Void in
            print(String(self.addcount))
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in }
        
        //PickerView
        pv.selectRow(0, inComponent: 0, animated: true) //初期値
        pv.frame = CGRect.init(x: 0, y: 50, width: view.bounds.width * 0.65, height: 150)
        pv.dataSource = self
        pv.delegate = self
        alert.view.addSubview(pv)
        
        alert.addAction(OKAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    //PickerViewの列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //PickerViewの行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return addArray.count
    }
    //PickerViewの項目
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(addArray[row])
    }
    
    //PickerViewの項目選択時
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        addcount = addArray[row]
    }
    
}
