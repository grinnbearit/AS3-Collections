package com.deviantcritters.util
{
	/**A minimal interface for objects which want to be stored in collections*/
	public interface Collectable
	{
		/**equals is used to test membership in collection
		 * @param c, the collectable to be tested against
		 * @return True if equal, false otherwise*/
		function equals(c:Collectable):Boolean;
		
		/**returns a copy of this object, or the same object
		 * if immutable
		 * @return The copy of this object*/
		function clone():Collectable;
	}
}