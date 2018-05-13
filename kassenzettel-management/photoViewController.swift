//
//  photoViewController.swift
//  swiftocrtest
//
//  Created by Timo on 26.03.18.
//  Copyright © 2018 Timo. All rights reserved.
//

import UIKit
import TesseractOCR

class photoViewController: UIViewController, UITextViewDelegate, G8TesseractDelegate {

    //Wenn ein ? dahinter steht, dann bedeutet das wohl dass es optional ist
    var takenPhoto:UIImage?
    

    
    @IBOutlet weak var imageView: UIImageView!
    
    //die Verbindung zum TextView im storyboard
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.image = takenPhoto
        textView.text = ""
    }
    
    @IBAction func buttonRecognize(_ sender: Any) {
        
        let tesseract:G8Tesseract = G8Tesseract(language:"deu")
        //tesseract.language = "eng+ita"
        tesseract.delegate = self
        
    //Eines der beiden unteren muss aktiviert werden, das erste ruft ein lokal abgelegtes Bild auf, das zweite ruft ein Bild aus dem iPhone direkt auf
        //tesseract.image = UIImage(named: "b_1_q_0_p_0_2")?.g8_blackAndWhite()
        tesseract.image = takenPhoto
        
        tesseract.recognize()
        //print(tesseract.recognizedText)
        textView.text = tesseract.recognizedText
        
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
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
