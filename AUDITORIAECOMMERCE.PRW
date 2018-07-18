#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "FWMVCDEF.CH"
#INCLUDE "FWMBROWSE.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "TOPCONN.CH"

/*/{Protheus.doc} AuditoriaEcommerce
	Classe Auditoria do E-commerce
@type class 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
class AuditoriaEcommerce from LongClassName

    data oBrowse    As Object
    
    data aRotina 	As Array

    data cModelOrc  As String
    data cModelPv   As String
    data cModelMI   As String
    data cModelDV   As String
    data cModelIPv  As String
    data cModelFin  As String
    data cModelNFS  As String

    data cViewOrc   As String
    data cViewPV    As String 
    data cViewDV    As String
    data cViewMI    As String
    data cViewIPV   As String
    data cViewFin   As String
    data cViewNFS   As String

    data oModel     As Object
    data oView      As Object

    data oStrOrc    As Object
    data oStrDV     As Object
    data oStrMI     As Object
    data oStrPV     As Object
    data oStrIPV    As Object
    data oStrFin    As Object
    data oStrNFS    As Object

    data oStruOrc   As Object
    data oStruPV    As Object
    data oStruMI    As Object
    data oStruDV    As Object
    data oStruIPV   As Object
    data oStruFin   As Object
    data oStruNFS   As Object

    method New() constructor
    method Browse()
    method Menu()
    method Model()
    method View()

    method Commit()
    method Cancel()
    method Pre()
    method Pos()

    method LoadField()
    method LoadStruct()

    method AddField()
    method LegendSC5()
    method LegendSE1()
    method LegendNF()
    method LegendSD3()
    method LegendSF1()
    
    method ShowSF1()
    method ShowSF2()
    method ShowSB2()
    method ShowSE1()

endclass

/*/{Protheus.doc} New
	construtor da classe
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method new() class AuditoriaEcommerce

	::aRotina 	 := {}
    ::oBrowse    := nil

    ::cModelOrc := 'M_ORC' 
    ::cModelPv  := 'M_GRID_PV' 
    ::cModelMI  := 'M_GRID_DV'
    ::cModelDV  := 'M_GRID_MI'
    ::cModelIPv := 'M_GRID_IPV' 
    ::cModelFin := 'M_GRID_FIN'
    ::cModelNFS := 'M_GRID_NFS'

    ::cViewOrc  := 'VIEW_ORC' 
    ::cViewPV   := 'VIEW_PV' 
    ::cViewDV   := 'VIEW_DV' 
    ::cViewMI   := 'VIEW_MI' 
    ::cViewIPV  := 'VIEW_IPV' 
    ::cViewFin  := 'VIEW_FIN' 
    ::cViewNFS  := 'VIEW_NFS'

    ::oModel     := nil
    ::oView      := nil

    ::LoadStruct()

return

/*/{Protheus.doc} Browse
	metodo para criacao do browse
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method Browse() class AuditoriaEcommerce

    ::oBrowse := FWMBrowse():new()

    ::oBrowse:SetAlias( 'SL1' )
    ::oBrowse:SetDescription( 'Monitor de Integracao' )

    ::oBrowse:AddLegend( "SL1->L1_XCODSTA == '005'"	, "BR_CANCEL "      , "Cancelado"               ) 
	::oBrowse:AddLegend( "SL1->L1_XCODSTA == '006'"	, "BR_PINK"         , "Aguardando Pagamento"    ) 
	::oBrowse:AddLegend( "SL1->L1_XCODSTA == '007'"	, "BR_VERDE"        , "Pagamento Confirmado"    ) 
    ::oBrowse:AddLegend( "SL1->L1_XCODSTA == '017'"	, "PRECO.PNG"	    , "Concluido com Sucesso"   )
    ::oBrowse:AddLegend( "SL1->L1_XCODSTA == '900'"	, "BR_ROXO"         , "Bloqueado por Estoque"   )
    ::oBrowse:AddLegend( "SL1->L1_XCODSTA == '901'"	, "BR_AMARELO"      , "Pedido Liberado"         )
    ::oBrowse:AddLegend( "Empty( SL1->L1_XCODSTA )"	, "BR_PRETO"        , "Regra Antiga"            )

    ::oBrowse:Activate()

return

/*/{Protheus.doc} Menu
	metodo para criacao do menu
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method Menu() class AuditoriaEcommerce

	ADD OPTION ::aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.EDSEQ012' OPERATION MODEL_OPERATION_VIEW	 	ACCESS 0

    ADD OPTION ::aRotina TITLE "Saldo Sequoia "      ACTION "U_EDSEQ001()" OPERATION MODEL_OPERATION_VIEW	 	ACCESS 0
    ADD OPTION ::aRotina TITLE "Retorno Expedicao"   ACTION "U_EDSEQ002()" OPERATION MODEL_OPERATION_VIEW	 	ACCESS 0
    ADD OPTION ::aRotina TITLE "Enviar Binario"      ACTION "U_EDSEQ003()" OPERATION MODEL_OPERATION_VIEW	 	ACCESS 0
    ADD OPTION ::aRotina TITLE "Enviar O.R."         ACTION "U_EDSEQ004()" OPERATION MODEL_OPERATION_VIEW	 	ACCESS 0
    ADD OPTION ::aRotina TITLE "Entrada Merc."       ACTION "U_EDSEQ005()" OPERATION MODEL_OPERATION_VIEW	 	ACCESS 0
    ADD OPTION ::aRotina TITLE "Ret. Checkin"        ACTION "U_EDSEQ006()" OPERATION MODEL_OPERATION_VIEW	 	ACCESS 0
    ADD OPTION ::aRotina TITLE "Ret. CheckOut"       ACTION "U_EDSEQ007()" OPERATION MODEL_OPERATION_VIEW	 	ACCESS 0
    ADD OPTION ::aRotina TITLE "Excluir Pedido"      ACTION "U_EDSEQ008()" OPERATION MODEL_OPERATION_VIEW	 	ACCESS 0
    ADD OPTION ::aRotina TITLE "Fat. Manual"         ACTION "U_EDSEQ009()" OPERATION MODEL_OPERATION_VIEW	 	ACCESS 0
    ADD OPTION ::aRotina TITLE "Enviar PV"           ACTION "U_EDSEQ010()" OPERATION MODEL_OPERATION_VIEW	 	ACCESS 0

