module kamera;
import hoekjed;

private Vec!3[4] _voor_plekken = [
	{[-0.25, 0.5, -0.25]}, {[0.25, 0.5, -0.25]}, {[0.25, 0.5, 0.25]},
	{[-0.25, 0.5, 0.25]}
];
private Vec!3[4] _achter_plekken = [
	{[-0.5, -0.5, -0.5]}, {[0.5, -0.5, -0.5]}, {[0.5, -0.5, 0.5]},
	{[-0.5, -0.5, 0.5]}
];
private Vec!2[4] _lege_beeldplekken = [{[0, 0]}, {[0, 0]}, {[0, 0]}, {[0, 0]}];

class Kamera : Ding {
	private Vierkant _voorkant;
	private Vierkant _achterkant;
	public Ding gevolgde;

	this() {
		// this._voorkant = new Vierkant(_voor_plekken, _lege_beeldplekken);
		this._voorkant = new Vierkant(Vec!3([0, 0.5, 0]));
		this._voorkant.kleur = Vec!4([0, 0.8, 0, 1]);
		this._voorkant.grootte = Vec!3([0.5, 0.5, 0.5]);
		this._achterkant = new Vierkant(_achter_plekken, _lege_beeldplekken);
		this += this._voorkant;
		this += this._achterkant;
	}

	override void _teken() {
	}

	override void _denk(Wereld wereld) {
		if (this.gevolgde is null)
			return;
		Vec!3 richting = this.gevolgde.plek - this.plek;
		draai = TEMP_draai(Vec!3([0, -1, 0]), richting * -1);
	}
}
