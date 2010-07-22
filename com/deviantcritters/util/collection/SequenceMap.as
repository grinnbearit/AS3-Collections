package com.deviantcritters.util.collection
{
	import com.deviantcritters.util.Collectable;
	
	public interface SequenceMap extends Sequence, Map
	{
		/**Retrieves a SequenceMap of items from the fromIndex(inclusive) to the toIndex(exclusive),
		 * if fromIndex is equal to toIndex, returns an empty SequenceMap
		 * @param fromIndex, the start index (inclusive)
		 * @param toIndex, the end index (exclusive)
		 * @return A SequenceMap of the items from fromIndex to toIndex
		 * @throws RangeError if fromIndex < 0 or toIndex < 0 or fromIndex > this.size() 
		 * or toIndex >= this.size() or fromIndex >= toIndex*/
		function takeRangeMap(fromIndex:uint, toIndex:uint):SequenceMap;
		
		/**Removes a SequenceMap of items from the fromIndex(inclusive) to the toIndex(exclusive) and
		 * returns it, if fromIndex is equal to toIndex, returns an empty SequenceMap with no changes to
		 * this SequenceMap
		 * @param fromIndex, the start index (inclusive)
		 * @param toIndex, the end index (exclusive)
		 * @return A SequenceMap of the items from fromIndex to toIndex
		 * @throws RangeError if fromIndex < 0 or toIndex < 0 or fromIndex >= this.size() 
		 * or toIndex >= this.size() or fromIndex > toIndex*/
		function dropRangeMap(fromIndex:uint, toIndex:uint):SequenceMap;
		
		/**Retrieves a SequenceMap of items from the first occurrence of fromItem(inclusive) to the first occurrence
		 * of toItem(exclusive) if fromItem is equal to toItem, returns an empty SequenceMap
		 * @param fromItem, the start item (inclusive)
		 * @param toItem, the end item (exclusive)
		 * @return A SequenceMap of the items from fromItem to toItem
		 * @throws ElementError if fromItem or toItem are not present in this collection
		 * @throws RangeError if toItem appears before fromItem in this collection*/
		function takeMap(fromElement:Collectable, toElement:Collectable):SequenceMap;
		
		/**Removes a SequenceMap of items from the first occurrence of fromItem(inclusive) to the first occurrence
		 * of toItem(exclusive) and returns it, if fromItem is equal to toItem, returns an empty SequenceMap
		 * with no change to this collection
		 * @param fromItem, the start item (inclusive)
		 * @param toItem, the end item (exclusive)
		 * @return A SequenceMap of the items from fromItem to toItem
		 * @throws ElementError if fromItem or toItem are not present in this collection
		 * @throws RangeError if toItem appears before fromItem in this collection*/
		function dropMap(fromElement:Collectable, toElement:Collectable):SequenceMap;
		
		/**Retrieves a SequenceMap of items from the first item in this collection (head item) to the first occurrence
		 * of toItem(exclusive) if the head item is equal to toItem, returns an empty SequenceMap
		 * @param toItem, the end item (exclusive)
		 * @return A SequenceMap of the items from the head item to toItem
		 * @throws ElementError if toItem is not present*/
		function takeHeadMap(toElement:Collectable):SequenceMap;
		
		/**Removes a SequenceMap of items from the first item in this collection (head item) to the first occurrence
		 * of toItem(exclusive) and returns it, if the head item is equal to toItem, returns an empty SequenceMap with
		 * no change to this collection
		 * @param toItem, the end item (exclusive)
		 * @return A SequenceMap of the items from the head item to toItem
		 * @throws ElementError if toItem is not present*/
		function dropHeadMap(toElement:Collectable):SequenceMap;
		
		/**Retrieves a SequenceMap of items from the first occurrence of fromItem (inclusive) in this collection to the end
		 * of this SequenceMap, if fromItem is equal to the last element of the sequence returns only the last item in
		 * a SequenceMap
		 * @param fromItem, the start item (inclusive)
		 * @return A SequenceMap of the items from fromItem to the end of this SequenceMap
		 * @throws ElementError if fromItem is not present*/
		function takeTailMap(fromElement:Collectable):SequenceMap;
		
		/**Removes a SequenceMap of items from the first occurrence of fromItem (inclusive) in this collection to the end
		 * of this sequence and returns it, if fromItem is equal to the last element of the SequenceMap returns only the 
		 * last item in a sequence and removes it
		 * @param fromItem, the start item (inclusive)
		 * @return A SequenceMap of the items from fromItem to the end of this SequenceMap
		 * @throws ElementError if fromItem is not present*/
		function dropTailMap(fromElement:Collectable):SequenceMap;
	}
}