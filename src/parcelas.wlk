class Parcela {
	var property ancho
	var property largo
	var property horasDeSol = 0
	const property plantas = []
	
	method superficie() = return ancho * largo
	
	method cantidadMaxDePlantas(){
		return if(ancho > largo){
			self.superficie() / 5
		} else {
			self.superficie() / 3 + largo
		}
	}
	
	method tieneSangreJoven() = return plantas.any({planta => planta.esSangreJoven()})
	
	method noSeSuperaCantidadMax() = return (plantas.size() + 1) < self.cantidadMaxDePlantas()
	
	method horasDeSolNoSuperanToleranciaDe(unaPlanta) = return (unaPlanta.horasDeSolQueTolera() - horasDeSol).abs() >= 2
	
	method sePuedePlantar(unaPlanta) = return self.noSeSuperaCantidadMax() or self.horasDeSolNoSuperanToleranciaDe(unaPlanta)
	
	method plantar(unaPlanta){
		if(self.sePuedePlantar(unaPlanta)){
			plantas.add(unaPlanta)
		} else {
			self.error("La planta no puede ser plantada en esta parcela")
		}
	}
	
	method plantaDeMayorAltura() = return plantas.max({planta => planta.altura()})
	
	method cantidadDePlantas() = return plantas.size()
}

class ParcelaEcologica inherits Parcela {
	
	method seAsociaBien(unaPlanta) = return self.tieneSangreJoven() and unaPlanta.esParcelaIdeal(self)
}

class ParcelaIndustrial inherits Parcela {
	
	method seAsociaBien(unaPlanta) = return self.cantidadMaxDePlantas() <= 2 and unaPlanta.esFuerte()
}