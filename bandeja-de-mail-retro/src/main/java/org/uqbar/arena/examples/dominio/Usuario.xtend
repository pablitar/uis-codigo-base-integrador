package org.uqbar.arena.examples.dominio

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.ObservableUtils

@Observable
@Accessors
class Usuario {
	
	String nombre
	int password
	List<Mail> enviados = newArrayList
	List<Mail> bandejaDeEntrada = newArrayList
	List<Usuario> bloqueados = newArrayList
	
	new(String nombre, String password) {
		this.nombre = nombre
		this.password = password.hashCode
	}
	
	def Boolean passwordCorrecta(String pass){
		pass.hashCode == password
	}
	
	def void enviarMail(Mail mail){
		enviados.add(mail)
		ObservableUtils.firePropertyChanged(this, "enviados", enviados)
		mail.to.recibirMail(mail)
	}
	
	def void recibirMail(Mail mail){
		if(bloqueados.contains(mail.from)){
			return;
		}
		bandejaDeEntrada.add(mail)
		ObservableUtils.firePropertyChanged(this, "bandejaDeEntrada", bandejaDeEntrada)
	}
	
	
}