//
//  DetailViewController.swift
//  demo tblview swift
//
//  
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var dimg: UIImageView!
    
    @IBOutlet var dlbl1: UILabel!
    
    @IBOutlet var dlbl2: UILabel!
    
    var strlbl1:String!
    var strlbl2:String!
    var strimg:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dlbl1.text = strlbl1
        dlbl2.text = strlbl2
        dimg.image = strimg
        
    }

}
