//
//  photoViewController.swift
//  swiftocrtest
//
//  Created by Timo on 26.03.18.
//  Copyright © 2018 Timo. All rights reserved.
//

import UIKit

class photoViewController: UIViewController, UITextViewDelegate {

    //Wenn ein ? dahinter steht, dann bedeutet das wohl dass es optional ist
    var takenPhoto:UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let availableImage = takenPhoto{
            imageView.image = availableImage
        }
        
        //funktioniert
        textView.text = "Test 1357"
        
        
    }
    
    
    @IBAction func buttonBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //die Verbindung zum TextView im storyboard
    @IBOutlet weak var textView: UITextView!
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
