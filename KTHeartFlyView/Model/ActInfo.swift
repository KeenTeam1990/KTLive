//
//	ActInfo.swift
//
//	Create by 忠乾 赵 on 28/9/2017
//	Copyright © 2017. All rights reserved.

import Foundation

struct ActInfo{

	var icon : String!
	var uid : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		icon = dictionary["icon"] as? String
		uid = dictionary["uid"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if icon != nil{
			dictionary["icon"] = icon
		}
		if uid != nil{
			dictionary["uid"] = uid
		}
		return dictionary
	}

}
