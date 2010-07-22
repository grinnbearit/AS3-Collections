package flexUnitTests.collection
{
	import com.deviantcritters.util.Collectable;
	import com.deviantcritters.util.collection.Collection;
	import com.deviantcritters.util.collection.Map;
	import com.deviantcritters.util.collection.MapEntry;
	import com.deviantcritters.util.collection.Stream;
	import com.deviantcritters.util.collection.concrete.VectorCollection;
	import com.deviantcritters.util.collection.concrete.VectorMap;
	import com.deviantcritters.util.collection.concrete.VectorSet;
	
	import flexunit.framework.Assert;
	
	public class VectorMapTest
	{		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testAdd():void
		{
			var map:Map = new VectorMap();
			Assert.assertTrue(map.add(new CollectableNumber(0)));
			Assert.assertTrue(map.add(new CollectableNumber(1)));
			Assert.assertFalse(map.add(new CollectableNumber(1)));
			var array:Array = map.toArray();
			Assert.assertEquals(((array[0] as MapEntry).key as CollectableNumber).value, 0);
			Assert.assertEquals(((array[1] as MapEntry).key as CollectableNumber).value, 1);
			Assert.assertNull((array[0] as MapEntry).value);
			Assert.assertNull((array[1] as MapEntry).value);
		}
		
		[Test]
		public function testAddAll():void
		{
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			var map:Map = new VectorMap();
			map.addAll(c);
			Assert.assertNull(map.retrieve(new CollectableNumber(0)));
			Assert.assertNull(map.retrieve(new CollectableNumber(1)));
		}
		
		[Test]
		public function testClear():void
		{
			var map:Map = new VectorMap();
			map.add(new CollectableNumber(0));
			map.add(new CollectableNumber(1));
			map.add(new CollectableNumber(2));
			Assert.assertEquals(map.size, 3);
			map.clear();
			Assert.assertEquals(map.size, 0);
		}
		
		[Test]
		public function testClone():void
		{
			var map:Map = new VectorMap();
			map.update(new CollectableNumber(0), new CollectableNumber(0));
			Assert.assertTrue(map.clone().equals(map));
		}
		
		[Test]
		public function testContains():void
		{
			var map:Map = new VectorMap();
			map.add(new CollectableNumber(0));
			map.add(new CollectableNumber(1));
			map.add(new CollectableNumber(2));
			Assert.assertTrue(map.contains(new CollectableNumber(1)));
		}
		
		[Test]
		public function testContainsAll():void
		{
			var map:Map = new VectorMap();
			map.add(new CollectableNumber(0));
			map.add(new CollectableNumber(1));
			map.add(new CollectableNumber(2));
			Assert.assertTrue(map.containsAll(map.keys()));
		}
		
		[Test]
		public function testContainsEntry():void
		{
			var map:Map = new VectorMap();
			map.add(new CollectableNumber(0));
			map.update(new CollectableNumber(1), new CollectableNumber(1));
			var s:Stream = map.stream();
			while (s.hasNext())
				Assert.assertTrue(map.containsEntry(s.next() as MapEntry));
		}
		
		[Test]
		public function testContainsMap():void
		{
			var map:Map = new VectorMap();
			map.update(new CollectableNumber(0), new CollectableNumber(0));
			var map2:Map = new VectorMap();
			map2.update(new CollectableNumber(0), new CollectableNumber(0));
			map2.update(new CollectableNumber(0), new CollectableNumber(0));
			Assert.assertTrue(map2.containsMap(map));
		}
		
		[Test]
		public function testContainsValue():void
		{
			var map:Map = new VectorMap();
			Assert.assertFalse(map.containsValue(null));
			map.add(new CollectableNumber(0));
			Assert.assertTrue(map.containsValue(null));
			map.update(new CollectableNumber(0), new CollectableNumber(0));
			Assert.assertTrue(map.containsValue(new CollectableNumber(0)));
			Assert.assertFalse(map.containsValue(new CollectableNumber(1)));
		}
		
		[Test]
		public function testEquals():void
		{
			var map:Map = new VectorMap();
			map.update(new CollectableNumber(0), new CollectableNumber(0));
			var map2:Map = new VectorMap();
			map2.update(new CollectableNumber(0), new CollectableNumber(0));
			Assert.assertTrue(map.equals(map2));
			map.update(new CollectableNumber(0), new CollectableNumber(2));
			Assert.assertFalse(map.equals(map2));
		}
		
		[Test]
		public function testIsEmpty():void
		{
			var map:Map = new VectorMap();
			Assert.assertTrue(map.isEmpty());
			map.add(new CollectableNumber(0));
			Assert.assertFalse(map.isEmpty());
		}
		
		[Test]
		public function testKeys():void
		{
			var map:Map = new VectorMap();
			map.update(new CollectableNumber(0), new CollectableNumber(0));
			map.update(new CollectableNumber(1), new CollectableNumber(1));
			var set:VectorSet = new VectorSet();
			set.add(new CollectableNumber(1));
			set.add(new CollectableNumber(0));
			Assert.assertTrue(set.equals(map.keys()));
		}
		
		[Test]
		public function testRemove():void
		{
			var map:Map = new VectorMap();
			map.add(new CollectableNumber(0));
			map.add(new CollectableNumber(1));
			map.add(new CollectableNumber(2));
			Assert.assertFalse(map.remove(new CollectableNumber(3)));
			Assert.assertEquals(map.size, 3);
			Assert.assertTrue(map.remove(new CollectableNumber(1)));
			var array:Array = map.toArray();
			Assert.assertEquals((array[0] as MapEntry).key, 0);
			Assert.assertEquals((array[1] as MapEntry).key, 2);
			Assert.assertEquals(map.size, 2);
		}
		
		[Test]
		public function testRemoveAll():void
		{
			var map:Map = new VectorMap();
			map.add(new CollectableNumber(0));
			map.add(new CollectableNumber(1));
			map.add(new CollectableNumber(2));
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			Assert.assertTrue(map.removeAll(c));
			Assert.assertEquals(map.size, 1);
			Assert.assertTrue(map.contains(new CollectableNumber(2)));
			Assert.assertFalse(map.removeAll(c));
		}
		
		[Test]
		public function testRetainAll():void
		{
			var map:Map = new VectorMap();
			map.add(new CollectableNumber(0));
			map.add(new CollectableNumber(1));
			map.add(new CollectableNumber(2));
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			Assert.assertTrue(map.retainAll(c));
			Assert.assertEquals(map.size, 2);
			Assert.assertTrue(map.contains(new CollectableNumber(0)));
			Assert.assertTrue(map.contains(new CollectableNumber(1)));
			Assert.assertFalse(map.retainAll(c));
		}
		
		[Test]
		public function testRetrieve():void
		{
			var map:Map = new VectorMap();
			map.add(new CollectableNumber(0));
			Assert.assertNull(map.retrieve(new CollectableNumber(0)));
			map.update(new CollectableNumber(0), new CollectableNumber(0));
			Assert.assertEquals((map.retrieve(new CollectableNumber(0)) as CollectableNumber).value, 0);
		}
		
		[Test]
		public function testRetrieveEntry():void
		{
			var map:Map = new VectorMap();
			map.update(new CollectableNumber(0), new CollectableNumber(0));
			var entry:MapEntry = map.retrieveEntry(new CollectableNumber(0));
			Assert.assertEquals((entry.key as CollectableNumber).value, 0);
			Assert.assertEquals((entry.value as CollectableNumber).value, 0);
		}
		
		[Test]
		public function testGet_size():void
		{
			var map:Map = new VectorMap();
			map.add(new CollectableNumber(0));
			map.add(new CollectableNumber(1));
			map.add(new CollectableNumber(2));
			Assert.assertEquals(map.size, 3);
		}
		
		[Test]
		public function testStream():void
		{
			var map:Map = new VectorMap();
			map.add(new CollectableNumber(0));
			map.add(new CollectableNumber(1));
			map.add(new CollectableNumber(2));
			var s:Stream = map.stream();
			Assert.assertTrue(s.hasNext());
			Assert.assertEquals(((s.next() as MapEntry).key as CollectableNumber).value, 0);
			Assert.assertEquals(((s.next() as MapEntry).key as CollectableNumber).value, 1);
			Assert.assertEquals(((s.next() as MapEntry).key as CollectableNumber).value, 2);
			Assert.assertFalse(s.hasNext());
		}
		
		[Test]
		public function testToArray():void
		{
			var map:Map = new VectorMap();
			Assert.assertEquals(map.toArray().length, 0);
		}
		
		[Test]
		public function testUpdate():void
		{
			var map:Map = new VectorMap();
			map.update(new CollectableNumber(0), new CollectableNumber(0));
			Assert.assertEquals((map.retrieve(new CollectableNumber(0)) as CollectableNumber).value, 0);
			var num:CollectableNumber = map.update(new CollectableNumber(0), new CollectableNumber(1)) as CollectableNumber;
			Assert.assertEquals(num.value, 0);
			Assert.assertEquals((map.retrieve(new CollectableNumber(0)) as CollectableNumber).value, 1);
		}
		
		[Test]
		public function testUpdateAll():void
		{
			var map:Map = new VectorMap();
			map.update(new CollectableNumber(0), new CollectableNumber(0));
			map.update(new CollectableNumber(1), new CollectableNumber(1));
			map.update(new CollectableNumber(2), new CollectableNumber(2));
			var map2:Map = new VectorMap();
			map2.updateAll(map);
			Assert.assertTrue(map2.equals(map));
		}
		
		[Test]
		public function testUpdateEntry():void
		{
			var map:Map = new VectorMap();
			map.update(new CollectableNumber(0), new CollectableNumber(0));
			var map2:Map = new VectorMap();
			map2.updateEntry(map.retrieveEntry(new CollectableNumber(0)));
			Assert.assertEquals((map.retrieve(new CollectableNumber(0)) as CollectableNumber).value, 0);
		}
		
		[Test]
		public function testValues():void
		{
			var map:Map = new VectorMap();
			map.update(new CollectableNumber(0), new CollectableNumber(0));
			map.update(new CollectableNumber(1), new CollectableNumber(1));
			map.update(new CollectableNumber(2), new CollectableNumber(2));
			var c:Collection = map.values();
			Assert.assertTrue(c.contains(new CollectableNumber(0)));
			Assert.assertTrue(c.contains(new CollectableNumber(1)));
			Assert.assertTrue(c.contains(new CollectableNumber(2)));
		}
		
		[Test]
		public function testVectorMap():void
		{
			var map:Map = new VectorMap();
			Assert.assertNotNull(map);
		}
	}
}