//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Adithya.A.N on 29/05/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate {

    @IBOutlet weak var toolbartop: UIToolbar!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var toolbarBottom: UIToolbar!
    @IBOutlet weak var bottomText: UITextField!
    @IBOutlet weak var topText: UITextField! 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        configureTextFields(textField: bottomText!)
        configureTextFields(textField: topText!)
        self.navigationItem.hidesBackButton = false
        
    }
    
    
    func configureTextFields(textField: UITextField){
        textField.textAlignment = .center
        textField.delegate = self
        textField.defaultTextAttributes = [
            .font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            .foregroundColor: UIColor.white,
            .strokeColor: UIColor.black,
            .strokeWidth: -8.0
        ]
    }

    @IBAction func shareMeme(_ sender: Any) {
        save()
        toolbartop.isHidden = true
        toolbarBottom.isHidden = true
    }
    @IBAction func beginEditing(_ sender: UITextField) {
        sender.text=""
    }
    
    
    func beginEditing(_textField : UITextField){
    
        if !(_textField.text?.elementsEqual("TOP"))!  || !(_textField.text?.elementsEqual("BOTTOM"))!  {
        _textField.text=""
        }
    
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func done(_ sender: UITextField) {
        sender.resignFirstResponder()
        keyboardWillHide()
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            pickAnImage(type: .camera)
        }
        else{
            print("no camera")
        }
    }
    @IBAction func pickAnImageFromAlbum(_ sender: Any) {
        pickAnImage(type: .photoLibrary)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        subscribeToKeyboardNotifications()
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("no camera")
            cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
            
        }
    }
    
    func pickAnImage(type :UIImagePickerController.SourceType){
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = type
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeFromKeyboardNotifications()

    }
    
    
    func subscribeToKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    @objc func keyboardWillShow(_ notification:Notification) {
        
        view.frame.origin.y -= getKeyboardHeight(notification)
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    func unsubscribeFromKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    func keyboardWillHide(){
        subscribeToKeyboardNotifications()
        view.frame.origin.y=0
    }
    
   
    
    func save() {
        var img:Meme.test
        toolbartop.isHidden = true
        toolbarBottom.isHidden = true
        let meme:UIImage = generateMemedImage()
        let share=[meme]
        let activityViewController = UIActivityViewController(activityItems: share, applicationActivities: nil)
        imageView.image = meme
        present(activityViewController,animated: true,completion: nil)
        
        img = Meme.test(topText: topText.text!, bottomText: bottomText.text!,image:meme)
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(img)
        print("memes"+String(appDelegate.memes.count))
//        _ = navigationController?.popToRootViewController(animated: true)
//
//       self.dismiss(animated: true, completion: nil)
//
        activityViewController.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
            if !completed {
                print("cancelled")
                
                return
            }
            else{
                print("over")
               
            }
            // User completed activity
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func generateMemedImage() -> UIImage {
        
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        imageView.image = memedImage
        return memedImage
    }
    
  
}
