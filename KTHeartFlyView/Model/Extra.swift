//
//	Extra.swift
//
//	Create by 忠乾 赵 on 28/9/2017
//	Copyright © 2017. All rights reserved.

import Foundation

struct Extra{

	var cover : AnyObject!
	var label : [Label]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		cover = dictionary["cover"] as AnyObject!
		label = [Label]()
		if let labelArray = dictionary["label"] as? [[String:Any]]{
			for dic in labelArray{
				let value = Label(fromDictionary: dic)
				label.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if cover != nil{
			dictionary["cover"] = cover
		}
		if label != nil{
			var dictionaryElements = [[String:Any]]()
			for labelElement in label {
				dictionaryElements.append(labelElement.toDictionary())
			}
			dictionary["label"] = dictionaryElements
		}
		return dictionary
	}

}
