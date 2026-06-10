class Nave {
 var velocidad
 var direccion
 var combustible
  method acelerar(cuanto){velocidad = (velocidad + cuanto).min(100000)}
  method desacelerar(cuanto){velocidad = (velocidad - cuanto).max(0)}
  method irHaciaElSol(){direccion = 10}
  method escaparDelSol(){direccion = -10}
  method ponerseParaleloAlSol(){direccion = 0}
  method acercarseUnPocoAlSol(){direccion = (direccion + 1).min(10)}
  method alejarseUnPocoDelSol(){direccion =(direccion-1).max(-10)}
  method prepararViaje(){
    self.cargarCombustible(30000)
    self.acelerar(5000)}
  method cargarCombustible(litros){combustible = combustible + litros}
  method descargarCombustible(litros){combustible = (combustible - litros).max(0)}
}
class NaveBaliza inherits Nave{
 var colorNave = "rojo"
 method cambiarColorDeBaliza(colorNuevo){colorNave = colorNuevo}
 override method prepararViaje(){
  super()
  self.cambiarColorDeBaliza("verde")
  self.ponerseParaleloAlSol()}
}
class NavePasajeros inherits Nave{
 var comida
 var bebida
 const cantidadPasajeros
 method agregarComida(racion){comida = comida + racion}
 method quitarComida(racion){comida = comida - racion}
 method agregarBebida(racion){bebida = bebida + racion}
 method quitarBebida(racion){bebida= bebida - racion}
 override method prepararViaje(){
  super()
  self.agregarBebida(6*cantidadPasajeros)
  self.agregarComida(4*cantidadPasajeros)
  self.acercarseUnPocoAlSol()}
}
class NaveCombate inherits Nave{
   var estaVisible 
   var estaDesplegado
   var mensajeEnviado = []
  method ponerseVisibles(){estaVisible = true}
  method ponerseInvisibles(){estaVisible = false}
  method estaInvisible(){return not estaVisible}
  method desplegarMisiles(){estaDesplegado = true}
  method replegarMisiles(){estaDesplegado = false}
  method misilesDesplegados(){return estaDesplegado}
  method emitirMensajes(mensaje){mensajeEnviado.add(mensaje)}
  method mensajesEmitidos(){return mensajeEnviado}
  method primerMensajeEmitido(){return mensajeEnviado.first()}
  method ultimoMensajeEmitido(){return mensajeEnviado.last()}
  method esEscueta(){return mensajeEnviado.all().size() >= 30}
  method emitioMensaje(mensaje){ return mensajeEnviado.find(mensaje)}
  override method prepararViaje(){
   super()
   self.ponerseVisibles()
   self.replegarMisiles()
   self.acelerar(15000)
   self.emitirMensajes("Saliendo en mision")}
}
class NaveHospital inherits NavePasajeros{
  method tienePreparadosQuirofanos(){}
}
class NaveCombateSigilosa inherits NaveCombate{}