return ::aRotina

/*/{Protheus.doc} Model
	metodo para criacao da model
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method Model() class AuditoriaEcommerce

    //Validacoes do modelo
	Local bPreValidacao := { |oMdl| ::Pre( oMdl ) 	 } 
	Local bPosValidacao	:= { |oMdl| ::Pos( oMdl )    }
	Local bCommit 		:= { |oMdl| ::Commit( oMdl ) }	
	Local bCancel 		:= { |oMdl| ::Cancel( oMdl ) } 


   	::oModel := MPFormModel():New(   "MODELMVC"  ,  bPreValidacao	,; 
												    bPosValidacao	,; 
												    bCommit		    ,; 
												    bCancel		    )  

    //------------------------+
    // Field Dados da Venda   |
    //------------------------+
    ::oModel:AddFields( ::cModelOrc ,/*cOwner*/   , ::oStruOrc )
    ::oModel:GetModel( ::cModelOrc ):SetDescription( "Dados da Venda" )
    ::oModel:SetPrimaryKey( {"L1_XNUMECO"} )
    
    //-------------------------------+
    // Grid Pedidos de vendas e itens|
    //-------------------------------+
    ::oModel:AddGrid(  ::cModelPv   , ::cModelOrc  , ::oStruPV )
    
    ::oModel:SetRelation( ::cModelPv , { { "C5_NUMECO" , "L1_XNUMECO" } }, ("SC5")->( 'C5_EMISSAO') )
    
    ::oModel:GetModel( ::cModelPv  ):SetDescription("Pedidos de Vendas")
    ::oModel:GetModel( ::cModelPv  ):SetOptional(.T.)
    ::oModel:GetModel( ::cModelPv  ):SetNoInsertLine(.F.)
    ::oModel:GetModel( ::cModelPv  ):SetNoDeleteLine(.F.)
    ::oModel:GetModel( ::cModelPv  ):SetUniqueLine({"C5_FILIAL","C5_NUM"})
    
    ::oModel:AddGrid(  ::cModelIPv  , ::cModelPv   , ::oStruIPV  )
    
    ::oModel:SetRelation( ::cModelIPv  ,{{"C6_FILIAL","C5_FILIAL"},{"C6_NUM","C5_NUM"}},("SC6")->(IndexKey(1)))

    ::oModel:GetModel( ::cModelIPv  ):SetDescription("Itens Pedido de Vendas")
    ::oModel:GetModel( ::cModelIPv  ):SetOptional(.T.)
    ::oModel:GetModel( ::cModelIPv  ):SetNoInsertLine(.F.)
    ::oModel:GetModel( ::cModelIPv  ):SetNoDeleteLine(.F.)
    ::oModel:GetModel( ::cModelIPv  ):SetUniqueLine({"C6_ITEM"})

    //----------------------------------+
    // Grid Devolucoes de vendas        |
    //----------------------------------+
    ::oModel:AddGrid(  ::cModelDV   , ::cModelOrc  , ::oStruDV   )
    
    ::oModel:SetRelation( ::cModelDV , { { "F1_XNUMECO" , "L1_XNUMECO" } } , ("SF1")->( 'F1_EMISSAO' ) )
    
    ::oModel:GetModel( ::cModelDV  ):SetDescription("Devolucoes de vendas")
    ::oModel:GetModel( ::cModelDV  ):SetOptional(.T.)
    ::oModel:GetModel( ::cModelDV  ):SetNoInsertLine(.F.)
    ::oModel:GetModel( ::cModelDV  ):SetNoDeleteLine(.F.)
    ::oModel:GetModel( ::cModelDV  ):SetUniqueLine({"F1_FILIAL","F1_DOC","F1_SERIE","F1_FORNECE","F1_LOJA"})
    
    //------------------------+
    // Grid Financeiro        |
    //------------------------+
    ::oModel:AddGrid(  ::cModelFin   , ::cModelOrc  , ::oStruFin   )

    ::oModel:SetRelation( ::cModelFin   , { {"E1_NUMECO","L1_XNUMECO"} },("SE1")->(IndexKey(1)))

    ::oModel:GetModel( ::cModelFin  ):SetDescription("Titulos Contas a Receber")
    ::oModel:GetModel( ::cModelFin  ):SetOptional(.T.)
    ::oModel:GetModel( ::cModelFin  ):SetNoInsertLine(.F.)
    ::oModel:GetModel( ::cModelFin  ):SetNoDeleteLine(.F.)
    ::oModel:GetModel( ::cModelFin  ):SetUniqueLine({"E1_FILIAL","E1_PREFIXO","E1_NUM","E1_PARCELA","E1_TIPO"})

    //--------------------------------+
    // Grid Movimentos Internos       |
    //--------------------------------+
    ::oModel:AddGrid(  ::cModelMI   , ::cModelOrc  , ::oStruMI  )

    ::oModel:SetRelation( ::cModelMI   , { {"D3_XNUMECO","L1_XNUMECO"} },("SD3")->( 'D3_EMISSAO' ) )

    ::oModel:GetModel( ::cModelMI  ):SetDescription("Movimentacoes Internas")
    ::oModel:GetModel( ::cModelMI  ):SetOptional(.T.)
    ::oModel:GetModel( ::cModelMI  ):SetNoInsertLine(.F.)
    ::oModel:GetModel( ::cModelMI  ):SetNoDeleteLine(.F.)

