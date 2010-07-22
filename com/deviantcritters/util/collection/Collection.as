package com.deviantcritters.util.collection
{
	import com.deviantcritters.util.Collectable;
	
	/**A generic interface for all datastructures*/ 
	public interface Collection extends Collectable
	{
		/**Adds a collectable to this collection
		 * @param item, the collectable to be added
		 * @return True if add successful, false otherwise*/
		function add(item:Collectable):Boolean;
		
		/**Adds all the collectables in the given collection to
		 * this one
		 * @param c, the collection to be added
		 * @return True if this collection changes, false otherwise*/
		function addAll(c:Collection):Boolean;
		
		/**Removes all items from this collection*/
		function clear():void;
		
		/**Checks membership for the passed collectable
		 * @param item, the collectable to be checked for membership
		 * @return True if item is a member of this collection, false otherwise*/
		function contains(item:Collectable):Boolean;
		
		/**Checks membership for all items in the passed collection
		 * @param c, the collection to be checked for membership
		 * @return True if all the items in the collection are members, 
		 * false otherwise*/
		function containsAll(c:Collection):Boolean;
		
		/**Checks if this collection contains to items
		 * @return True if empty, false otherwise*/
		function isEmpty():Boolean;
		
		/**Returns a stream for this collection
		 * @return a stream which contains the items of this collection*/ 
		function stream():Stream;
		
		/**Remove the item (if it exists) from this collection
		 * @param item, the item to be removed
		 * @return True if removed, false otherwise*/
		function remove(item:Collectable):Boolean;
		
		/**Removes all the items in the passed collection from this collection
		 * @param, c, the collection to be removed
		 * @return True if this collection changes, false otherwise*/
		function removeAll(c:Collection):Boolean;
		
		/**Removes all the items which aren't in the passed collection from this collection
		 * @param c, the collection to be retained
		 * @return True if this collection changes, false otherwise*/ 
		function retainAll(c:Collection):Boolean;
		
		/**Returns the number of items in this collection
		 * @return The number of items in this collection*/
		function get size():uint;
		
		/**Returns an array representation of this collection
		 * @return an array containing the items of this collection*/
		function toArray():Array;
	}
}