package org.uqbar.arena.examples.datos

import java.util.List
import org.uqbar.arena.examples.dominio.Usuario
import org.uqbar.arena.examples.dominio.Mail

class DummyData {
	
	def static List<Usuario> getUsuariosConMails() {
		val user1 = crearUsuario("denna")
		val user2 = crearUsuario("mariano")
		val user3 = crearUsuario("demian")
		crearMail(user1, user2)
		crearMail(user1, user3)
		crearMail(user1, user3)
		crearMail(user2, user3)
		crearMail(user2, user1)
		crearMail(user3, user1)
		crearMail(user3, user1)
		#{user1,user2,user3}.toList 
	}
	
	def static crearMail(Usuario from, Usuario to) {
		val Mail mail = new Mail(from, to, '''spam: «from.nombre» - «to.nombre»''', '''Este es el body «from.nombre», «from.nombre», «from.nombre», «from.nombre».''')
		from.enviarMail(mail)
	}
	
	def static Usuario crearUsuario(String nombre){
		new Usuario(nombre, nombre)
	}
	
}