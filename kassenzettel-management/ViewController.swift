//
//  ViewController.swift
//  tesseractTest
//
//  Created by Timo on 29.03.18.
//  Copyright © 2018 Timo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view,
    }
    
    
    @IBAction func takePhoto(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancle", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //der folgende eingerueckte Block ist dafuer da, dass das ausgewaehlte Bild im UIImageView im anderen storyboard angezeigt wird
        let photoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "photoVC") as! photoViewController
        
        photoVC.takenPhoto = image
        
        DispatchQueue.main.async {
            self.present(photoVC, animated: true, completion: nil)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

