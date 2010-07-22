package flexUnitTests.collection
{
	import com.deviantcritters.util.collection.Stream;
	import com.deviantcritters.util.collection.concrete.IterateStream;
	
	import flexunit.framework.Assert;
	
	public class IterateStreamTest
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
		public function testIterateStream():void
		{
			var s:Stream = new IterateStream(function(x:Number):Number {return x + 1}, 0);
			Assert.assertNotNull(s);
		}
		
		[Test]
		public function testHasNext():void
		{
			var s:Stream = new IterateStream(function(x:Number):Number {return x + 1}, 0);
			Assert.assertTrue(s.hasNext());
		}
		
		[Test]
		public function testNext():void
		{
			var s:Stream = new IterateStream(function(x:Number):Number {return x + 1}, 0);
			Assert.assertEquals(s.next() as Number, 0);
			Assert.assertEquals(s.next() as Number, 1);
			Assert.assertEquals(s.next() as Number, 2);
		}
	}
}