//
//  ViewController.swift
//  ArcaneCharacters
//
//  Created by Harun Selçuk Çetin on 31.12.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var characters: [Characters] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let ch1 = Characters(name: "jinx", description: "jinx my fav", image: UIImage(named: "jinx"));
        let ch2 = Characters(name: "ekko", description: "jinx's fav", image: UIImage(named: "ekko"));
        let ch3 = Characters(name: "ambessa", description: "enemy", image: UIImage(named: "ambessa"));
        let ch4 = Characters(name: "heim", description: "prof", image: UIImage(named: "heim"));
        
        self.characters.append(ch1);
        self.characters.append(ch2);
        self.characters.append(ch3);
        self.characters.append(ch4);
        
        
    }
    
    //tableView

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        var content = cell.defaultContentConfiguration();
        content.text = "\(indexPath.row+1). \(characters[indexPath.row].name!)"
        cell.contentConfiguration = content;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toCharactersViewController", sender: nil);
    }
    
    internal func tableView(_ tablewView:UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath:IndexPath){
        if editingStyle == .delete{
            self.characters.remove(at: indexPath.row);
            tablewView.deleteRows(at: [indexPath], with: .middle);
        }
    }

    //prepare next pages
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCharactersViewController" {
            let detailsVC = segue.destination as! CharacterViewController;
            detailsVC.selectedName = characters[tableView.indexPathForSelectedRow!.row].name
            detailsVC.selectedDesc = characters[tableView.indexPathForSelectedRow!.row].description;
            detailsVC.selectedImage = characters[tableView.indexPathForSelectedRow!.row].image;
        }
    }
    
}

