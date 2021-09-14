extends Node2D


func _ready():
	applovin.setUserId("Your sdk id")
func _on_interstitial_loaded(id: String):
	applovin.showInterstitial(id)


func _on_Button_pressed():
	applovin.loadInterstitial("Zone id", get_instance_id())
