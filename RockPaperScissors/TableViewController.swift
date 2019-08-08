

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var m:[Any]=[]
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var memes:[Meme.test]=[]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    memes = appDelegate.memes

        return memes.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as UITableViewCell
        
        var m=Meme(test: "test").getMovies()
        m.append(Meme.test(topText: "test", bottomText: "test"))
        

        cell.textLabel?.text = (memes[indexPath.row] .topText)
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
    
    @IBOutlet var myTableView: UITableView!
    var cars = [String]()
    var newCar: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        cars = ["BMW","Audi", "Volkswagen"]
//        var memes: [ViewController.Meme]! {
//            let object = UIApplication.shared.delegate
//            let appDelegate = object as! AppDelegate
//            return appDelegate.memes
//        }
         m = Meme(test:"test").getMovies()
        var img=Meme.test(topText: "test", bottomText: "test");
        var atest = Meme(test:"test").getMovies()
        atest.append(img)
        // Do any additional setup after loading the view.
        
//        navigationController?.setToolbarHidden(hidden:false, animated: false)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    
    

}
