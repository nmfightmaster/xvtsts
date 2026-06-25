class_name Ship
extends Resource

@export_category("Stats")
@export var health: int
@export var speed: float
@export var acceleration: float
@export var capacitor_capacity: int

@export_category("Cards")
@export var max_hand_size: int
@export var cards_drawn: int

@export_category("Movement")
@export var position: Vector3