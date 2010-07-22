package flexUnitTests.collection
{
	import com.deviantcritters.util.Collectable;

	public class CollectableNumber implements Collectable
	{
		public var value:Number;
		
		public function CollectableNumber(value:Number)
		{
			this.value = value;
		}
		
		public function equals(c:Collectable):Boolean
		{
			var x:CollectableNumber = c as CollectableNumber;
			return x == null ? false : this.value == x.value;
		}
		
		public function clone():Collectable
		{
			return new CollectableNumber(this.value);
		}
		
		public function toString():String
		{
			return value.toString();
		}
	}
}