return ::oModel

/*/{Protheus.doc} View
	metodo para criacao da View
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method View() class AuditoriaEcommerce

    ::oView := FwFormView():new()

    ::oView:SetModel( FWLoadModel("EDSEQ012")  )

    //-------------------------------+
    // Definicao do layout da tela   |
    //-------------------------------+
    ::oView:CreateVerticalBox( 'ESQUERDA' , 60   )
    ::oView:CreateVerticalBox( 'DIREITA'  , 40   )

    ::oView:CreateHorizontalBox( 'ESUPERIOR' , 20 , 'ESQUERDA' )
    ::oView:CreateHorizontalBox( 'EMEIO'     , 40 , 'ESQUERDA' )
    ::oView:CreateHorizontalBox( 'EINFERIOR' , 40 , 'ESQUERDA' )

    ::oView:CreateHorizontalBox( 'DSUPERIOR' , 33 , 'DIREITA' )
    ::oView:CreateHorizontalBox( 'DMEIO'     , 33 , 'DIREITA' )
    ::oView:CreateHorizontalBox( 'DINFERIOR' , 33 , 'DIREITA' )


    //------------------------+
    // Field Dados da Venda   |
    //------------------------+
    ::oView:AddField(         ::cViewOrc      , ::oStrOrc         , ::cModelOrc   )
    ::oView:SetOwnerView(     ::cViewOrc      , "ESUPERIOR"		                )
    ::oView:EnableTitleView(  ::cViewOrc      , "Dados da Venda"	                )
    
    //-------------------------------+
    // Grid Pedidos de vendas e itens|
    //-------------------------------+
    ::oView:AddGrid(          ::cViewPV       , ::oStrPV          , ::cModelPv    )
	::oView:SetOwnerView(     ::cViewPV       , "EMEIO"                           )
	::oView:EnableTitleView(  ::cViewPV       , 'Pedidos de Vendas'               )
	
	::oView:SetViewProperty( ::cViewPV , 'GRIDDOUBLECLICK' , {{||  Processa( {|oFormulario , cFieldName , nLineGrid| ::ShowSF2(oFormulario , cFieldName , nLineGrid ) } , "Carregando..." ) }} )
	
	::oView:AddGrid(          ::cViewIPV      , ::oStrIPV         , ::cModelIPv   )
    ::oView:SetOwnerView(     ::cViewIPV      , "EINFERIOR"                       )
	::oView:EnableTitleView(  ::cViewIPV      , 'Itens Pedidos de Vendas'         )
	
	::oView:SetViewProperty( ::cViewIPV , 'GRIDDOUBLECLICK' , {{||  Processa( {|oFormulario , cFieldName , nLineGrid| ::ShowSB2(oFormulario , cFieldName , nLineGrid ) } , "Carregando..." ) }} )

    //--------------------------------------+
    // Grid Devolucoes de vendas            |
    //--------------------------------------+
    ::oView:AddGrid(          ::cViewDV       , ::oStrDV          , ::cModelDV    )
	::oView:SetOwnerView(     ::cViewDV       , "DSUPERIOR"                       )
    ::oView:EnableTitleView(  ::cViewDV       , 'Devolucoes'                      )
    
    ::oView:SetViewProperty( ::cViewDV , 'GRIDDOUBLECLICK' , {{||  Processa( {|oFormulario , cFieldName , nLineGrid| ::ShowSF1(oFormulario , cFieldName , nLineGrid ) } , "Carregando..." ) }} )
    
    //------------------------+
    // Grid Financeiro        |
    //------------------------+
    ::oView:AddGrid(          ::cViewFin      , ::oStrFin         , ::cModelFin   )
    ::oView:SetOwnerView(     ::cViewFin      , 'DMEIO'                           )
    ::oView:EnableTitleView(  ::cViewFin      , 'Titulos Contas a Receber'        )
    
    ::oView:SetViewProperty( ::cViewFin , 'GRIDDOUBLECLICK' , {{||  Processa( {|oFormulario , cFieldName , nLineGrid| ::ShowSE1(oFormulario , cFieldName , nLineGrid ) } , "Carregando..." ) }} )

    //---------------------------------+
    // Grid Movimentos Internos        |
    //---------------------------------+
    ::oView:AddGrid(          ::cViewMI      , ::oStrMI         , ::cModelMI      )
    ::oView:SetOwnerView(     ::cViewMI      , 'DINFERIOR'                        )
    ::oView:EnableTitleView(  ::cViewMI      , 'Movimentacoes Internas'           )
     
    //------------------+
    // Adicionar botoes |
    //------------------+
    ::oView:AddUserButton( "Saldo Sequoia "    , "CLIPS"	, {|| ( EDSEQ001()  )    } , '' , , { MODEL_OPERATION_VIEW } )
    ::oView:AddUserButton( "Retorno Expedicao" , "CLIPS"	, {|| ( EDSEQ002()  )    } , '' , , { MODEL_OPERATION_VIEW } )
    ::oView:AddUserButton( "Enviar Binario"    , "CLIPS"	, {|| ( EDSEQ003()  )    } , '' , , { MODEL_OPERATION_VIEW } )
    ::oView:AddUserButton( "Enviar O.R."       , "CLIPS"	, {|| ( EDSEQ004()  )    } , '' , , { MODEL_OPERATION_VIEW } )
    ::oView:AddUserButton( "Entrada Merc."     , "CLIPS"	, {|| ( EDSEQ005()  )    } , '' , , { MODEL_OPERATION_VIEW } )
    ::oView:AddUserButton( "Ret. Checkin"      , "CLIPS"	, {|| ( EDSEQ006()  )    } , '' , , { MODEL_OPERATION_VIEW } )
    ::oView:AddUserButton( "Ret. CheckOut"     , "CLIPS"	, {|| ( EDSEQ007()  )    } , '' , , { MODEL_OPERATION_VIEW } )
    ::oView:AddUserButton( "Excluir Pedido"    , "CLIPS"	, {|| ( EDSEQ008()  )    } , '' , , { MODEL_OPERATION_VIEW } )
    ::oView:AddUserButton( "Fat. Manual"       , "CLIPS"	, {|| ( EDSEQ009()  )    } , '' , , { MODEL_OPERATION_VIEW } )
    ::oView:AddUserButton( "Enviar PV"         , "CLIPS"	, {|| ( EDSEQ010()  )    } , '' , , { MODEL_OPERATION_VIEW } )

    //--------------------------------------+
    // Mensagem para carregamento da tela   |
    //--------------------------------------+
	::oView:SetProgressBar(.T.)

return ::oView

/*/{Protheus.doc} Commit
	metodo para tratamento do botao confirmar
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method Commit( oModel ) class AuditoriaEcommerce

    Local lRet := .F.
	
	lRet := FwFormCommit( oModel )

