package com.deviantcritters.util.collection
{
	/**An error thrown by collections which want to restrict usage of certain methods
	 * in the interface*/
	public class MethodNotSupportedError extends Error
	{
		public function MethodNotSupportedError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}