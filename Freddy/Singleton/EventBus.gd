extends Node

signal sem_pneus

func checar_pneus():
	#Aguarda até o final do frame. Quando um objeto é deletado, ele ainda fica no grupo até o final do frame
	#Isso pode ser arrumado usando free(), mas eu prefiro evitar de usar o free pra casos assim
	await get_tree().process_frame
	if get_tree().get_nodes_in_group("Killable").is_empty():
		sem_pneus.emit()
