//
//  OtpViewModel.swift
//  FlowCoordinatorEx
//
//  Created by FSSDeveloper on 21/11/24.
//

import Foundation

protocol OtpViewModelProtocol {
    func otpSubmitApi(otp: String)
}

class OtpViewModel: OtpViewModelProtocol{
    
    func otpSubmitApi(otp: String) {
        debugPrint("Submit OTP...")
    }
}
