package com.deviantcritters.util.collection
{
	/**An error thrown by a collection when for example an item which does not exist is to be updated*/
	public class ElementError extends Error
	{
		public function ElementError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}