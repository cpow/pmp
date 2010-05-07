// ActionScript file
package com.pmp.util{
	public class XMLUtils {
		public static function xmlListToBoolean(xmlList:XMLList):Boolean {
			return xmlList.toString() == "true"
		}
	}
}