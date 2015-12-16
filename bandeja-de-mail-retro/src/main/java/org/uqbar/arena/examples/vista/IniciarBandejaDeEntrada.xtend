package org.uqbar.arena.examples.vista

import org.uqbar.arena.Application
import org.uqbar.arena.examples.datos.DummyData
import org.uqbar.arena.examples.dominio.appModel.AutenticadorAppModel

class IniciarBandejaDeEntrada extends Application {
	
	def static void main(String[] args) {
		new IniciarBandejaDeEntrada().start()
	}
	
	override protected createMainWindow() {
		var model = new AutenticadorAppModel
		model.usuariosRegistrados = DummyData.usuariosConMails
		new Login(this, model) 
	} 
	
}