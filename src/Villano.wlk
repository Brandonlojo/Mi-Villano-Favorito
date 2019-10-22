import Minion.*
import Arma.*
import Ciudad.*
import CaracteristicaDeMaldad.*

class Villano {
	var ejercitoMinion=[new Minion()]
	var ciudad = new Ciudad()
	
	method nuevoMinion(){ejercitoMinion.add(new Minion())}
	
	method noHayMinions(){
		if(ejercitoMinion.isEmpty()){throw new Exception(message="No existen minions")}}
	
	method hacerMaldad(tipoDeMaldad){
		self.noHayMinions()
		if(tipoDeMaldad.requisito(ejercitoMinion)){
			tipoDeMaldad.concecuencia(ciudad)
			tipoDeMaldad.recompensa()
		}
	}
	
	method minionMasUtil()= ejercitoMinion.max({minion=>minion.participacionEnMaldades()})
	
	method minionsMenosUtiles()= ejercitoMinion.filter({minion=>minion.participacionEnMaldades()==0})
	
}
