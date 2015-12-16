package org.uqbar.arena.examples.vista

import org.uqbar.arena.examples.dominio.appModel.AutenticadorAppModel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class Acciones extends SimpleWindow<AutenticadorAppModel>{
	
	new(WindowOwner owner, AutenticadorAppModel autenticacionModel){
		super(owner,autenticacionModel)
	}
	
	override protected addActions(Panel panelAcciones) {
		new Button(panelAcciones) =>[
			caption = "Redactar"
			onClick[abrirRedactar]
		]
		new Button(panelAcciones) =>[
			caption = "Bandeja De Entrada"
			onClick[abrirBandejaDeEntrada]
		]
	}
	
	override protected createFormPanel(Panel parent) {
		new Label(parent).text = "Bienvenido al Sistema de Mails que vuelvan el hotmail del 90!"
	}
	
	def abrirRedactar() {
		new Redactar(this, this.modelObject.usuarioEncontrado, this.modelObject.usuariosRegistrados).open
	}
	
	def abrirBandejaDeEntrada(){
		new BandejaDeEntrada(this, this.modelObject.usuarioEncontrado).open
	}
}