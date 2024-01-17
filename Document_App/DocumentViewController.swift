//
//  DocumentViewController.swift
//  Document_App
//
//  Created by Anis KHIARI on 1/17/24.
//

import UIKit

class Do: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let unwrappedimageName = imageName {
            if let unwrappedImageView = imageView {
                unwrappedImageView.image = UIImage(named: unwrappedimageName)
            }
            else {
                print("erreur")
            }
            
        }

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
