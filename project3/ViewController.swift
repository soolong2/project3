//
//  ViewController.swift
//  project3
//
//  Created by so on 2022/05/24.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    //화면클릭
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else {return}
        
        navigationController?.pushViewController(viewController, animated: true)
        print("😄😄😄😄😄😄😄😄\(indexPath.row)")
    }
    @IBOutlet weak var countrieView: UITableView!
   
    let cellIdentifier: String = "cell"
    
    var countries: [Countries] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let con: Countries = self.countries[indexPath.row]
        cell.textLabel?.text = con.korean_name + "(\(con.asset_name))"
        return cell
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        do {
            self.countries = try! jsonDecoder.decode([Countries].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        }
        // 왜안되는거지
        //self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }




