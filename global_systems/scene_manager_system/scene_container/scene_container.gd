## Contains the scenes that get changed by the _scene_manager when called by SMS.

## Use this node wherever you want to be changig scenes via SMS.
## It is usefull when used Globally (using it as an alternative of /root node) 
## because it alows passing arguments to a scene before changing to it. [br]
## It can also be used to change internal scenes, 
## like changing only the background or a part of the HUD. [br]
## It is used with SMS Singleton, so you can access several instances of it, globally. 
@tool class_name SceneContainer extends Node2D

#region Error constants
const ERROR_GENERIC_NAME = "SceneContainer is the generic name for this Scene. If you instantiated more than once make sure they don't have the same name. It would cause a crash when instantiated at runtime.\n   Consider changing the name of the node of instantiated scene."
const ERROR_MULTIPLE_CHILDREN = "SceneContainer must not have more than 1 child."
#endregion

var _scene_manager: SM = SM.new()

# This container gets registered in SMS so you can access it globally
func _enter_tree() -> void:
	_scene_manager.container = self
	if !Engine.is_editor_hint():
		SMS.register_new_container(self)

## Change the current inner scene to instantiated_scene_to_go. [br]
## Also recives parameters for animation of the exiting scene and of the entering scene
func goto_scene(instantiated_scene_to_go: Node, out_animation: SM.ANIMATIONS = SM.ANIMATIONS.NONE, in_animation: SM.ANIMATIONS = SM.ANIMATIONS.NONE):
	_scene_manager.goto_scene(instantiated_scene_to_go, out_animation, in_animation)

func _get_configuration_warnings():
	var warning_messages :PackedStringArray = []
	if self.get_child_count() > 1:
		warning_messages.append(ERROR_MULTIPLE_CHILDREN)
	if self.name == "SceneContainer":
		warning_messages.append(ERROR_GENERIC_NAME)
	return warning_messages

func _exit_tree():
	if !Engine.is_editor_hint():
		SMS.unregister_container(self)
