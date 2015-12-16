package org.uqbar.arena.examples.dominio.appModel

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.examples.dominio.Usuario
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AutenticadorAppModel {
	List<Usuario> usuariosRegistrados = newArrayList
	
	String usuario
	String password

	String resultadoLogin
	Usuario usuarioEncontrado
	
	def Boolean autenticar(){
		this.usuarioEncontrado = obtenerUsuario(usuario)
		if(usuarioEncontrado != null && usuarioEncontrado.passwordCorrecta(password)){
			return true
		}
		
		if(usuarioEncontrado == null){
			resultadoLogin = "Usuario no encontrado"
		} else {
			resultadoLogin = "Contraseña incorrecta"
		}
		
		return false
	}
	
	def Usuario obtenerUsuario(String nombre) {
		usuariosRegistrados.findFirst[it.nombre == nombre]
	}
	
	
}