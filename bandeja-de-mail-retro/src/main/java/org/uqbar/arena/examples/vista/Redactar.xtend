package org.uqbar.arena.examples.vista

import java.util.List
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.examples.dominio.Usuario
import org.uqbar.arena.examples.dominio.appModel.RedactarAppModel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class Redactar extends SimpleWindow<RedactarAppModel>{
	
	new(WindowOwner owner, Usuario usuario, List<Usuario> todos){
		super(owner, new RedactarAppModel(usuario, todos))
	}
	
	override protected addActions(Panel accionesPanel) {
		new Button(accionesPanel) =>[
			caption = "Enviar"
			onClick [
				this.modelObject.enviarMail
				this.close
			]
		]
	}
	
	override protected createFormPanel(Panel formulario) {
		formulario.layout = new VerticalLayout
		
		new Label(formulario).text = "Destinatario"
		new Selector(formulario) => [
			bindValueToProperty("mail.to")
			bindItemsToProperty("destinatariosPosibles").adapter = new PropertyAdapter(Usuario, "nombre")
		]
		
		new Label(formulario).text = "Asunto"
		new TextBox(formulario).bindValueToProperty("mail.subject")
		
		new Label(formulario).text = "Mensaje"
		new TextBox(formulario).bindValueToProperty("mail.body")
		
	}
	
}