return lRet

/*/{Protheus.doc} Cancel
	metodo para tratamento do botao cancelar
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method Cancel( oModel ) class AuditoriaEcommerce

    Local lRet := .F.
	
	lRet := FwFormCancel( oModel )

return lRet

/*/{Protheus.doc} Pre
	metodo para tratamento da pre validacao
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method Pre( oModel ) class AuditoriaEcommerce

    Local lRet := .T.
	
return lRet

/*/{Protheus.doc} Pos
	metodo para tratamento da pos validacao
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method Pos( oModel ) class AuditoriaEcommerce

    Local lRet := .T.
	
return lRet

/*/{Protheus.doc} LoadField
	metodo para carregar os campos da estrutura
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method LoadField( nType , aField , cTable ) class AuditoriaEcommerce

	Local oStr   := nil

	oStr := FWFormStruct( nType , cTable , { |cCampo| iif( ( aScan( aField , Alltrim(cCampo) ) > 0 ),.T.,.F.) })

return oStr

/*/{Protheus.doc} LoadStruct
	metodo para filtrar os campos utilizados na estrutura
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method LoadStruct() class AuditoriaEcommerce

    Local aField := {}
    
    aField	    := 	{ 	 "L1_FILIAL"    ,;
                         "L1_NUM"       ,;
                         "L1_CLIENTE"   ,;
                         "L1_LOJA"      ,;
                         "L1_VLRTOT"    ,;
                         "L1_DESCONT"   ,;
                         "L1_VLRLIQ"    ,;
                         "L1_DOC"       ,;
                         "L1_SERIE"     ,;
                         "L1_VALBRUT"   ,;
                         "L1_VALMERC"   ,;
                         "L1_EMISSAO"   ,;
                         "L1_HORA"      ,;
                         "L1_ENDENT"    ,;
                         "L1_BAIRROE"   ,;
                         "L1_CEPE"      ,;
                         "L1_MUNE"      ,;
                         "L1_ESTE"      ,;
                         "L1_FRETE"     ,;
                         "L1_PEDRES"    ,;
                         "L1_XESCOLA"   ,;
                         "L1_XMATRIC"   ,;
                         "L1_XRESPON"   ,;
                         "L1_XIDRESP"   ,;
                         "L1_XNOMEAL"   ,;
                         "L1_XANOLET"   ,;
                         "L1_XIDORIG"   ,;
                         "L1_XTICKET"   ,;
                         "L1_XCELULA"   ,;
                         "L1_XCODSTA"   ,;
                         "L1_XDDD01"    ,;
                         "L1_XDDDCEL"   ,;
                         "L1_XDESTAT"   ,;
                         "L1_XMTCANC"   ,;
                         "L1_XNOMDES"   ,;
                         "L1_XNUMECL"   ,;
                         "L1_XNUMECO"   ,;
                         "L1_XOBSECO"   ,;
                         "L1_XTEL01"    ,;
                         "L1_XVLBXPV"   ,;
                         "L1_XDOCREM"   ,;
                         "L1_XSERIRE"   ,;
                         "L1_XNFEREM"   ,;
                         "L1_XFILNFR"   }

    ::oStruOrc    := ::LoadField( 1 , aField , 'SL1'  )
    ::oStrOrc     := ::LoadField( 2 , aField , 'SL1'  )

    aField	    := 	{ 	 "C5_FILIAL"       ,;
                         "C5_NUM"          ,;
                         "C5_NUMECO"       ,;
						 "C5_NOTA"         ,;
                         "C5_SERIE"        ,;
                         "C5_CLIENTE"      ,;
                         "C5_LOJACLI"      ,;
                         "C5_EMISSAO"      ,;
                         "C5_MENNOTA"      ,;
                         "C5_ORCRES"       ,;
                         "C5_XMATRIC"      ,;
                         "C5_XRESPON"      ,;
                         "C5_XESCOLA"      ,;
                         "C5_XNFEDEV"      ,;
                         "C5_XSERDEV"      ,;
                         "C5_XIDRESP"      ,;
                         "C5_XNOMEAL"      ,;
                         "C5_XANOLET"      ,;
                         "C5_XIDORIG"      ,;
                         "C5_XTICKET"      ,;
                         "C5_NUMECLI"      ,;
                         "C5_XNOME"        ,;
                         "C5_XEMAIL"       ,;
                         "C5_XSQORDR"      ,;
                         "C5_XSQHASH"      ,;
                         "C5_XSQPEDV"      ,;
                         "C5_XNUMEST"      ,;
                         "C5_XSQFLUX"      ,;
                         "C5_XHORAEN"      ,;
                         "C5_XTESMOV"      ,;
                         "C5_XSQCLAS"      ,;
                         "C5_XARMDES"      }

    
    ::oStruPV    := ::LoadField( 1 , aField , 'SC5'  )
    ::oStrPV     := ::LoadField( 2 , aField , 'SC5'  )
    
    ::AddField( 'NF?'  , ::oStruPV , ::oStrPV , {|| ::LegendNF( SC5->C5_NOTA ) } , '@BMP'   )
    ::AddField( 'Tipo' , ::oStruPV , ::oStrPV , {|| ::LegendSC5(SC5->C5_FILIAL , SC5->C5_NUM , SC5->C5_NUMECO) } , '@BMP'    )
        
    aField	    := 	{ 	 "C6_FILIAL"       ,;
                         "C6_ITEM"         ,;
                         "C6_PRODUTO"      ,;
                         "C6_UM"           ,;
                         "C6_QTDVEN"       ,;
                         "C6_PRCVEN"       ,;
                         "C6_VALOR"        ,;
                         "C6_LOCAL"        ,;
						 "C6_TES"          ,;
                         "C6_NUM"          ,;
                         "C6_VALDESC"      ,;
                         "C6_NOTA"         ,;
                         "C6_SERIE"        ,;
                         "C6_DESCRI"       ,;
                         "C6_NFORI"        ,;
                         "C6_SERIORI"      ,;
                         "C6_ITEMORI"      ,;
                         "C6_XPACOTE"      ,;
                         "C6_XSUBPCT"      }

    ::oStruIPV := ::LoadField( 1 , aField  , "SC6" )
    ::oStrIPV  := ::LoadField( 2 , aField  , "SC6" )

    aField	    := 	{ 	 "E1_FILIAL"       ,;
                         "E1_PREFIXO"      ,;
                         "E1_NUM"          ,;
                         "E1_PARCELA"      ,;
                         "E1_TIPO"         ,;
                         "E1_CLIENTE"      ,;
                         "E1_LOJA"         ,;
                         "E1_NOMCLI"       ,;
                         "E1_EMISSAO"      ,;
						 "E1_VENCTO"       ,;
                         "E1_VENCREA"      ,;
                         "E1_VALOR"        ,;
                         "E1_SALDO"        ,;
                         "E1_BAIXA"        }

    ::oStruFin := ::LoadField( 1 , aField , 'SE1' )
    ::oStrFin  := ::LoadField( 2 , aField , 'SE1' )
    
    ::AddField( 'Baixado?' ,  ::oStruFin , ::oStrFin , {|| ::LegendSE1(SE1->E1_BAIXA , SE1->E1_SALDO, SE1->E1_VALOR  ) } , '@BMP'  )
    

    aField	    := 	{ 	 "D3_FILIAL"       ,;
                         "D3_TM"           ,;
                         "D3_DOC"          ,;
                         "D3_XNUMECO"      ,;
                         "D3_UM"           ,;
                         "D3_QUANT"        ,;
                         "D3_LOCAL"        ,;
                         "D3_EMISSAO"      ,;
                         "D3_CUSTO1"       ,;
                         "D3_USUARIO"      ,;
						 "D3_COD"          }

    ::oStruMI := ::LoadField( 1 , aField , 'SD3'   )
    ::oStrMI  := ::LoadField( 2 , aField , 'SD3'   )
    
    ::AddField( 'Tipo' ,  ::oStruMI , ::oStrMI , {|| ::LegendSD3( SD3->D3_TM ) } , '@BMP'  )

    aField	    := 	{ 	 "F1_FILIAL"     ,;
                         "F1_DOC"        ,;
                         "F1_SERIE"      ,;
                         "F1_FORNECE"    ,;
                         "F1_LOJA"       ,;
                         "F1_XNUMECO"    ,;
                         "F1_EMISSAO"    }

    ::oStruDV := ::LoadField( 1 , aField , 'SF1'   )
    ::oStrDV  := ::LoadField( 2 , aField , 'SF1'   )
    
    ::AddField( 'Tipo'  , ::oStruDV 	, ::oStrDV , {|| ::LegendSF1( SF1->F1_FILIAL , SF1->F1_DOC , SF1->F1_SERIE , SF1->F1_FORNECE , SF1->F1_LOJA , 1 ) } , '@BMP'   )
    ::AddField( 'TES'   , ::oStruDV    , ::oStrDV  , {|| ::LegendSF1( SF1->F1_FILIAL , SF1->F1_DOC , SF1->F1_SERIE , SF1->F1_FORNECE , SF1->F1_LOJA , 2 ) } , '@9'     )

return

/*/{Protheus.doc} AddField
	metodo para adicionar campos caracter aos grids.
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method AddField( cTitle , oStrModel , oStrView , bInit , cPicture  ) class AuditoriaEcommerce

	//------------------------+
	// Adiciona campo na Model |
	//------------------------+
	oStrModel:AddField( cTitle	,;	// 	cTitulo
    					cTitle 	,;	// 	cTooltip
    					cTitle 	,;  // 	cIdField
    					'C' 	,;  // 	cTipo
    					15		,;  //	nTamanho
    					0		,;	//	nDecimal
    					Nil		,;	//	bValid
    					Nil		,;	//	bWhen
    					Nil		,;	//	aValues
    					Nil		,;	//	lObrigat
    					bInit 	,;	//	bInit
    					Nil		,;	//	lKey
    					Nil		,; 	//	lNoUpd
    					.T. 	)	//	lVirtual
    					
    //------------------------+
    // Adiciona campo na View |
    //------------------------+
    oStrView:AddField( 	cTitle 		,; 	//	cIdField	
   						'01'		,;	// 	cOrdem	
   						cTitle		,;	// 	cTitulo
   						cTitle		,;	// 	cDescric
   						{ cTitle }	,;	// 	aHelp
   						'C'			,;	// 	cType
   						cPicture	,;	// 	cPicture
   						Nil			,;	// 	bPictVar
   						''			,;	// 	cLookUp
   						.F.			,;	// 	lCanChange
   						Nil			,;	// 	cFolder
   						Nil			,;	// 	cGroup
   						Nil			,;	// 	aComboValues
   						Nil			,;	// 	nMaxLenCombo
   						Nil			,;	// 	cIniBrow
   						.T.			,;	// 	lVirtual
   						Nil			,;	// 	cPictVar
   						Nil 		,;	// 	lInsertLine
   						Nil			)	// 	nWidth
	
