package
{
	public interface IPoolable
	{
		function init(...args):void;
		function reset(...args):void;
	}
	
	public class Pool
	{
		public var size:int = 10;
		
		private var type:Class;
		private var pool:Vector.<IPoolable>;
		
		public function Pool(type:Class)
		{
			this.type = type;
			this.pool = new <IPoolable>[];
		}
		
		public function getInstance(...args):IPoolable
		{
			var item:IPoolable;
			if(pool.length < size)
			{
				item = new (type) as IPoolable;
				if(!item) throw new Error("Class provided is not IPoolable!")
				
				item.init.apply(item,args);
			}
			else
			{
				enemy = pool.shift();
				item.reset.apply(item,args);
			}
			
			pool.push(item);
			return item
		}
	}
}