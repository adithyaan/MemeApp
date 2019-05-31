//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Adithya.A.N on 29/05/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate {

    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var imageView:UIImageView!
    
    @IBOutlet weak var bottomText: UITextField!
    @IBOutlet weak var topText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pickImage(_ sender: UIButton) {
        let controller = UIImagePickerController()
        controller.delegate = self
        
        present(controller,animated: true,completion: nil)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            photoImageView.image = img

            imageView.image = image
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let te=textField.text!
        
        print(String(te))

        if !(textField.text?.elementsEqual("BOTTOM") ?? true){
            topText.text = ""
        }
        if !(textField.text?.elementsEqual("BOTTOM") ?? true){
            bottomText.text = ""
        }

    
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        }
        else{
            print("no camera")
        }
    }
    @IBAction func pickAnImageFromAlbum(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("no camera")
            cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
            
        }
    }
}
