#christbaum.asm
#Gibt einen Christbaum aus

.data

	OG: .byte 0
	pl: .asciiz "*   "
	ll: .asciiz "  "
	nl: .asciiz "\n"

.text
main:

	li $v0, 5
	syscall
	sb $v0, OG					#Liesst Obergrenze ein
	
	add $t0, $zero, $zero		#$t0 = i = 0
	
	lb $t2, OG					#leadt Obergrenze auf $t2
	addi $t1, $t2, 0 			#$t1 = 0 + 10 (Obergrenze)
	addi $t6, $zero, 1			#Setzt $t6 auf 1
	la $t4, ($t2)				#Setzt $t4 auf $t2 fuer die Verwendung als ueberprufungschleife weil $t4 nicht abgezogen werden soll
for1:
	bge $t0, $t1, endfor1 		#ueberprueft ob $t0 kleiner ist als $t1, $t0 wird immer hinauf gezeahlt
	la $t7, ($t2)				
								#leadt den Wert von $t2 auf $t7, damit es danach reinitalisiert werden kann
	
		for2:
			ble $t2, $zero, endfor2 #ueberprueft ob $t2 kleinergleich 0 ist
			
				la $a0, ll			#gibt leerzeichen aus aus
				la $v0, 4
				syscall
				
				sub $t2, $t2, $t6
		
			j for2
		endfor2:
		
		addi $t0, $t0, 1
		
		for3:
			bge $t3, $t0, endfor3
			
			la $a0, pl			#gibt Punkte aus aus
			la $v0, 4
			syscall
			
			addi $t3, $t3, 1
				
			j for3
		endfor3:	
		subi $t0, $t0, 1
		la $t3, ($zero)
		
	
	
		la $t2, ($t7)			#reinitalisiert $t2 mit dem vorherigen Wert

		sub $t2, $t2, $t6 		#Zieht von Wert 1 ab
		addi $t0, $t0, 1
				
		la $a0, nl
		la $v0, 4				#gibt neue Zeile aus
		syscall
		
	
	j for1	
endfor1:

li $v0, 10					#Exit Routine
	syscall

