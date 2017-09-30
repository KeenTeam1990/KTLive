//
//	RootClass.swift
//
//	Create by 忠乾 赵 on 28/9/2017
//	Copyright © 2017. All rights reserved.

import Foundation

struct RootClass{

	var count : Int!
	var dmError : Int!
	var errorMsg : String!
	var expireTime : Int!
	var lives : [Live]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		count = dictionary["count"] as? Int
		dmError = dictionary["dm_error"] as? Int
		errorMsg = dictionary["error_msg"] as? String
		expireTime = dictionary["expire_time"] as? Int
		lives = [Live]()
		if let livesArray = dictionary["lives"] as? [[String:Any]]{
			for dic in livesArray{
				let value = Live(fromDictionary: dic)
				lives.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if count != nil{
			dictionary["count"] = count
		}
		if dmError != nil{
			dictionary["dm_error"] = dmError
		}
		if errorMsg != nil{
			dictionary["error_msg"] = errorMsg
		}
		if expireTime != nil{
			dictionary["expire_time"] = expireTime
		}
		if lives != nil{
			var dictionaryElements = [[String:Any]]()
			for livesElement in lives {
				dictionaryElements.append(livesElement.toDictionary())
			}
			dictionary["lives"] = dictionaryElements
		}
		return dictionary
	}

}
