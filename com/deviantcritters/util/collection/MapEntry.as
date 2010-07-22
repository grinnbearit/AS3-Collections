package com.deviantcritters.util.collection
{
	import com.deviantcritters.util.Collectable;

	/**An interface for key value pairs to be stored in a map*/
	public interface MapEntry extends Collectable
	{
		/**Retrieves the key in this MapEntry*/
		function get key():Collectable;
		
		/**Retrieves the value in this MapEntry*/
		function get value():Collectable;
	}
}