//
//  ViewController.swift
//  Camera
//
//  Created by 石川裕太 on 2021/01/24.
//

import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var backImageView: UIImageView!
    //許可インスタンス化
    var checkPermission = CheckPermission()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkPermission.checkCamera()
    }
    
    @IBAction func camera(_ sender: Any) {
        //souceTypeをカメラに
        let souceType:UIImagePickerController.SourceType = .camera
        createImagePicker(souceType: souceType)
    }
    @IBAction func alubum(_ sender: Any) {
        let souceType:UIImagePickerController.SourceType = .photoLibrary
        createImagePicker(souceType: souceType)

    }
    @IBAction func share(_ sender: Any) {
        let text = ""
        let image = backImageView.image?.jpegData(compressionQuality: 0.5)
        let item = [text,image as Any]
        //アクションシーと
        let activityVC = UIActivityViewController(activityItems: item, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
    
    //socetype: camra?alubum?
    func createImagePicker(souceType:UIImagePickerController.SourceType){
        //インスタンスの作成
        let cameraPicker = UIImagePickerController()
        cameraPicker.sourceType = souceType
        cameraPicker.delegate = self
        //カメラの編集許可
        cameraPicker.allowsEditing = true
        self.present(cameraPicker, animated: true, completion: nil)
    }
    
    //撮影,アルバムがキャンセルされたとき
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
    }
    //画像データ受け取り
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickerImage = info[.editedImage] as? UIImage{
            backImageView.image = pickerImage
            //カメラ閉じる
            picker.dismiss(animated:true, completion: nil)
        }
    }
     


}

