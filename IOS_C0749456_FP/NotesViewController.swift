//
//  NotesViewController.swift
//  IOS_C0749456_FP
//
//  Created by Megha Mahna on 2020-01-27.
//  Copyright © 2020 Megha. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var temp = 0
    var camera = 0
    var newNote: Notes?
    var editNotes: Notes?
    
    var mainCategory : Categories?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        
              
    }
    
    @IBAction func camera(_ sender: UIBarButtonItem) {
        
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        
               vc.allowsEditing = true
               vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func gallery(_ sender: UIBarButtonItem) {
        
        camera = 1
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        dismiss(animated: true, completion:nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if camera == 0{
            picker.dismiss(animated: true)
                    
                            guard let image = info[.editedImage] as? UIImage else {
                                print("No image found")
                                return
                            }
            
                            // print out the image size as a test
                    imageView.contentMode = .scaleToFill
                    imageView.image = image
                    print(image.size)
                    temp = 1
        }

        else{
            
            let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
                imageView.image = selectedImage

                dismiss(animated: true,completion:nil)
                temp = 1
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
