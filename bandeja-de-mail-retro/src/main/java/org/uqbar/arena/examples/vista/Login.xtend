package org.uqbar.arena.examples.vista

import org.uqbar.arena.examples.dominio.appModel.AutenticadorAppModel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button

class Login extends Dialog<AutenticadorAppModel>{
	
	new(WindowOwner parent, AutenticadorAppModel model){
		super(parent, model)
	}
	
	override protected createFormPanel(Panel parent) {
		parent.layout = new VerticalLayout
		new Label(parent).text = "Usuario:"
		new TextBox(parent).bindValueToProperty("usuario")
		
		new Label(parent).text = "Password:"
		new TextBox(parent).bindValueToProperty("password")
		
		new Button(parent) => [
			caption = "Entrar"
			onClick [login()]	
		]
		
		new Label(parent).bindValueToProperty("resultadoLogin")
		
	}
	
	def void login() {
		if(this.modelObject.autenticar){
			new Acciones(this, modelObject).open
		}
	}
	
}