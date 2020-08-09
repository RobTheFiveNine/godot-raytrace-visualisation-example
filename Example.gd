extends Spatial

onready var arrow = $Arrow
onready var raycast = $Arrow/RayCast
onready var line = $ImmediateGeometry

func _process(delta):
    arrow.rotate_y(delta * 1.5)
    line.clear()

    if raycast.is_colliding():
        line.begin(Mesh.PRIMITIVE_LINE_STRIP)
        line.add_vertex(to_local(raycast.global_transform.origin))
        line.add_vertex(to_local(raycast.get_collision_point()))
        line.end()
