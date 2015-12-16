package org.uqbar.arena.examples.vista

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.examples.dominio.Usuario
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.examples.dominio.Mail
import org.uqbar.arena.widgets.tables.Column

class BandejaDeEntrada extends Dialog<Usuario>{
	
	new(WindowOwner owner, Usuario model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel container) {
		container.layout = new VerticalLayout
		
		val bandejaDeEntrada = new Table<Mail>(container,Mail)
		bandejaDeEntrada.bindItemsToProperty("bandejaDeEntrada")
		new Column<Mail>(bandejaDeEntrada) => [
			title = "De"
			bindContentsToProperty("from.nombre")
		]
		
		new Column<Mail>(bandejaDeEntrada) => [
			title = "Asunto"
			bindContentsToProperty("subject")
		]
		
		new Column<Mail>(bandejaDeEntrada) => [
			title = "Contenido"
			bindContentsToProperty("body")
		]
	}
	
}