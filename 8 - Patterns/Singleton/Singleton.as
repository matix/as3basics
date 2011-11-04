package {
	public class Singleton {
		private static const instance:Singleton
		private static var singleton_lock:Boolean = true
		
		public static get singleton():Singleton
		{
		  if(!instance)
		  {
			singleton_lock = false; 
			instance = new Singleton()
			singleton_lock = true; 
		  }
		  
		  return instance
		}
		
		public Singleton()
		{
		   if(singleton_lock)
		   {
			  throw new Error("Cannot instantiate directly, use singleton");
		   }
		   
		   //construct ...
		}
	}
}