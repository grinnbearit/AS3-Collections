package com.deviantcritters.util.collection
{
	import com.deviantcritters.util.Collectable;

	/**A collection for items (keys) which are unique and each key has a mapping to another item (value)*/
	public interface Map extends Collection
	{
		/**Checks if the passed value is contained in this map
		 * @param value, the value to be checked for membership
		 * @return True if value is present else false*/
		function containsValue(value:Collectable):Boolean;
		
		/**Checks if the passed MapEntry (key value pair) is contained in this map
		 * @param entry, the key value pair to be checked for membership
		 * @return True if key entry is present else false*/ 
		function containsEntry(entry:MapEntry):Boolean;
		
		/**Checks if all key value pairs in the passed map are contained in this map
		 * @param map, the map to be checked for membership
		 * @return True if the map is contained else false*/
		function containsMap(map:Map):Boolean;
		
		/**Retrieves the associated value for the passed key
		 * @param key, the key whose value is to be retrieved
		 * @return If the key has an associated value then the value else null
		 * @throws ElementError if the key is not present in this map*/
		function retrieve(key:Collectable):Collectable;
		
		/**Retrieves the key value pair as a MapEntry for the passed key
		 * @param key, the key whose MapEntry is to be returned
		 * @return The MapEntry identified by the passed key
		 * @throws ElementError if the key is not present in this map*/
		function retrieveEntry(key:Collectable):MapEntry;
		
		/**Updates the associated value for the passed key by the passed value or adds
		 * a new key-value pair if the key does not exist
		 * @param key, the key whose value is to be updated
		 * @param value, the new value for the passed key
		 * @return The old value for the passed key or null if the key didn't exist*/
		function update(key:Collectable, value:Collectable):Collectable;
		
		/**Updates the key-value pair by the passed MapEntry or adds
		 * a new key-value pair if the key does not exist
		 * @param entry, the key-value pair to be updated or inserted into this map
		 * @return The old value for the passed key or null if the key didn't exist*/
		function updateEntry(entry:MapEntry):Collectable;
		
		/**Updates or inserts the key-value pairs in the passed map in this map
		 * @param entry, the map to be updated or inserted into this map*/
		function updateAll(map:Map):void;
		
		/**Returns a set containing all the keys in this map
		 * @return A set containing the keys of this map*/
		function keys():Set;
		
		/**Returns a collection containing the associated values in this map
		 * @return A collection containing the associtated values in this map*/
		function values():Collection;
	}
}