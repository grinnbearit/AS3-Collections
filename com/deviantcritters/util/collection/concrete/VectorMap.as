package com.deviantcritters.util.collection.concrete
{
	import com.deviantcritters.util.Collectable;
	import com.deviantcritters.util.collection.Collection;
	import com.deviantcritters.util.collection.ElementError;
	import com.deviantcritters.util.collection.Map;
	import com.deviantcritters.util.collection.MapEntry;
	import com.deviantcritters.util.collection.Set;
	import com.deviantcritters.util.collection.Stream;
	
	/**An implementation of a map using a vector*/
	public class VectorMap implements Map
	{
		private var vector:Vector.<VectorMapEntry>;
		
		public function VectorMap()
		{
			vector = new Vector.<VectorMapEntry>();
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		public function containsValue(value:Collectable):Boolean
		{
			for (var i:uint = 0; i < vector.length; i++)
			{
				var c:Collectable = vector[i]._value;
				if (c == null && value == null)
					return true;
				if (c.equals(value))
					return true;
			}
			return false;
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		public function containsEntry(entry:MapEntry):Boolean
		{
			for (var i:uint = 0; i < vector.length; i++)
				if (vector[i].equals(entry))
					return true;
			return false;
		}
		
		/**O(n^2)
		 * @inheritDoc
		 * */
		public function containsMap(map:Map):Boolean
		{
			var s:Stream = map.stream();
			var result:Boolean = true;
			while (s.hasNext())
				result = containsEntry(s.next() as MapEntry) && result;
			return result;
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		public function retrieve(key:Collectable):Collectable
		{
			for (var i:uint = 0; i < vector.length; i++)
				if (vector[i]._key.equals(key))
					return vector[i].value;
			throw new ElementError("key(" + key + ") not found");
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		public function retrieveEntry(key:Collectable):MapEntry
		{
			for (var i:uint = 0; i < vector.length; i++)
				if (vector[i]._key.equals(key))
					return vector[i].clone() as MapEntry;
			throw new ElementError("key(" + key + ") not found");
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		public function update(key:Collectable, value:Collectable):Collectable
		{
			for (var i:uint = 0; i < vector.length; i++)
				if (vector[i]._key.equals(key))
				{
					var c:Collectable = vector[i]._value;
					vector[i]._value = value == null ? null : value.clone();
					return c;
				}
			vector.push(new VectorMapEntry(key, value));
			return null;
		}
		
		/**O(n)
		 * @inheritDoc
		 * */
		public function updateEntry(entry:MapEntry):Collectable
		{
			return update(entry.key, entry.value);
		}
		
		/**O(n^2)
		 * @inheritDoc
		 * */
		public function updateAll(map:Map):void
		{
			var s:Stream = map.stream();
			while (s.hasNext())
				updateEntry(s.next() as MapEntry);
		}
		
		public function keys():Set
		{
			var set:Set = new VectorSet();
			for (var i:uint = 0; i < vector.length; i++)
				set.add(vector[i]._key);
			return set;
		}
		
		public function values():Collection
		{
			var c:Collection = new VectorCollection();
			for (var i:uint = 0; i < vector.length; i++)
				if (vector[i]._value != null)
					c.add(vector[i]._value);
			return c;
		}
		
		public function add(item:Collectable):Boolean
		{
			for (var i:uint = 0; i < vector.length; i++)
				if (vector[i]._key.equals(item))
					return false;
			vector.push(new VectorMapEntry(item, null));
			return true;
		}
		
		public function addAll(c:Collection):Boolean
		{
			var s:Stream = c.stream();
			var result:Boolean = false;
			while (s.hasNext())
				result = add(s.next() as Collectable) || result;
			return result;
		}
		
		public function clear():void
		{
			vector = new Vector.<VectorMapEntry>();
		}
		
		public function contains(item:Collectable):Boolean
		{
			for (var i:uint = 0; i < vector.length; i++)
				if (vector[i]._key.equals(item))
					return true;
			return false;
		}
		
		public function containsAll(c:Collection):Boolean
		{
			var result:Boolean = true;
			var s:Stream = c.stream();
			while (s.hasNext())
				result = contains(s.next() as Collectable) && result;
			return result;
		}
		
		public function isEmpty():Boolean
		{
			return vector.length == 0;
		}
		
		public function stream():Stream
		{
			return new VectorMapStream(vector);
		}
		
		public function remove(item:Collectable):Boolean
		{
			for (var i:uint = 0; i < vector.length; i++)
				if (vector[i]._key.equals(item))
				{
					vector.splice(i, 1);
					return true;
				}
			return false;
		}
		
		public function removeAll(c:Collection):Boolean
		{
			var result:Boolean = false;
			var s:Stream = c.stream();
			while (s.hasNext())
				result = remove(s.next() as Collectable) || result;
			return result;
		}
		
		public function retainAll(c:Collection):Boolean
		{
			var result:Boolean = false;
			for (var i:uint = 0; i < vector.length; i++)
				if (!c.contains(vector[i]._key))
				{
					result = true;
					vector.splice(i--, 1);
				}
			return result;
		}
		
		public function get size():uint
		{
			return vector.length;
		}
		
		public function toArray():Array
		{
			var array:Array = new Array();
			for (var i:uint = 0; i < vector.length; i++)
				array.push(vector[i].clone());
			return array;
		}
		
		public function equals(c:Collectable):Boolean
		{
			var map:Map = c as Map;
			if (map == null)
				return false;
			return map.size == vector.length && containsMap(map); 
		}
		
		public function clone():Collectable
		{
			var map:Map = new VectorMap();
			for (var i:uint = 0; i < vector.length; i++)
				map.updateEntry(vector[i]);
			return map;
		}
		
		public function toString():String
		{
			return toArray().toString();
		}
	}
}
import com.deviantcritters.util.Collectable;
import com.deviantcritters.util.collection.AbstractStream;
import com.deviantcritters.util.collection.MapEntry;

class VectorMapEntry implements MapEntry
{
	public var _key:Collectable;
	public var _value:Collectable;
	
	public function VectorMapEntry(key:Collectable, value:Collectable)
	{
		_key = key.clone();
		_value = value == null ? null : value.clone();
	}
	
	public function get key():Collectable
	{
		return _key;
	}
	
	public function get value():Collectable
	{
		return _value;
	}
	
	public function clone():Collectable
	{
		return new VectorMapEntry(_key, _value);
	}
	
	public function equals(item:Collectable):Boolean
	{
		var entry:MapEntry = item as MapEntry;
		if (entry == null)
			return false;
		if (_key.equals(entry.key))
			if (_value == null && entry.value == null)
				return true
			else
				return _value.equals(entry.value);
		return false;
	}
	
	public function toString():String
	{
		return "[" + _key + ": " + _value + "]";
	}
}

class VectorMapStream extends AbstractStream
{
	private var vector:Vector.<VectorMapEntry>;
	private var index:uint = 0;
	
	public function VectorMapStream(vector:Vector.<VectorMapEntry>)
	{
		this.vector = vector;
	}
	
	override protected function _next():Object
	{
		return vector[index++].clone()
	}
	
	override protected function _hasNext():Boolean
	{
		return index < vector.length;
	}
}