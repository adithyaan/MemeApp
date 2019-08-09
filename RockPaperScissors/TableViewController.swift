

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!
    var m:[Any]=[]
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var memes:[Meme.test]=[]
    var flag = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        memes = appDelegate.memes
        if(memes.count>0){
            print("view qill appear"+String(memes[0].topText))
            tableview.reloadData()

        }
    }
    
    
    func tableView(_ tableView: UITableView,  cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! TableCellTableViewCell
                    print("test"+memes[indexPath.row].topText)

        
        cell.textcell.text = memes[indexPath.row].topText
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        memes = appDelegate.memes
    }
    
    var cars = [String]()
    var newCar: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        cars = ["BMW","Audi", "Volkswagen"]
        
        memes = appDelegate.memes
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    
    

}
