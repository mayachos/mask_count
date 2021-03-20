//
//  DMaskTableViewCell.swift
//  mask_count
//
//  Created by maya on 2021/03/15.
//

import UIKit

class DMaskTableViewCell: UITableViewCell {
    
    let DisVC = DisposableViewController()
    @IBOutlet var name: UILabel!
    @IBOutlet var count: UILabel!
    @IBOutlet var useButton: UIButton!


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(info: cell_info) {
        name.text = info.maskName
        count.text = String(info.maskCount)
        
        let width = DisVC.view.frame.size.width
        //let height = self.view.frame.size.height
        
        //UIButton
        //useButton.tag = indexPath.row
        useButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        useButton.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.4196078431, blue: 0.4117647059, alpha: 1)
        useButton.layer.cornerRadius = 15
        useButton.setTitle("USE", for: .normal)
        useButton.frame = CGRect(x: width - 80, y: 5, width: 50, height: 50)
    }
    

    
}
