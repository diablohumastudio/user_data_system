## Scene Manager. Changes the scenes inside a SceneContainer.
class_name SM extends Node

const ERROR_NULL_SCENE = "Trying to goto_scene to a Null Scene"

var container: SceneContainer

enum ANIMATIONS {CURTAIN_OUT, FADE_IN, FADE_OUT, NONE}

var animations : Dictionary [ANIMATIONS, Callable] = {
	ANIMATIONS.CURTAIN_OUT: curtain_out,
	ANIMATIONS.FADE_IN: fade_in,
	ANIMATIONS.FADE_OUT: fade_out,
	ANIMATIONS.NONE: none,
}

## Change the current inner scene to instantiated_scene_to_go. [br]
## Also recives parameters for animation of the exiting scene and of the entering scene
func goto_scene(instantiated_scene_to_go: Node, out_animation: ANIMATIONS = SM.ANIMATIONS.NONE, in_animation: ANIMATIONS = SM.ANIMATIONS.NONE):

	assert(instantiated_scene_to_go != null, ERROR_NULL_SCENE)

	var current_scene :CanvasItem
	if container.get_child_count() != 0:
		current_scene = container.get_child(0)

	# subviewports allow both scenes have their own cameras working at the same time. For using subviewports you need
	# subviewport_container that have to be set its size, inside it goes the subviewport and inside are the nodes or scene
	# that we want to be seen. 
	var new_scene_sub_viewport_container: SubViewportContainer = SubViewportContainer.new() 
	new_scene_sub_viewport_container.stretch = true
	new_scene_sub_viewport_container.size = Vector2(1920,1080)
	var new_scene_sub_viewport: SubViewport = SubViewport.new()
	new_scene_sub_viewport_container.add_child(new_scene_sub_viewport)
	new_scene_sub_viewport.add_child(instantiated_scene_to_go)
	# We add the new scene (inside the viewport and viewport container) to the scene and put it behind the old scene (current_scene)
	# and then we wait for the new scene gets ready to be shown and then delete the old one. After that we take the new scene
	# out of the viewport and delete the viewpor, since we dont need it and 
	# can cause problems (because we didnt take that in consideration before creating the other scenes)
	container.add_child(new_scene_sub_viewport_container)
	container.move_child(new_scene_sub_viewport_container, 0)
	await container.get_tree().process_frame ##this await waits for added viewport move position and visible added the new scene to screen

	if out_animation != SM.ANIMATIONS.NONE:
		if out_animation == SM.ANIMATIONS.CURTAIN_OUT:
			animate(in_animation,instantiated_scene_to_go)
		await animate(out_animation, current_scene)

	if current_scene: current_scene.queue_free() ## this queue awaits for added viewport scene to start executing animation in case new scene has to do it at begining

	if in_animation != SM.ANIMATIONS.NONE and out_animation != SM.ANIMATIONS.CURTAIN_OUT:
		animate(in_animation, instantiated_scene_to_go)

	await container.get_tree().process_frame
	instantiated_scene_to_go.reparent(container)
	new_scene_sub_viewport_container.queue_free()

func animate(animation: ANIMATIONS, node: Node = self) -> void:
	var tween = container.get_tree().create_tween()
	animations[animation].call(tween, node)
	await tween.finished

#region Animation Functions
## Animate node up until it goes out of screen 
func curtain_out(tween:Tween,node:Node):
	var screen_size : Vector2i = DisplayServer.screen_get_size(0)
	var screen_height : float = screen_size.y * 1.5
	tween.tween_property(node, "position", Vector2(0, -screen_height), 0.5)

## Fades in a node from black to original color
func fade_in(tween:Tween,node:Node):
	node.modulate = Color.BLACK  
	tween.tween_property(node, "modulate", Color.WHITE, 2) 

## Fades out a node from original color to black
func fade_out(tween:Tween,node:Node):
	node.modulate = Color.WHITE  
	tween.tween_property(node, "modulate", Color.BLACK, 0.5) 
	
## Utility function that returns null. Used when no animation is needed
func none():
	return null
#endregion
