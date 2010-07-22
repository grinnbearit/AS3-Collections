package flexUnitTests.collection
{
	import com.deviantcritters.util.collection.Collection;
	import com.deviantcritters.util.collection.Stream;
	import com.deviantcritters.util.collection.StreamError;
	import com.deviantcritters.util.collection.concrete.VectorCollection;
	import com.deviantcritters.util.collection.AbstractStream;
	
	import flexunit.framework.Assert;
	
	public class AbstractStreamTest
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
		public function testAbstractStream():void
		{
			var s:Stream = new AbstractStream();
			Assert.assertNotNull(s);
		}
		
		[Test]
		public function testDrop():void
		{
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			var s:Stream = c.stream();
			s.drop(2);
			Assert.assertTrue(s.hasNext());
			Assert.assertEquals((s.next() as CollectableNumber).value, 2);
			Assert.assertFalse(s.hasNext());
			s = c.stream();
			s.drop(4);
			Assert.assertFalse(s.hasNext());
		}
		
		[Test]
		public function testDropWhile():void
		{
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			var s:Stream = c.stream();
			s.dropWhile(function(c:CollectableNumber):Boolean {return c.value < 2});
			Assert.assertTrue(s.hasNext());
			Assert.assertEquals((s.next() as CollectableNumber).value, 2);
			Assert.assertFalse(s.hasNext());
			s = c.stream();
			s.dropWhile(function(o:Object):Boolean {return true});
			Assert.assertFalse(s.hasNext());
		}
		
		[Test]
		public function testFilter():void
		{
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			var s:Stream = c.stream();
			s.filter(function(c:CollectableNumber):Boolean {return c.value == 1});
			Assert.assertTrue(s.hasNext());
			Assert.assertEquals((s.next() as CollectableNumber).value, 1);
			Assert.assertFalse(s.hasNext());
			s = c.stream();
			s.filter(function(a:CollectableNumber):Boolean {return false});
			Assert.assertFalse(s.hasNext());
		}
		
		[Test]
		public function testHasNext():void
		{
			var s:Stream = new AbstractStream();
			Assert.assertFalse(s.hasNext());
		}
		
		[Test]
		public function testMap():void
		{
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			var s:Stream = c.stream();
			s.map(function(c:CollectableNumber):Number {return c.value});
			Assert.assertTrue(s.hasNext());
			Assert.assertEquals(s.next() as Number, 0);
			Assert.assertEquals(s.next() as Number, 1);
			Assert.assertEquals(s.next() as Number, 2);
			Assert.assertFalse(s.hasNext());
			s = c.stream();
			var d:Collection = new VectorCollection();
			d.add(new CollectableNumber(1));
			d.add(new CollectableNumber(2));
			var t:Stream = d.stream();
			s.map(function(a:CollectableNumber, b:CollectableNumber):Number {return a.value + b.value}, t);
			Assert.assertTrue(s.hasNext());
			Assert.assertEquals(s.next() as Number, 1);
			Assert.assertEquals(s.next() as Number, 3);
			Assert.assertFalse(s.hasNext());
		}
		
		[Test]
		public function testNext():void
		{
			var s:Stream = new AbstractStream();
			try
			{
				s.next();
			}
			catch(e:StreamError)
			{
				Assert.assertNotNull(e);
			}
		}
		
		[Test]
		public function testReduce():void
		{
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			var x:CollectableNumber = c.stream().reduce(
				function(a:CollectableNumber, b:CollectableNumber):CollectableNumber {a.value += b.value; return a}) as CollectableNumber
			var y:Number = c.stream().reduce(function(a:Number, b:CollectableNumber):Number {return a + b.value}, 0) as Number;
			var z:Number = c.stream().reduce(function(a:Number, b:CollectableNumber):Number {return a + b.value}, 0, new CollectableNumber(10)) as Number;
			Assert.assertEquals(x.value, 3);
			Assert.assertEquals(y, 3);
			Assert.assertEquals(z, 13);
		}
		
		[Test]
		public function testTake():void
		{
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			var s:Stream = c.stream();
			s.take(2);
			Assert.assertTrue(s.hasNext());
			Assert.assertEquals((s.next() as CollectableNumber).value, 0);
			Assert.assertEquals((s.next() as CollectableNumber).value, 1);
			Assert.assertFalse(s.hasNext());
			s = c.stream();
			s.take(4);
			Assert.assertTrue(s.hasNext());
			Assert.assertEquals((s.next() as CollectableNumber).value, 0);
			Assert.assertEquals((s.next() as CollectableNumber).value, 1);
			Assert.assertEquals((s.next() as CollectableNumber).value, 2);
			Assert.assertFalse(s.hasNext());
		}
		
		[Test]
		public function testTakeWhile():void
		{
			var c:Collection = new VectorCollection();
			c.add(new CollectableNumber(0));
			c.add(new CollectableNumber(1));
			c.add(new CollectableNumber(2));
			var s:Stream = c.stream();
			s.takeWhile(function(c:CollectableNumber):Boolean {return c.value < 2});
			Assert.assertTrue(s.hasNext());
			Assert.assertEquals((s.next() as CollectableNumber).value, 0);
			Assert.assertEquals((s.next() as CollectableNumber).value, 1);
			Assert.assertFalse(s.hasNext());
			s = c.stream();
			s.takeWhile(function(o:Object):Boolean {return true});
			Assert.assertTrue(s.hasNext());
			Assert.assertEquals((s.next() as CollectableNumber).value, 0);
			Assert.assertEquals((s.next() as CollectableNumber).value, 1);
			Assert.assertEquals((s.next() as CollectableNumber).value, 2);
			Assert.assertFalse(s.hasNext());
		}
	}
}