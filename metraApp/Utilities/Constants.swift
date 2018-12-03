//
//  Constants.swift
//  metraApp
//
//  Created by Zelal-Ezaldeen on 11/25/18.
//  Copyright © 2018 Metra Company. All rights reserved.
//

import Foundation

typealias CompletionHandler =  (_ Success: Bool) -> ()

// URL Constants
let BASE_URL = "https://chattychatjb.herokuapp.com/v1/" // Work

//let BASE_URL = "https://chatmetra.herokuapp.com/v1/" // Not Working
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]


// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"


// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
