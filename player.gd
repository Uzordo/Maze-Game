extends CharacterBody2D

@onready var tile_map = $"../TileMap"
@onready var sprite_2d = $Sprite2D
@onready var ray_cast_2d = $RayCast2D

@onready var respawn_point: Vector2 = Vector2(0, 0)
@onready var game_menu = $GameMenu
@onready var gui = $"../../GUI"

var death: bool = false

var is_moving: bool = false
var menu: bool = false

func _physics_process(_delta):
	
	if is_moving == false:
		return
	
	sprite_2d.global_position = sprite_2d.global_position.move_toward(global_position, 3)
	
	if global_position == sprite_2d.global_position:
		is_moving = false
		return
	

func _process(_delta):
	
	# SE IL PLAYER MUORE, ALLORA SPOSTA LA POSIZIONE ALLO RESPAWN POINT E SETTA "DEATH" FALSO
	if death:
		position = respawn_point
		death = false
	
	# SE IL PLAYER SI STA MUOVENDO RITORNA
	if is_moving:
		return
	
	
	# MOVIMENTO DEL PLAYER
	if Input.is_action_pressed("up"):
		move(Vector2.UP)
	elif Input.is_action_pressed("down"):
		move(Vector2.DOWN)
	elif Input.is_action_pressed("left"):
		move(Vector2.LEFT)
	elif Input.is_action_pressed("right"):
		move(Vector2.RIGHT)
	
	if Input.is_action_pressed("menu"):
		get_tree().paused = true
		game_menu.show()

# FUNZIONE DEL MOVIMENTO
func move(direction: Vector2):
	# GET CURRENT TILE VECTOR2I
	var current_tile: Vector2i = tile_map.local_to_map(global_position)
	# GET TARGET TILE VECTOR2I
	var target_tile: Vector2i = Vector2i(
		current_tile.x + direction.x,
		current_tile.y + direction.y
	)
		
	# CONTROLLA LE COLLISIONI TRA TILE
	ray_cast_2d.target_position = direction * 64
	ray_cast_2d.force_raycast_update()
	
	if ray_cast_2d.is_colliding():
		return
	
	# MOVE THE PLAYER
	is_moving = true
	
	global_position = tile_map.map_to_local(target_tile)

	sprite_2d.global_position = tile_map.map_to_local(current_tile)

# OGNI VOLTA CHE IL PLAYER VA SU UN CHECKPOINT, MODIFICA LA POSIZIONE DEL RESPAWN POINT CON QUELLA DEL
# CHECKPOINT
func change_spawn(new_spawn: Vector2):
	respawn_point = new_spawn
	print(respawn_point)

func hit():
	death = true
	Globals.update_total_tries()
