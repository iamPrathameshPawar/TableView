//
//  ViewController.swift
//  demo tblview swift
//
//  
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet var tblview: UITableView!
    var array1 = ["AAAA","BBBB","CCCC","DDDD","EEEE","FFFF","GGGG","HHHH"]
    var array2 = ["aaaa","bbbb","cccc","dddd","eeee","ffff","gggg","hhhh"]
    var arrimg = [#imageLiteral(resourceName: "c5"), #imageLiteral(resourceName: "c6"), #imageLiteral(resourceName: "c4"), #imageLiteral(resourceName: "c2"), #imageLiteral(resourceName: "c1"), #imageLiteral(resourceName: "c1"), #imageLiteral(resourceName: "c1"), #imageLiteral(resourceName: "c1")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.lbl1.text = array1[indexPath.row]
        cell.lbl2.text = array2[indexPath.row]
        cell.img.image = arrimg[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // self.view.backgroundColor = UIColor.blue
        let detail:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
       detail.strlbl1 = array1[indexPath.row]
       detail.strlbl2 = array2[indexPath.row]
        detail.strimg = arrimg[indexPath.row]
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            print("Before deletion: array1 count = \(array1.count)")
            
            // Remove the data from your data source
            array1.remove(at: indexPath.row)
            array2.remove(at: indexPath.row)
            arrimg.remove(at: indexPath.row)
            
            // Delete the row from the table view
            tableView.deleteRows(at: [indexPath], with: .left)
            
            print("After deletion: array1 count = \(array1.count)")
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform
        UIView.animate(withDuration: 1.0) {
            cell.alpha = 1
            cell.layer.transform = CATransform3DIdentity
        }
    }
}

