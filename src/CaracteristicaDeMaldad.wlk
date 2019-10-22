import Minion.*
import Ciudad.*
import Arma.*
import Piramide.*
import SueroMutante.*
import Luna.*

class CaracteristicaDeMaldad {
	var minionsAptos = []
	
	method requisito(unos_minions)
	method concecuencia(una_ciudad)
	method recompensa()
	
}

class Congelar inherits CaracteristicaDeMaldad{
	var property minimoDeConcentracion = 500
	
	
	method tienenElArma(unos_minions){
		minionsAptos = unos_minions.filter({minion=>minion.tieneArmaCongelante()})
	}
	
	override method requisito(unos_minions){
		self.tienenElArma(unos_minions)
		return minionsAptos.sum({minion=>minion.nivelDeConcentracionDeMinion()}) > minimoDeConcentracion
		
	}
	override method concecuencia(una_ciudad){
		una_ciudad.disminuirTemperatura(30)
	}
	
	override method recompensa(){
		minionsAptos.forEach({minion=>minion.alimentar(10)})
		minionsAptos.forEach({minion=>minion.aumentarParticipacion()})
	}
}

class RobarPiramide inherits CaracteristicaDeMaldad{
	var piramide_a_robar = new Piramide()
	
	method criterioDeConcentracion()=piramide_a_robar.altura()/2
	
	method soloLosPeligrosos(unos_minions){
		minionsAptos = unos_minions.filter({minion=>minion.esPeligroso()})
	}
	
	override method requisito(unos_minions){
		self.soloLosPeligrosos(unos_minions)
		return minionsAptos.sum({minion=>minion.nivelDeConcentracionDeMinion()}) > self.criterioDeConcentracion()
	}
	
	override method concecuencia(una_ciudad){ 
		una_ciudad.perderObjetoValioso(piramide_a_robar)			
	}
	
	override method recompensa(){
		minionsAptos.forEach({minion=>minion.alimentar(10)})
		minionsAptos.forEach({minion=>minion.aumentarParticipacion()})
	}
	
}

class RobarSuero inherits CaracteristicaDeMaldad{
	var nuevo_suero= new SueroMutante()
	
	method soloLosBienAlimentados(unos_minions){
		minionsAptos = unos_minions.filter({minion=>minion.bienAlimentado()})
	}
	
	override method requisito(unos_minions){
		self.soloLosBienAlimentados(unos_minions)
		return minionsAptos.sum({minion=>minion.nivelDeConcentracionDeMinion()}) > 23
	}
	
	override method concecuencia(una_ciudad){ 
		una_ciudad.perderObjetoValioso(nuevo_suero)			
	}
	
	override method recompensa(){
		minionsAptos.forEach({minion=>minion.tomarSueroMutante(minion,nuevo_suero)})
		minionsAptos.forEach({minion=>minion.aumentarParticipacion()})
	}
}

class RobarLaLuna inherits CaracteristicaDeMaldad{
	var una_luna = new Luna()
	
	
	override method requisito(unos_minions)=true
	
	override method concecuencia(una_ciudad){ 
		una_ciudad.perderObjetoValioso(una_luna)			
	}
	
	override method recompensa(){
		minionsAptos.forEach({minion=>minion.otorgarArma(new Arma("Rayo Encogedor",10))})
		minionsAptos.forEach({minion=>minion.aumentarParticipacion()})
	}
	
}