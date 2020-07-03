import plantas.*
import parcelas.*

object inta {
	const property parcelas = []
	
	method agregarParcela(unaParcela) = parcelas.add(unaParcela)
	
	method promedioDePlantas() = self.cantidadTotaldePlantas() / self.cantidadDeParcelas()
	
	method cantidadDeParcelas() = return parcelas.size()
	
	method cantidadTotaldePlantas() = parcelas.sum({parcela => parcela.cantidadDePlantas()})
}
