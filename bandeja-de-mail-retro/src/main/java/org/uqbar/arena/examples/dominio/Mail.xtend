package org.uqbar.arena.examples.dominio

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class Mail {
	
	Usuario from
	Usuario to
	String subject
	String body

	new() {
	}
	
	new (Usuario from, Usuario to, String subject, String body){
		this.from = from
		this.to = to
		this.subject = subject
		this.body = body
	}
	
	
}