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
  method estaTranquila(){ return combustible >= 4000 and velocidad <= 12000}
  method escapar()
  method avisar()
  method recibirAmenaza(){
    self.escapar()
    self.avisar()}
  method tienePocaActividad(){return true}
  method estaDeRelajo(){return self.estaTranquila() && self.tienePocaActividad()}
}
class NaveBaliza inherits Nave{
 var colorNave = "rojo"
 method cambiarColorDeBaliza(colorNuevo){
  colorNave = colorNuevo}
 override method prepararViaje(){
  super()
  self.cambiarColorDeBaliza("verde")
  self.ponerseParaleloAlSol()}
 override method estaTranquila(){ return super() && colorNave != "rojo"}
  override method escapar(){self.irHaciaElSol()}
  override method avisar(){self.cambiarColorDeBaliza("rojo")}
  override method estaDeRelajo(){return 
    super()
    self.tienePocaActividad()
  }
}
class NavePasajeros inherits Nave{
 var comida
 var bebida
 const cantidadPasajeros
 var comidaServida = 0
 method agregarComida(racion){comida = comida + racion}
 method quitarComida(racion){
  comida = comida - racion
  comidaServida = comidaServida + 1}
 method agregarBebida(racion){bebida = bebida + racion}
 method quitarBebida(racion){bebida= bebida - racion}
 override method prepararViaje(){
  super()
  self.agregarBebida(6*cantidadPasajeros)
  self.agregarComida(4*cantidadPasajeros)
  self.acercarseUnPocoAlSol()}
  override method escapar(){velocidad = velocidad * 2}
  override method avisar(){
    self.quitarBebida(cantidadPasajeros*2)
    self.quitarComida(cantidadPasajeros)}
   method tienPocaActividad(){return comidaServida < 50}
  override method estaDeRelajo(){ return
    super()
    self.tienePocaActividad()}
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
  method esEscueta(){return mensajeEnviado.all{m=>m.size() <= 30}}
  method emitioMensaje(mensaje){ return mensajeEnviado.find(mensaje)}
  override method prepararViaje(){
   super()
   self.ponerseVisibles()
   self.replegarMisiles()
   self.acelerar(15000)
   self.emitirMensajes("Saliendo en mision")}
  override method estaTranquila(){ return
    super()
    estaDesplegado = false} // self.replegarMisiles() ??//
  override method escapar(){
    self.acercarseUnPocoAlSol()
    self.acercarseUnPocoAlSol()}
  override method avisar(){self.emitirMensajes("Amenaza recibida")}
}
class NaveHospital inherits NavePasajeros{
   var estaPreparado = false 
  method prepararQuirofano(){estaPreparado = true}
  method tienePreparadosQuirofanos(){return estaPreparado}
  override method estaTranquila(){ return
    super()
    estaPreparado = false}
  override method recibirAmenaza(){
    super()
   self.prepararQuirofano()}
}
class NaveCombateSigilosa inherits NaveCombate{
  override method estaTranquila(){ return
    super()
    self.ponerseVisibles()} // estaVisible = true
  override method escapar(){
    super()
    self.desplegarMisiles()
    self.ponerseInvisibles()}
}