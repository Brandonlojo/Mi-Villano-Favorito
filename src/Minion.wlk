import Arma.*
import SueroMutante.*
import Colores.*


class Minion {
	var color = new Amarillo()
	var  cant_bananas = 5
	var armas = [new Arma("Rayo Congelante",10)]
	var participacion_en_maldades=0
	
	method color()=color
	method color(un_color){color=un_color}
	
	method armas()=armas
	method otorgarArma(un_arma){armas.add(un_arma)}
	
	method cant_bananas()= cant_bananas
	method cant_bananas(nuevas_bananas){cant_bananas=nuevas_bananas}
	method alimentar(nuevas_bananas){cant_bananas+=nuevas_bananas}
	
	method participacionEnMaldades()=participacion_en_maldades
	method aumentarParticipacion(){participacion_en_maldades+=1}
	
	method esPeligroso()= color.seriaPeligroso(self)

	method bienAlimentado()=cant_bananas>100

	method tomarSueroMutante(un_minion,un_suero){
		un_suero.ingerirSuero(un_minion)}
	
	method nivelDeConcentracionDeMinion()=color.nivelDeConcentracion(self)
	
	method tieneArmaCongelante(){armas.map({arma=>arma.nombre()}).contains("Rayo Congelante")}
}


/*	Lo que pasó al agregar otro color es que resultaba más conveniente delegar el comportamiento según el color
 * a una nueva clase que se encargara de eso, en vez de tenerlo en la clase minion con varios if() sucesivos.
 * Al agregar nuevos colores con distintos/nuevos comportamientos, solo hay que agregar una nueva subclase.
 */
		