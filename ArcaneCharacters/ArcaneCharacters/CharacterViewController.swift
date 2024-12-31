//
//  CharacterViewController.swift
//  ArcaneCharacters
//
//  Created by Harun Selçuk Çetin on 31.12.2024.
//

import UIKit

class CharacterViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedName = "";
    var selectedDesc = "";
    var selectedImage = UIImage();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedName;
        descLabel.text = selectedDesc;
        imageView.image = selectedImage;
    }
    
}
