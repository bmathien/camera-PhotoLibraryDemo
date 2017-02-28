//
//  ViewController.swift
//  CameraAndPhotoLibraryDemo
//
//  Created by Mobile Makers on 7/11/15.
//  Copyright (c) 2015 YourSchool. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //sets the view controller as delegate for UIImageView(This won't work w/o UINavigationControllerDelegate)

        imagePicker.delegate = self
    }

//MARK: imagePicker Buttons

    @IBAction func cameraButtonTapped(_ sender: UIButton)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            getPhotoLibrary()
        }
    }

    @IBAction func photoLibraryTapped(_ sender: UIButton)
    {
        getPhotoLibrary()
    }
 
//MARK: ImagePickerControllerFunction
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        imagePicker.dismiss(animated: true, completion: {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage
        })
    }
    
//MARK: Helper function to consolidate duplicate PhotoLibrary Code
    func getPhotoLibrary()
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
    
    }

}

