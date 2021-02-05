//
//  DisposableViewController.swift
//  mask_count
//
//  Created by maya on 2021/02/06.
//

import UIKit

class DisposableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Disposable Mask"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Futura", size: 20) ?? ""]
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4565994143, green: 0.7993331552, blue: 0.6956489682, alpha: 1)
        self.tabBarController?.tabBar.barTintColor = #colorLiteral(red: 0.4565994143, green: 0.7993331552, blue: 0.6956489682, alpha: 1)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
