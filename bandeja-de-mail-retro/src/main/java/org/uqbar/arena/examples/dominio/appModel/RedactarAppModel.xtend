package org.uqbar.arena.examples.dominio.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.arena.examples.dominio.Mail
import org.uqbar.arena.examples.dominio.Usuario
import java.util.List

@Accessors
@Observable
class RedactarAppModel {
	Usuario usuario
	Mail mail
	List<Usuario> destinatariosPosibles
	
	new(Usuario usuario, List<Usuario> todos){
		this.usuario = usuario
		mail = new Mail
		destinatariosPosibles = todos.filter[it.nombre != usuario.nombre].toList
	}
	
	def enviarMail() {
		usuario.enviarMail(mail)
	}
	
}