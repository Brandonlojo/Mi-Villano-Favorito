class Colores {
	
	method seriaPeligroso(un_minion)
	
	method actualizarColor(un_minion)
	
	method actualizarArma(un_minion)
	
	method nivelDeConcentracion(un_minion)
	
}


class Amarillo inherits Colores{
	
	override method seriaPeligroso(un_minion)=true
	
	override method actualizarColor(un_minion){
		un_minion.color(new Violeta())
	}
	
	override method actualizarArma(un_minion){un_minion.armas().clear()}
	
	override method nivelDeConcentracion(un_minion){
		return (un_minion.armas().max({arma=>arma.potencia()})).potencia() + un_minion.cant_bananas()
	}
}

class Violeta inherits Colores{
	
	override method seriaPeligroso(un_minion)= un_minion.armas().size()>2
	
	override method actualizarColor(un_minion){}
	
	override method actualizarArma(un_minion){}
	
	override method nivelDeConcentracion(un_minion)= un_minion.cant_bananas()
}


class Verde inherits Colores{
	
	override method seriaPeligroso(un_minion)=true
	
	override method actualizarColor(un_minion){
		un_minion.color(new Amarillo())
	}
	
	override method actualizarArma(un_minion){un_minion.armas().remove(un_minion.armas().first())}
	
	override method nivelDeConcentracion(un_minion)= un_minion.armas().size()
}