return

/*/{Protheus.doc} LegendSC5
	metodo para adicionar a legenda para o grid SC5
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method LegendSC5( xFilial , xNum , xNumEco ) class AuditoriaEcommerce
	
	Local cRet 		:= 'DBG09.PNG'
	Local xAlias 	:= GetNextAlias()
	Local cSql 		:= ''
	
	cSql	:= " SELECT					" 
	cSql	+= " 	TOP 1 C6_TES		" 
	cSql	+= " FROM					" 
	cSql	+= " 	SC6010				" 
	cSql	+= " WHERE					" 
	cSql	+= " 		D_E_L_E_T_ 	= ''					" 
	cSql	+= " 	AND C6_FILIAL 	= '" + xFilial + "'		" 
	cSql	+= " 	AND C6_NUM 		= '" + xNum + "'		" 
	
	TcQuery cSql New Alias (xAlias)
		
	If !(xAlias)->( Eof() )
	
		Do Case
			Case (xAlias)->C6_TES == '501' .or. (xAlias)->C6_TES == '502'  //Venda
				cRet := 'PRECO.PNG'
			Case (xAlias)->C6_TES == '522' //Retorno de mercadoria
				cRet := 'PMSSETAESQ.PNG'
			Case (xAlias)->C6_TES == '510' //Simples remessa
				cRet := 'PMSSETADIR.PNG'
			Case (xAlias)->C6_TES == '511' //Remessa de terceiro
				cRet := 'TMSIMG16.PNG'
			Case (xAlias)->C6_TES == '512' //Armazenagem
				cRet := 'QDOIMG16.PNG'
		EndCase
		 
	EndIf
	
	(xAlias)->( DbCloseArea() )
			
return cRet 

/*/{Protheus.doc} LegendSE1
	metodo para adicionar a legenda para o grid SE1
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method LegendSE1( xBaixa , xSaldo , xValor ) class AuditoriaEcommerce
	
	Local cRet := 'DBG09.PNG'
	
	
	If xSaldo == 0 
		cRet := 'BR_VERMELHO'
	Else
		
		If xValor == xSaldo
			cRet := 'BR_VERDE'
		Else
			cRet := 'BR_AZUL' 
		EndIf
		
	EndIf

