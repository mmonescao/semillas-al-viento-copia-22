import parcelas.*

class Planta {
	var property anioDeObtencion = 0
	var property altura = 0
	var property horasDeSolQueTolera = 7
	var property espacioQueOcupa = 0
	
	method esFuerte() = return self.horasDeSolQueTolera() > 9
	
	method daNuevaSemilla() = return self.esFuerte()
	
	method esSangreJoven() = return anioDeObtencion > 2012
	
	method esParcelaIdeal(unaParcela)
}

class Menta inherits Planta {
	
	override method daNuevaSemilla() = return altura > 0.4
	
	override method espacioQueOcupa() = return altura * 3
	
	override method esParcelaIdeal(unaParcela) = return unaParcela.superficie() > 6
}

class Soja inherits Planta {
	
	override method horasDeSolQueTolera(){
		return if(altura < 0.3){
			6
		} else if(altura.between(0.3,0.8)){
			7
		} else {
			12
		}
	}
	
	override method daNuevaSemilla() = super() or self.condicionAlternativa()
	
	method condicionAlternativa() = return anioDeObtencion > 2007 and altura.between(0.75,0.9)
	
	override method espacioQueOcupa() = return altura / 2
	
	override method esParcelaIdeal(unaParcela) = return unaParcela.horasDeSol() == self.horasDeSolQueTolera()
}

class Quinoa inherits Planta {
	
	override method horasDeSolQueTolera(){
		return if(espacioQueOcupa < 0.3){
			10
		} else {
			7
		}
	}
	
	override method daNuevaSemilla() = super() or self.condicionAlternativa()
	
	method condicionAlternativa() = return anioDeObtencion.between(2001,2008)
	
	override method esParcelaIdeal(unaParcela) = return unaParcela.plantaDeMayorAltura().altura() < 1.5
	
}

class SojaTransgenica inherits Soja {
	
	override method daNuevaSemilla() = return false
	
	override method esParcelaIdeal(unaParcela) = unaParcela.cantidadMaxDePlantas() == 1
}

class Peperina inherits Menta {
	
	override method espacioQueOcupa() = super() * 2
}