package com.deviantcritters.util.collection
{
	/**An error thrown by a stream when something goes wrong, for example trying to retrieve an item when
	 * a stream is empty*/
	public class StreamError extends Error
	{
		public function StreamError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}