extends Node2D

var _ads = null
onready var Production = not OS.is_debug_build()
var isTop = true

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	if(Engine.has_singleton("AppLovin")):
		_ads = Engine.get_singleton("AppLovin")
	else:
		push_warning('AppLovin module not found!')
	if ProjectSettings.has_setting('AppLovin/SdkKey'):
		var sdk_key = ProjectSettings.get_setting('AppLovin/SdkKey')
		if _ads != null:
			_ads.init(sdk_key, Production)

func isInited() -> bool:
	if _ads != null:
		return _ads.isInited()
	else:
		return false

func setUserId(uid: String) -> void:
	if _ads != null:
		_ads.setUserId(uid)

func isGdprApplies() -> bool:
	if _ads != null:
		return _ads.isGdprApplies()
	else:
		return false

func setGdprConsent(consent: bool) -> void:
	if _ads != null:
		_ads.setGdprConsent(consent)

func setAgeRestricted(restricted: bool) -> void:
	if _ads != null:
		_ads.setAgeRestricted(restricted)

func setCCPAApplied(applied: bool) -> void:
	if _ads != null:
		_ads.setCCPAApplied(applied)

# Loaders

func loadBanner(id: String, isTop: bool, callback_id: int) -> bool:
	if _ads != null:
		_ads.loadBanner(id, isTop, callback_id)
		return true
	else:
		return false

func loadInterstitial(id: String, callback_id: int) -> bool:
	if _ads != null:
		_ads.loadInterstitial(id, callback_id)
		return true
	else:
		return false

func loadRewardedVideo(id: String, callback_id: int) -> bool:
	if _ads != null:
		_ads.loadRewardedVideo(id, callback_id)
		return true
	else:
		return false

# Check state

func bannerWidth(id: String) -> int:
	if _ads != null:
		var width = _ads.getBannerWidth(id)
		return width
	else:
		return 0

func bannerHeight(id: String) -> int:
	if _ads != null:
		var height = _ads.getBannerHeight(id)
		return height
	else:
		return 0

# Control

func showBanner(id: String) -> bool:
	if _ads != null:
		_ads.showBanner(id)
		return true
	else:
		return false

func hideBanner(id: String) -> bool:
	if _ads != null:
		_ads.hideBanner(id)
		return true
	else:
		return false

func removeBanner(id: String) -> bool:
	if _ads != null:
		_ads.removeBanner(id)
		return true
	else:
		return false

func showInterstitial(id: String) -> bool:
	if _ads != null:
		_ads.showInterstitial(id)
		return true
	else:
		return false

func showRewardedVideo(id: String) -> bool:
	if _ads != null:
		_ads.showRewardedVideo(id)
		return true
	else:
		return false

func makeZombieBanner(id: String) -> String:
	if _ads != null:
		return _ads.makeZombieBanner(id)
	else:
		return ""

func killZombieBanner(id: String) -> void:
	if _ads != null:
		_ads.killZombieBanner(id)
