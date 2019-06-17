//
//  Configuration.swift
//  BestDealMedication
//
//  Created by Macbook on 12/24/18.
//  Copyright © 2018 company. All rights reserved.
//

import Foundation
import UIKit

public struct Configuration {
    

    /**
     Block that receives a phone number and is expected to call a completion block with a verification ID.
     
     - Parameter phoneNumber: the phone number to verify
     - Parameter completion: the completion block (must be called!)
     */
    public typealias RequestCodeBlock = (_ phoneNumber: String, _ completion: @escaping (_ verificationID: String?, _ error: Error?) -> Void) -> Void
    
    /**
     Block that receives a verification ID and code, and is expected to call a completion block with success (or an error).
     
     - Parameter verificationID: the verification session ID
     - Parameter verificationCode: the matching verification code
     - Parameter completion: the completion block (must be called!)
     */
    public typealias SignInBlock = (_ verificationID: String, _ verificationCode: String, _ completion: @escaping (_ error: Error?) -> Void) -> Void
}
