// ActionScript file
package com.pmp.events {
	import flash.events.Event;
	
	public class CompanyEvent extends Event {
		public static const COMPANY_CREATE:String = "companyCreate";
		
		public var company:XML;
		
		public function CompanyEvent(type:String, company:XML) {
			super(type);
			this.company = company;
		}
	}
}