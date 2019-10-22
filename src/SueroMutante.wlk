import Minion.*
import Colores.*

class SueroMutante {
	
	method ingerirSuero(un_minion){
		un_minion.color().actualizarColor(un_minion)
		un_minion.color().actualizarArma(un_minion)
		un_minion.cant_bananas( un_minion.cant_bananas()-1)
		
	}
}
