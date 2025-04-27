object tito {
    var cantidad = 0
    var bebida = cianuro
    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
        * self.inerciaBase() / self.peso()
    }
}

object wisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}
object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
}

object licuadoFrutas {
    const nutrientes = []
    
    method agregarNutrientes(unNutriente){
        nutrientes.add(unNutriente)
    }

    method quitarNutriente(unNutriente) {
        nutrientes.remove(unNutriente)
    }

    method rendimiento(cantidad) {
        return cantidad * nutrientes.sum()
    }
}

object aguaSaborizada {
    var bebida = wisky

    method rendimiento(cantidad) {
        return 1 + bebida.rendimiento(cantidad) / 4
    }

    method bebidaNueva(unaBebida) {
        bebida = unaBebida
    }
}

object coctelSuave {
    const bebidas = []


    method agregarBebida(unaBebida) {
        bebidas.add(unaBebida)
    }

    method quitarBebida(unaBebida) {
        bebidas.remove(unaBebida)
    }

    method rendimiento(cantidad) {
        const bebidasRendimiento = bebidas.filter({e => e.rendimiento(cantidad) > 0.5})
        return bebidasRendimiento.sum({e => e.rendimiento(cantidad)})
    }

    method rendimientoBis(cantidad) = bebidas.filter({e => e.rendimiento(cantidad) > 0.5}).sum({e => e.rendimiento(cantidad)})
}

object coctel {
    const bebidas = []
    
    method agregarBebida(unaBebida) {
        bebidas.add(unaBebida)
    }

    method quitarBebida(unaBebida) {
        bebidas.remove(unaBebida)
    }

    method rendimiento(cantidad){
        var bebidasRendimiento = 1
        bebidas.forEach({e => bebidasRendimiento *= e.rendimiento(cantidad)})
    } 
}