extends Label

func _ready() -> void:
	Signals.score_updated.connect(on_score_updated);
	
func on_score_updated(value: int):
	text = str(value);