return cRet 

/*/{Protheus.doc} LegendNF
	metodo para adicionar a legenda para o grid SC5
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR 
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method LegendNF( xNF ) class AuditoriaEcommerce
	
	Local cRet := 'DBG09.PNG'
	
	
	If Empty( xNF )
		cRet := 'CANCEL.PNG' 
	Else
		cRet := 'OK.PNG'		
	EndIf

return cRet 

/*/{Protheus.doc} LegendSD3
	metodo para adicionar a legenda para o grid SD3
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR 
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method LegendSD3( xTm ) class AuditoriaEcommerce
	
	Local cRet := 'DBG09.PNG'
	
	If xTm <= '500'
		cRet := 'MAIS.PNG' 
	Else
		cRet := 'MENOS.PNG'		
	EndIf

return cRet 


/*/{Protheus.doc} LegendSF1
	metodo para adicionar a legenda para o grid SF1
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR 
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method LegendSF1( xFilial , xDoc , xSerie , xFornece , xLoja , xTipo ) class AuditoriaEcommerce
	
	Local cRet 		:= 'DBG09.PNG'
	Local xAlias 	:= GetNextAlias()
	Local cSql 		:= ''
	
	cSql	:= " SELECT					" 
	cSql	+= " 	TOP 1 D1_TES		" 
	cSql	+= " FROM					" 
	cSql	+= " 	SD1010				" 
	cSql	+= " WHERE					" 
	cSql	+= " 		D_E_L_E_T_ 	= ''						" 
	cSql	+= " 	AND D1_FILIAL 	= '" + xFilial 	+ "'		" 
	cSql	+= " 	AND D1_DOC 		= '" + xDoc 	+ "'		"
	cSql	+= " 	AND D1_SERIE 	= '" + xSerie 	+ "'		"
	cSql	+= " 	AND D1_FORNECE 	= '" + xFornece + "'		"
	cSql	+= " 	AND D1_LOJA 	= '" + xLoja 	+ "'		" 
	
	TcQuery cSql New Alias (xAlias)
		
	If !(xAlias)->( Eof() )
	
		If xTipo == 2
			cRet := (xAlias)->D1_TES
		Else
			Do Case
				Case (xAlias)->D1_TES == '019' //retorno de terceiro
					cRet := 'DEVOLNF.PNG'
				Case (xAlias)->D1_TES == '031' //Retorno de armazenagem
					cRet := 'WMSIMG32.PNG'
			EndCase 
		EndIf
			 
	EndIf
	
	(xAlias)->( DbCloseArea() )
			
return cRet 

/*/{Protheus.doc} ShowSF1
	metodo para apresentar o documento de entrada
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR 
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method ShowSF1( oFormulario , cFieldName , nLineGrid ) class AuditoriaEcommerce
	
	Local oModel 	:= FwModelActive()
	Local xFilial 	:= oModel:GetModel( ::cModelDV ):GetValue( 'F1_FILIAL' 	)
	Local cDoc 		:= oModel:GetModel( ::cModelDV ):GetValue( 'F1_DOC' 	)
	Local cSerie 	:= oModel:GetModel( ::cModelDV ):GetValue( 'F1_SERIE' 	)
	Local cFornece 	:= oModel:GetModel( ::cModelDV ):GetValue( 'F1_FORNECE' )
	Local cLoja 	:= oModel:GetModel( ::cModelDV ):GetValue( 'F1_LOJA' 	)
	Local cFilBkp	:= cFilAnt 
	
	Private aRotina	:= aClone( ::aRotina )

	DbSelectArea( 'SF1' )
	SF1->( DbSetOrder( 1 ) )
	If SF1->( DbSeek( xFilial + cDoc + cSerie + cFornece + cLoja ))
	
		cFilAnt := xFilial
		
		aRotina[2][1] := '&Visualizar'
		aRotina[2][2] := 'A103NFiscal' 
		aRotina[2][4] := 2 
		
		A103NFiscal( 'SF1' , SF1->( Recno() ) , 2 )
		
		iif( ValType( oFormulario ) == 'O' , oFormulario:oControl:Refresh() , nil )
		
		cFilAnt := cFilBkp
		
	EndIf

