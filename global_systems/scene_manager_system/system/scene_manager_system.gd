## SMS. Singleton node that give access to all scene containers registered.
extends Node

var _registered_containers : Dictionary = {}

const ERROR_SAME_CONTAINER_NAME = "Containers with the same name. Change one of their names."
const ERROR_CONTAINER_NOT_FOUND = "Container not found"

## Register a container so it can be access globally.
func register_new_container(new_container:SceneContainer):
	assert(not _registered_containers.has(new_container.name), ERROR_SAME_CONTAINER_NAME)
	_registered_containers[new_container.name] = new_container

## Retrieves a scene container by its name
func get_container(container_name:String) -> SceneContainer:
	var returned_container:SceneContainer = _registered_containers[container_name]
	assert(returned_container != null, ERROR_CONTAINER_NOT_FOUND)
	return returned_container

## Unregisters a container from the system, so it would no gets any references if deleted
func unregister_container(container: SceneContainer):
	_registered_containers.erase(container.name)
