class_name scene extends Node

const Paddle = G.Paddle

var bg : Polygon2D

var paddles      : Array[Paddle]
var paddle_left  : Paddle
var paddle_right : Paddle

@onready var ui : Control = self.get_node('UI')

@export var paddle_x_offset : float
@export var paddle_size     : Vector2

func setup_paddles() -> void:
	for idx in range(2):
		var paddle   = Paddle.new()
		var shape    = Polygon2D.new();          shape.   name = "shape"
		var collider = CollisionPolygon2D.new(); collider.name = "collider"

		var paddle_half_size = paddle_size * 0.5
		var shape_points = PackedVector2Array([
			-paddle_half_size,
			Vector2(  paddle_half_size.x, -paddle_half_size.y ),
			paddle_half_size,
			Vector2( -paddle_half_size.x, paddle_half_size.y ),
		])
		shape.   set_polygon(shape_points)
		collider.set_polygon(shape.polygon)
		shape.set_color(Color(255, 255, 255, 255))

		paddle.shape    = shape
		paddle.collider = collider

		paddle.add_child(paddle.shape)
		paddle.add_child(paddle.collider)
		paddles.append(paddle)
		self.add_child(paddle)

	paddle_left  = paddles[0]
	paddle_right = paddles[1]
	paddle_left.name  = "Paddle Left"
	paddle_right.name = "Paddle Right"

	var screen_size : Vector2 = get_viewport().get_visible_rect().size
	paddle_left. set_position(Vector2(  paddle_x_offset,                 screen_size.y * 0.5))
	paddle_right.set_position(Vector2( -paddle_x_offset + screen_size.x, screen_size.y * 0.5))

#region Node

func _init() -> void:
	# Setup background
	bg = Polygon2D.new()
	var bg_points = PackedVector2Array(); bg_points.resize(4)
	bg.set_polygon(bg_points)
	bg.set_color(Color(0, 0, 0, 255))
	bg.name = "BG"
	self.add_child(bg)

	return

func _ready() -> void:
	# setup_paddles()
	return

func _process(_delta: float) -> void:
	# Update bg position
	var screen_halfsize : Vector2 = get_viewport().get_visible_rect().size / 2
	ui.set_position(-screen_halfsize)

	var points = PackedVector2Array([
		-screen_halfsize,
		Vector2(  screen_halfsize.x, -screen_halfsize.y ),
		screen_halfsize,
		Vector2( -screen_halfsize.x,  screen_halfsize.y),
	])
	bg.set_polygon(points)
	# bg.set_position(screen_center)
	return

#endregion Node