return .T.

/*/{Protheus.doc} ShowSF2
	metodo para apresentar o documento de saida
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method ShowSF2( oFormulario , cFieldName , nLineGrid ) class AuditoriaEcommerce
	
	Local oModel 	:= FwModelActive()
	Local xFilial 	:= oModel:GetModel( ::cModelPV ):GetValue( 'C5_FILIAL' 		)
	Local cDoc 		:= oModel:GetModel( ::cModelPV ):GetValue( 'C5_NOTA' 		)
	Local cSerie 	:= oModel:GetModel( ::cModelPV ):GetValue( 'C5_SERIE' 		)
	Local cFornece 	:= oModel:GetModel( ::cModelPV ):GetValue( 'C5_CLIENTE' 	)
	Local cLoja 	:= oModel:GetModel( ::cModelPV ):GetValue( 'C5_LOJACLI' 	)
	Local cFilBkp	:= cFilAnt 
	
	DbSelectArea( 'SF2' )
	SF2->( DbSetOrder( 1 ) )
	If SF2->( DbSeek( xFilial + cDoc + cSerie + cFornece + cLoja ))
	
		cFilAnt := xFilial
		
		Mc090Visual( 'SF2' , SF2->( RecNo() ) , 1 )
		
		iif( ValType( oFormulario ) == 'O' , oFormulario:oControl:Refresh() , nil )
		
		cFilAnt := cFilBkp
		
	EndIf

return .T.

/*/{Protheus.doc} ShowSB2
	metodo para apresentar o saldo dos produtos
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR 
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method ShowSB2( oFormulario , cFieldName , nLineGrid ) class AuditoriaEcommerce

	Local oModel 	:= FwModelActive()
	Local cCodigo	:= oModel:GetModel( ::cModelIPv ):GetValue( 'C6_PRODUTO' )
	Local cFilBkp   := cFilAnt 
	
	If FwModeAccess( 'SB1' ) == 'E'
		cFilAnt := SB1->B1_FILIAL
	EndIf
	
	MaViewSB2( cCodigo )
	
	cFilAnt := cFilBkp
	
