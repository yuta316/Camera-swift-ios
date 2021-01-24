//
//  CheckPermission.swift
//  Camera
//
//  Created by 石川裕太 on 2021/01/24.
//

import Foundation
import Photos

//カメラの許可画面クラス
class CheckPermission{
    func checkCamera(){
        //ユーザーに許可を促す
        PHPhotoLibrary.requestAuthorization{
            (status) in
            switch(status){
            case .authorized:
                print("authorized")
            case .notDetermined:
                print("notDetermined")
            case .restricted:
                print("restricted")
            case .denied:
                print("denied")
            case .limited:
                print("limited")
            @unknown default:
                break
            }
        }
    }
}
