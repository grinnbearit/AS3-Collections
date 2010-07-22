package flexUnitTests.collection
{
	import com.deviantcritters.util.collection.Collection;
	import com.deviantcritters.util.collection.Stream;
	import com.deviantcritters.util.collection.concrete.VectorCollection;
	
	import flexunit.framework.Assert;
	
	public class VectorCollectionTest
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
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			var array:Array = c.toArray();
			Assert.assertEquals((array[0] as CollectableNumber).value, 0);
			Assert.assertEquals((array[1] as CollectableNumber).value, 1);
			Assert.assertEquals((array[2] as CollectableNumber).value, 2);
			Assert.assertEquals(c.size, 3);
		}
		
		[Test]
		public function testAddAll():void
		{
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			Assert.assertEquals(c.size, 3);
			c.addAll(c);
			Assert.assertEquals(c.size, 6);
		}
		
		[Test]
		public function testClear():void
		{
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			c.clear();
			var array:Array = c.toArray();
			Assert.assertEquals(array.length, 0);
		}
		
		[Test]
		public function testClone():void
		{
			var c:Collection = new VectorCollection();
			Assert.assertEquals((c.clone() as Collection).size, 0);
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			Assert.assertEquals((c.clone() as Collection).size, 3);
		}
		
		[Test]
		public function testContains():void
		{
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			Assert.assertTrue(c.contains(new CollectableNumber(1)));
			Assert.assertFalse(c.contains(new CollectableNumber(3)));
		}
		
		[Test]
		public function testContainsAll():void
		{
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			var d:Collection = new VectorCollection();
			d.add(new CollectableNumber(0));
			d.add(new CollectableNumber(1));
			d.add(new CollectableNumber(2));
			Assert.assertTrue(c.containsAll(d));
			d.add(new CollectableNumber(3));
			Assert.assertFalse(c.containsAll(d));
		}
		
		[Test]
		public function testEquals():void
		{
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			var d:Collection = new VectorCollection();
			d.add(new CollectableNumber(1));
			d.add(new CollectableNumber(2));
			Assert.assertFalse(c.equals(d));
			d.add(new CollectableNumber(0));
			Assert.assertTrue(c.equals(d));
		}
		
		[Test]
		public function testIsEmpty():void
		{
			var c:Collection = new VectorCollection();
			Assert.assertTrue(c.isEmpty());
			c.add(new CollectableNumber(0));
			Assert.assertFalse(c.isEmpty());
		}
		
		[Test]
		public function testRemove():void
		{
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			Assert.assertFalse(c.remove(new CollectableNumber(3)));
			Assert.assertEquals(c.size, 3);
			Assert.assertTrue(c.remove(new CollectableNumber(1)));
			var array:Array = c.toArray();
			Assert.assertEquals((array[0] as CollectableNumber).value, 0);
			Assert.assertEquals((array[1] as CollectableNumber).value, 2);
			Assert.assertEquals(c.size, 2);
		}
		
		[Test]
		public function testRemoveAll():void
		{
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			var d:Collection = new VectorCollection();
			d.add(new CollectableNumber(0));
			d.add(new CollectableNumber(1));
			Assert.assertTrue(c.removeAll(d));
			Assert.assertEquals(c.size, 1);
			Assert.assertTrue(c.contains(new CollectableNumber(2)));
			Assert.assertFalse(c.removeAll(d));
		}
		
		[Test]
		public function testRetainAll():void
		{
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			var d:Collection = new VectorCollection();
			d.add(new CollectableNumber(0));
			d.add(new CollectableNumber(1));
			Assert.assertTrue(c.retainAll(d));
			Assert.assertEquals(c.size, 2);
			Assert.assertTrue(c.contains(new CollectableNumber(0)));
			Assert.assertTrue(c.contains(new CollectableNumber(1)));
			Assert.assertFalse(c.retainAll(d));
		}
		
		[Test]
		public function testGet_size():void
		{
			var c:Collection = new VectorCollection();
			Assert.assertEquals(c.size, 0);
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			Assert.assertEquals(c.size, 3);
		}
		
		[Test]
		public function testStream():void
		{
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			var s:Stream = c.stream();
			Assert.assertTrue(s.hasNext());
			Assert.assertEquals((s.next() as CollectableNumber).value, 0);
			Assert.assertEquals((s.next() as CollectableNumber).value, 1);
			Assert.assertEquals((s.next() as CollectableNumber).value, 2);
			Assert.assertFalse(s.hasNext());
		}
		
		[Test]
		public function testToArray():void
		{
			var c:Collection = new VectorCollection();
			Assert.assertEquals(c.toArray().length, 0);
		}
		
		[Test]
		public function testVectorCollection():void
		{
			var c:Collection = new VectorCollection();
			Assert.assertNotNull(c);
		}
	}
}