return .T.

/*/{Protheus.doc} ShowSB2
	metodo para apresentar os titulos da SE1
@type method 
@author Ruann Carlos
@since  18/07/2018
@version 1.0
@country Brasil
@database   18/07/2018
@language PT-BR
@see ''
@obs 18/07/2018 - Controle de documentação
/*/
method ShowSE1( oFormulario , cFieldName , nLineGrid ) class AuditoriaEcommerce

	Local oModel 	:= FwModelActive()
	Local xFilial	:= oModel:GetModel( ::cModelFin ):GetValue( 'E1_FILIAL'  )
	Local cPrefixo	:= oModel:GetModel( ::cModelFin ):GetValue( 'E1_PREFIXO' )
	Local cNum		:= oModel:GetModel( ::cModelFin ):GetValue( 'E1_NUM' 	 )
	Local cParcela	:= oModel:GetModel( ::cModelFin ):GetValue( 'E1_PARCELA' )
	Local cTipo		:= oModel:GetModel( ::cModelFin ):GetValue( 'E1_TIPO'    )
	Local cFilBkp   := cFilAnt 
	
	Private cCadastro := 'Contas a Receber' 
	
	DbSelectArea( 'SE1' )
	SE1->( DbSetOrder( 1 ) )
	If SE1->( DbSeek( xFilial + cPrefixo + cNum + cParcela + cTipo ))
	
		cFilAnt := xFilial
		
		AxVisual( 'SE1' , SE1->( RecNo() ) , 2 )
		
		iif( ValType( oFormulario ) == 'O' , oFormulario:oControl:Refresh() , nil )
		
		cFilAnt := cFilBkp
		
	EndIf
	
return .T.
