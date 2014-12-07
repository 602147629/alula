package  
{
	/**
	 * ...
	 * @author On Studios
	 */
	//The player.  Moved by A, D, E, RIGHT, LEFT, and UP.
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;


	
	public class Player extends Entity
	{
		[Embed(source = "../assets/player_standin.png")] private const PLAYER:Class;
		
		//set initial velocities
		public var x_velocity:int = 0;
		private var y_velocity:int = 0;
		private var y_accel:int = 0;
		private var walk_speed:int  = 2.5;
		private var jump_strength:int =  -20;
		private var gravity:int = 10

		
		public function Player()
		{
			//set initial position
			x = 100;
			y = 640;
			
			
			name = "player";
			graphic = new Image(PLAYER);
		}
		
		override public function update():void
		{
			trace("Player updates.");
			
			//update x
			x += x_velocity;
			//if the player won't touch the ground, update for gravity
			if (y < (650 - y_velocity)) {
				y_accel = gravity;
				
			}
			if(y >= (650 - y_velocity)) {
				y_accel = 0;
				y_velocity = 0;
				
			}
			if(y <= (250 - y_velocity)) {
				jump_strength = gravity;
				//y_accel = gravity;
			}
			
			if (y >= 640) {
				jump_strength = -20;
			}
			//update y
			
			y += y_velocity;
			y_velocity += y_accel;

			x_velocity = 0;
			
		
				if (Input.check(Key.UP))
			{
				y -= 2;
				y_velocity = jump_strength;
			}
				if (Input.check(Key.W))
			{
				y -= 2;
				y_velocity = jump_strength;
			}
			if (Input.check(Key.D))
			{
				x_velocity = walk_speed;
			}
			if (Input.check(Key.RIGHT))
			{
				x_velocity = walk_speed;
			}
			
			if (Input.check(Key.A))
			{
				x_velocity = (0 - walk_speed);
			}
			if (Input.check(Key.LEFT))
			{
				x_velocity = (0 - walk_speed);
			}
			super.update();
			
		}
		
		public function getX_Velocity():int {
			return x_velocity;
		}

	}

}