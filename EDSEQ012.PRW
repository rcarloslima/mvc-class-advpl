#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "FWMVCDEF.CH"
#INCLUDE "FWMBROWSE.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "TOPCONN.CH"

static oRot := AuditoriaEcommerce():new()

/*/{Protheus.doc} EDSEQ012
	user function para chamada no menu do protheus
@type user function  
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
user function EDSEQ012()
return oRot:Browse()

/*/{Protheus.doc} MenuDef
	static funcion menudef
@type static function
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR 
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
static function MenuDef()
return oRot:Menu()

/*/{Protheus.doc} ModelDef
	static funcion ModelDef
@type static function
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
static function ModelDef()
return oRot:Model()

/*/{Protheus.doc} ViewDef
	static funcion ViewDef
@type static function
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
static function ViewDef()
return oRot:View()
