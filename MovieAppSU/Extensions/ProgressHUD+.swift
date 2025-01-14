//
//  ProgressHUD.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 26/11/24.
//

import Foundation
import ProgressHUD

extension ProgressHUD {
    static func commonLoading(_ willLoad: Bool) {
        if willLoad {
            self.colorBackground =  .black.withAlphaComponent(0.25)
            self.animate(interaction: true)
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.dismiss()
            }
        }
    }
}
