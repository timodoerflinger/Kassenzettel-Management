//
//  ViewController.swift
//  OpenCImageStitching2
//
//  Created by Timo on 22.04.18.
//  Copyright © 2018 Timo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!

    
    //var imageArray = [UIImage?]()
    var imageArrayGlobal:[UIImage?] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //stitch()
        
    }

    
    @IBAction func grayButton(_ sender: UIButton) {
        imageView.image = OpenCVWrapper.makeGray(fromImage2: imageView.image)
    }
    
    
    @IBAction func bildauswaehlenButton(_ sender: UIButton) {
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
        
        imageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func bildhinzufuegenButton(_ sender: UIButton) {
        
        imageArrayGlobal.append(imageView.image)
        
        //imageArrayGlobal.append(UIImage(named:"pano_19_16_mid.jpg"))
        //imageArrayGlobal.append(UIImage(named:"pano_19_20_mid.jpg"))
        
        //print("bild zu array hinzugefügt")
        //print("informationen vom Bild: "+(imageView.image?.description)!)
        
    }
    
    @IBAction func stitchingButton(_ sender: UIButton) {
        
        /*for imag in imageArray {
            print("Bild:  \(imag).")
        }*/
        
        stitch(arrayParam: imageArrayGlobal)
        //stitch()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func stitch(arrayParam:[UIImage?]) {
     //func stitch() {
        //self.spinner.startAnimating()
        DispatchQueue.global().async {
            
            //let image1 = UIImage(named: "kassenzettel_china-town11.jpg")
            //let image2 = UIImage(named: "kassenzettel_china-town22.jpg")
            
            //let image1 = UIImage(named:"stitch-links.jpg")
            //let image2 = UIImage(named:"stitch-rechts.jpg")
            
            
            //let image1 = UIImage(named:"pano_19_16_mid.jpg")
            //let image2 = UIImage(named:"pano_19_20_mid.jpg")
            //let image3 = UIImage(named:"pano_19_22_mid.jpg")
            //let image4 = UIImage(named:"pano_19_25_mid.jpg")
            
            //let imageArray:[UIImage?] = [image1,image2]
            let imageArray:[UIImage?] = arrayParam
            
            let stitchedImage:UIImage = OpenCVWrapper.process(with: imageArray as! [UIImage]) as UIImage
            
            
            
            DispatchQueue.main.async {
                NSLog("stichedImage %@", stitchedImage)
                let imageView:UIImageView = UIImageView.init(image: stitchedImage)
                self.imageView = imageView
                self.scrollView.addSubview(self.imageView!)
                self.scrollView.backgroundColor = UIColor.black
                self.scrollView.contentSize = self.imageView!.bounds.size
                self.scrollView.maximumZoomScale = 4.0
                self.scrollView.minimumZoomScale = 0.5
                self.scrollView.delegate = self
                self.scrollView.contentOffset = CGPoint(x: -(self.scrollView.bounds.size.width - self.imageView!.bounds.size.width)/2.0, y: -(self.scrollView.bounds.size.height - self.imageView!.bounds.size.height)/2.0)
                NSLog("scrollview \(self.scrollView.contentSize)")
                //self.spinner.stopAnimating()
            }
        }
    }

}

