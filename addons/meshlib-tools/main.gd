tool
extends EditorPlugin

var dock

func _enter_tree():

    dock = preload("res://addons/meshlib-tools/menu.tscn").instance()

    add_control_to_container(EditorPlugin.CONTAINER_SPATIAL_EDITOR_MENU, dock)




func _exit_tree():
    remove_control_from_docks(dock)
    dock.free()
