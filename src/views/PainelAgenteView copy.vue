<template id="teste">
<div>
    <Navbar/>
<div class="body">
  
    <div id="app" >

     <div id="neo-contentbox" style="
    margin-top: -28%;
">
        <div id="neo-contentbox-maincolumn">
            <input type="hidden" id="_framework_module_id" value="agent_console">
            <input type="hidden" id="_framework_webCommon" value="libs/">
            <div class="neo-module-content">




                <!-- Viene del tpl menu.tlp-->

                <div id="callcenter-info-message" class="ui-state-highlight ui-corner-all"
                    style="display: none;">
                    <p>
                        <span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
                        <span id="callcenter-info-message-text"></span>
                    </p>
                </div>
                <div id="callcenter-error-message" class="ui-state-error ui-corner-all" style="display: none;">
                    <p>
                        <span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                        <span id="callcenter-error-message-text"></span>
                    </p>

                    &gt;
                </div>
                <div id="callcenter-area-principal">
                  
                    <div id="callcenter-titulo-consola" class="moduleTitle">&nbsp;
                      
                        <h1> <img src="../assets/agent.png" style="width: 34px;  "><b style="color: black;">  Agent/201 - Eren</b></h1> 
  
                    </div>
                    
                    <br>
                    
                    <hr style="border-top: 2px solid black">
                    <br>
                    <div id="callcenter-wrap">

                        <div id="callcenter-controles">
                            <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">


                           

                            <button id="botao1"
                                class="callcenter-boton-activo ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
                                role="button" disabled=""><span class="ui-button-text"><img src="https://pic.onlinewebfonts.com/svg/img_347389.png" style="width: 15px;"> Hangup</span></button>
                            <button id="botao2" 
                                class="callcenter-boton-break ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
                                role="button"><span class="ui-button-text"> <img src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-pause-512.png" style="width: 15px;"> Break</span></button>
                            <button id="botao3"
                                class="callcenter-boton-activo ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
                                role="button" disabled=""><span class="ui-button-text"><img src="https://cdn-icons-png.flaticon.com/512/876/876784.png" style="width: 15px;">Transfer</span></button>
                            <button id="botao4" disabled=""
                                class="ui-button ui-widget ui-state-default ui-corner-all ui-button-disabled ui-state-disabled ui-button-text-only"
                                role="button"><span class="ui-button-text"><img src="https://cdn.icon-icons.com/icons2/2248/PNG/512/calendar_month_icon_137828.png" style="width: 15px;"> Schedule call</span></button>
                            <button id="botao5"
                                class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-button-disabled ui-state-disabled"
                                role="button" disabled=""><span class="ui-button-text"><img src="https://pic.onlinewebfonts.com/svg/img_490006.png" style="width: 15px"> Save data</span></button>
                            







                            <router-link to="/loginAgente"><button id="botao6"
                                class="callcenter-boton-activo ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
                                role="button"><span class="ui-button-text"> End session</span></button></router-link>
                            
                        </div>
                       <img src="../assets/plugbranco.png" style="width: 6%;margin-left: 94%;margin-top: 2%; visibility: hidden"> 
                        <br>
                        <br>
                        <div id="callcenter-contenido">
                            <div id="callcenter-cejillas-contenido"
                                class="ui-tabs ui-widget ui-widget-content ui-corner-all">
                                <div id="callcenter-estado-agente" class="callcenter-class-estado-ocioso">
                                    <div id="callcenter-estado-agente-texto">Sem chamadas ativas</div>
                                    <div id="callcenter-cronometro">00:00:00</div>
                                </div>
                                    
                                <div id="callcenter-llamada-paneles" aria-labelledby="ui-id-2"
                                    class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-layout-container"
                                    role="tabpanel" aria-hidden="false" style="overflow: hidden;">
                                    <div id="callcenter-llamada-paneles-izq"
                                        class="ui-layout-west ui-layout-pane ui-layout-pane-west ui-layout-container"
                                        style="position: absolute; margin: 0px; inset: 0px auto 0px 0px; height: 457px; z-index: 0; width: 300px; display: block; visibility: visible; overflow: hidden;">
                                        <div class="ui-layout-center ui-layout-pane ui-layout-pane-center"
                                        style="position: absolute;margin: 0px;/* margin-right: 2px; */inset: 0px 0px 0px 306px;height: 457px;z-index: 0;display: block;visibility: visible;">
                                            <fieldset class="ui-widget-content ui-corner-all">
                                                <legend><b style="color: black">Informações</b></legend>
                                                <div id="callcenter-llamada-info"></div>
                                            </fieldset>
                                        </div>
                                        <div class="ui-layout-south ui-layout-pane ui-layout-pane-south"
                                            style="position: absolute; margin: 0px; inset: auto 0px 0px; width: auto; z-index: 0; height: 250px; display: block; visibility: visible;">
                                            <fieldset class="">
                                                <legend><b style="color: black;">Script</b></legend>
                                                <div id="callcenter-llamada-script" style="background-color: #f9f9f999;"></div>
                                            </fieldset>
                                        </div>
                                        <div id=""
                                            class="ui-layout-resizer ui-layout-resizer-south ui-draggable-handle ui-layout-resizer-open ui-layout-resizer-south-open"
                                            title="Resize"
                                            style="position: absolute; padding: 0px; margin: 0px; font-size: 1px; text-align: left; overflow: hidden; z-index: 2; cursor: s-resize; bottom: 250px; width: 300px; height: 6px; left: 0px;">
                                            <div id=""
                                                class="ui-layout-toggler ui-layout-toggler-south ui-layout-toggler-open ui-layout-toggler-south-open"
                                                title="Close"
                                                style="position: absolute; display: block; padding: 0px; margin: 0px; overflow: hidden; text-align: center; font-size: 1px; cursor: pointer; z-index: 1; visibility: visible; width: 48px; height: 6px; left: 125px; top: 0px;">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ui-layout-center ui-layout-pane ui-layout-pane-center" id="linha"
                                        style="position: absolute;margin: 0px;inset: 0px 0px 0px 306px;height: 457px;z-index: 0;display: block;visibility: visible;">
                                        <fieldset class="ui-widget-content ui-corner-all">
                                            <legend><b style="color: black">Formulários</b></legend>
                                            <div id="callcenter-llamada-form"></div>
                                        </fieldset>
                                    </div>
                                    <div id=""
                                        class="ui-layout-resizer ui-layout-resizer-west ui-draggable-handle ui-layout-resizer-open ui-layout-resizer-west-open"
                                        title="Resize"
                                        style="position: absolute; padding: 0px; margin: 0px; font-size: 1px; text-align: left; overflow: hidden;  cursor: w-resize; left: 300px; height: 457px; width: 6px; top: 0px;">
                                        <div id=""
                                            class="ui-layout-toggler ui-layout-toggler-west ui-layout-toggler-open ui-layout-toggler-west-open"
                                            title="Close"
                                            style="position: absolute; display: block; padding: 0px; margin: 0px; overflow: hidden; text-align: center; font-size: 1px; cursor: pointer;  visibility: visible; height: 48px; width: 6px; top: 203px; left: 0px;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



            </div>
        </div>
        
    </div>


    </div>
    
  </div>
  
  <br>
  <Footer /> 
 
</div>

</template>

<script>
import Navbar from "../components/Navbar";
import Footer from "../components/footer.vue";
import { api } from '@/conf/api'
  export default {
    name: "HelloView",
	async beforeMount (){
    let a = await api.get('/listaramais')
    console.log(a.data.dados)
    this.dados = a.data.dados
  },
components: {
        Navbar,
        Footer,
      },
  }

</script>

<style scoped>


    .body{
      
    display: flex;
    padding: 17%;
    margin-bottom: 10%;
    background-repeat: repeat;
    background-size: 113%;
    background-position: left;
    background-position-x: right;
    }
    #teste{
      background-image: url("../assets/atendente.jpg")  !important;
      background-size: 113%;
    }

    #callcenter-area-principal {
    position: relative;
    left: 0;
    right: 0;
    margin-left: -20%;
    margin-right: -20%;
    padding: 0;
}
    #linha{
        position: absolute;
        margin: 0px;
        height: 380%;
        width: 100%;
        
        display: block;
        visibility: visible;
    }
    .callcenter-boton-break {
        height: 23px;
        padding-bottom: 8px;
    }
    .ui-state-default {
        
        background: linear-gradient(#ffffff, #bdbdbd);
        color: rgb(0, 0, 0);
        top: -4px;
        height: 380%;
        border-radius: 5px;
    }

    #callcenter-llamada-paneles-izq{
        width: 100%;
    }
    
    div.neo-module-content *, div.neo-module-content *::before, div.neo-module-content *::after {
        box-sizing :initial;
    }
    #callcenter-wrap {
    position: relative;
    height: 0%;
    }
    #callcenter-wrap {
    position: relative;
    height: 0%;
    BORDER-RADIUS: 15PX;
    margin-top: -30px;
    BACKGROUND-COLOR: #243e57;
    }
    .ui-state-default{
        padding: 0.4em 1em;
        background: linear-gradient(#ffffff, #dddddd);
        color: rgb(0, 0, 0);
        height: 17px;
        border-radius: 5px;
  
    }
    .ui-layout-pane-center{

        position: absolute;
        margin: 0px;
        height: 457px;
        width: 100%;
        display: block;
        visibility: visible;
    }
    
    #callcenter-titulo-consola {
	position: relative;
    left: 0;
    right: 0;
    top: -10px;
    width: 100%;
    height: 18pt;
    padding: 0 0 0 0;
}

#callcenter-estado-agente {
    position: relative;
    left: 0;
    width: 100%;
    height: 35px;
    border-radius: 1px;
    padding: 0 0 0 0;
    font-size: 1.3em;
    color: #FFFFFF;
    font-weight: bold;
}

#callcenter-estado-agente-texto {
    position: absolute;
    top: 7px;
    left: 20px;
    padding: 0;
}

#callcenter-cronometro {
    position: absolute;
    top: 7px;
    right: 20px;
    padding: 0;
    /*esse aqui*/
}

.callcenter-class-estado-ocioso {
  background: linear-gradient(#243e57, #5572b5);
    
}
.callcenter-class-estado-esperando {
  background: linear-gradient(#512457, #b61493);
}
.callcenter-class-estado-activo {
  background: linear-gradient(#24572b, #3da733);
}
.callcenter-class-estado-break {
  background: linear-gradient(#572424, #e41f1f);
}

td.callcenter-class-estado-esperando,
td.callcenter-class-estado-activo {
    background-image: none;
    color: #ffffff;
}

#callcenter-wrap {
    position: relative;
    height: 0%;
}

#callcenter-controles {
    position: absolute;
    padding: 3pt;
    left: 6px;
    top: -3px;
    right: 0;
    height: 22pt;
    display: table;
}
.popup {
    position: relative;
    display: inline-block;
    cursor: pointer;
  }
  
  /* The actual popup (appears on top) */
  .popup .popuptext {
    visibility: hidden;
    width: 160px;
    background-color: #555;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 8px 0;
    position: absolute;
    
    bottom: 125%;
    left: 50%;
    margin-left: -80px;
  }
  
#callcenter-contenido {
    position: absolute;
    padding: 0;
    height: 391%;
    left: 0;
    right: 0;
    bottom: 0;
    top: 47pt;
}

#callcenter-cejillas-contenido {
    position: absolute;
    left: 0;
    top: 3px;
    right: 0;
    bottom: 23px;
    padding: 0;
    overflow: auto;
}

#callcenter-cejillas-contenido label {
    font-weight: bold;
}

.callcenter-barra-llamada {
    padding: 0;
    display: inline-block;
}

.callcenter-boton-activo {
/*
    width: 95pt;
    height: 30pt;
*/
}
.ui-state-default {
    padding: 0.4em 1em;
    background: linear-gradient(#ffffff, #bdbdbd);
    color: rgb(0, 0, 0);
    height: 17px;
    border-radius: 5px;
}
.ui-button-text-only .ui-button-text {
    padding: 0.4em 2em;
}
.callcenter-boton-activo {
    height: 17px;
}
.callcenter-boton-break {
    height: 19px;
}


.callcenter-boton-break {
/*
    width: 95pt;
    height: 30pt;
    background-color:#094895;
*/
}
.callcenter-boton-unbreak {
/*
    width: 95pt;
    height: 30pt;
    background-color:#BD0000;
*/
}

#callcenter-llamada-paneles {
    position: relative;
    height: 92%;
    padding: 0;
}
#callcenter-llamada-paneles > div {
    position: relative;
}
#callcenter-llamada-paneles > div fieldset {
    margin: 0;
    padding-top: 1.25em;
    padding-bottom: 0.5em;
    padding-left: 0.5em;
    padding-right: 0.5em;
}
#callcenter-llamada-paneles > div#callcenter-llamada-paneles-izq  > div
{

}
#callcenter-llamada-paneles-izq{
        position: absolute;
    margin: 0px;
    /* margin-right: 2px; */
    inset: 0px 0px 0px 306px;
    height: 457px;
    width: 100%;
    z-index: 0;
    display: block;
    visibility: visible;
}

#callcenter-llamada-paneles > div > fieldset,
#callcenter-llamada-paneles > div#callcenter-llamada-paneles-izq  > div > fieldset{
    overflow: auto;
    position: absolute;
    top: 0.25em;
    bottom: 0.5em;
    left: 0.5em;
    right: 0.5em;
}

#callcenter-llamada-paneles > div > fieldset > div,
#callcenter-llamada-paneles > div#callcenter-llamada-paneles-izq  > div > fieldset > div {
    overflow: auto;
    position: absolute;
    top: 1.25em;
    bottom: 0.5em;
    left: 0.5em;
    right: 0.5em;
}
 .ui-layout-pane { /* all 'panes' */
    /*
        background:	#FFF;
        border:		1px solid #BBB;
        padding:	10px;
        overflow:	auto;
    */
        /* DO NOT add scrolling (or padding) to 'panes' that have a content-div,
           otherwise you may get double-scrollbars - on the pane AND on the content-div
           - use ui-layout-wrapper class if pane has a content-div
           - use ui-layout-container if pane has an inner-layout
        */
        }
        /* (scrolling) content-div inside pane allows for fixed header(s) and/or footer(s) */
        .ui-layout-content {
            padding:	10px;
            position:	relative; /* contain floated or positioned elements */
            overflow:	auto; /* add scrolling to content-div */
        }
    
    /*
     *	UTILITY CLASSES
     *	Must come AFTER pane-class above so will override
     *	These classes are NOT auto-generated and are NOT used by Layout
     */
    .layout-child-container,
    .layout-content-container {
        padding:	0;
        overflow:	hidden;
    }
    .layout-child-container {
        border:		0; /* remove border because inner-layout-panes probably have borders */
    }
    .layout-scroll {
        overflow:	auto;
    }
    .layout-hide {
        display:	none;
    }
    #btn_enviarChamada{
        padding: .4em 1em;
        background: linear-gradient(#02b712, #a3ffb1);
        color: white;
        height: 20px;
        border-radius: 5px;
    
    
    }
    #btn_enviarChamada:hover{
        padding: .4em 1em;
        background: linear-gradient(#a3ffb1,#02b712, #00ff15);
        color: white;
        
    
    
    }
    #btn_lifeSize{
        padding: .4em 1em;
        background: linear-gradient(#dcdafd, #8d8ab4);
        color: rgb(0, 0, 0);
        border-radius: 5px;
        height: 18px;
    }
    
    #btn_lifeSize:hover{
        padding: .4em 1em;
        background: linear-gradient(#fdfdfd, #9f9be7, #322ca0);
    }
    
    /*
     *	RESIZER-BARS
     */
    .ui-layout-resizer	{ /* all 'resizer-bars' */
        background:		#DDD;
        border:			1px solid #BBB;
        border-width:	0;
        }
        .ui-layout-resizer-drag {		/* REAL resizer while resize in progress */
        }
        .ui-layout-resizer-hover	{	/* affects both open and closed states */
        }
        /* NOTE: It looks best when 'hover' and 'dragging' are set to the same color,
            otherwise color shifts while dragging when bar can't keep up with mouse */
        .ui-layout-resizer-open-hover ,	/* hover-color to 'resize' */
        .ui-layout-resizer-dragging {	/* resizer beging 'dragging' */
            background: #C4E1A4;
        }
        .ui-layout-resizer-dragging {	/* CLONED resizer being dragged */
            border: 	 1px solid #BBB;
        }
        .ui-layout-resizer-north-dragging,
        .ui-layout-resizer-south-dragging {
            border-width:	1px 0;
        }
        .ui-layout-resizer-west-dragging,
        .ui-layout-resizer-east-dragging {
            border-width:	0 1px;
        }
        /* NOTE: Add a 'dragging-limit' color to provide visual feedback when resizer hits min/max size limits */
        .ui-layout-resizer-dragging-limit {	/* CLONED resizer at min or max size-limit */
            background: #E1A4A4; /* red */
        }
    
        .ui-layout-resizer-closed-hover	{ /* hover-color to 'slide open' */
            background: #EBD5AA;
        }
        .ui-layout-resizer-sliding {	/* resizer when pane is 'slid open' */
            opacity: .10; /* show only a slight shadow */
            filter:  alpha(opacity=10);
            }
            .ui-layout-resizer-sliding-hover {	/* sliding resizer - hover */
                opacity: 1.00; /* on-hover, show the resizer-bar normally */
                filter:  alpha(opacity=100);
            }
            /* sliding resizer - add 'outside-border' to resizer on-hover
             * this sample illustrates how to target specific panes and states */
            .ui-layout-resizer-north-sliding-hover	{ border-bottom-width:	1px; }
            .ui-layout-resizer-south-sliding-hover	{ border-top-width:		1px; }
            .ui-layout-resizer-west-sliding-hover	{ border-right-width:	1px; }
            .ui-layout-resizer-east-sliding-hover	{ border-left-width:	1px; }
    
    /*
     *	TOGGLER-BUTTONS
     */

        .ui-layout-resizer-hover .ui-layout-toggler {
            opacity: .60;
            filter:  alpha(opacity=60);
        }
        .ui-state-default:hover {
          padding: 0.4em 1em;
          background: linear-gradient(#c9dcff, #5aa7d3);
          color: rgb(black);
          height: 17px;
          border-radius: 5px;
          
        }
        #botao2:hover{
          padding: 0.5em 1em;
          background: linear-gradient(#c9dcff, #5aa7d3);
          color: rgb(black);
          height: 17px;
          border-radius: 5px;

        }
    
        .ui-layout-toggler-hover , /* need when NOT resizable */
        .ui-layout-resizer-hover .ui-layout-toggler-hover { /* need specificity when IS resizable */
            background-color: #FC6;
            opacity: 1.00;
            filter:  alpha(opacity=100);
        }
        .ui-layout-toggler-north ,
        .ui-layout-toggler-south {
            border-width: 0 1px; /* left/right borders */
        }
        .ui-layout-toggler-west ,
        .ui-layout-toggler-east {
            border-width: 1px 0; /* top/bottom borders */
        }
        /* hide the toggler-button when the pane is 'slid open' */
        .ui-layout-resizer-sliding  .ui-layout-toggler {
            display: none;
        }
        /*
         *	style the text we put INSIDE the togglers
         */
        .ui-layout-toggler .content {
            color:			#666;
            
            font-weight:	bold;
            width:			100%;
            padding-bottom:	0.35ex; /* to 'vertically center' text inside text-span */
        }
    
    /*
     *	PANE-MASKS
     *	these styles are hard-coded on mask elems, but are also
     *	included here as !important to ensure will overrides any generic styles
     */
    .ui-layout-mask {
        border:		none !important;
        padding:	0 !important;
        margin:		0 !important;
        overflow:	hidden !important;
        position:	absolute !important;
        opacity:	0 !important;
        filter:		Alpha(Opacity="0") !important;
    }

    .ui-layout-mask-inside-pane { /* masks always inside pane EXCEPT when pane is an iframe */
        top:		0 !important;
        left:		0 !important;
        width:		100% !important;
        height:		100% !important;
    }
    div.ui-layout-mask {}		/* standard mask for iframes */
    iframe.ui-layout-mask {}	/* extra mask for objects/applets */
    
    /*
     *	Default printing styles
     */
    @media print {
        /*
         *	Unless you want to print the layout as it appears onscreen,
         *	these html/body styles are needed to allow the content to 'flow'
         */
        html {
            height:		auto !important;
            overflow:	visible !important;
        }

        .ui-layout-resizer, .ui-layout-toggler {
            display:	none !important;
        }
        /*
         *	Default pane print styles disables positioning, borders and backgrounds.
         *	You can modify these styles however it suit your needs.
         */
        .ui-layout-pane {
            border:		none !important;
            background:	 transparent !important;
            position:	relative !important;
            top:		auto !important;
            bottom:		auto !important;
            left:		auto !important;
            right:		auto !important;
            width:		auto !important;
            height:		auto !important;
            overflow:	visible !important;
        }
    }
/*
    *,
*:before,
*:after {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
*/
html {
  
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}


a {
  color: #373e4a;
  text-decoration: none;
}
a:hover,
a:focus {
  color: #818da2;
}
a:focus {
  outline: thin dotted #333;
  outline: 5px auto -webkit-focus-ring-color;
  outline-offset: -2px;
}
img {
  vertical-align: middle;
}
.img-responsive {
  display: block;
  max-width: 100%;
  height: auto;
}
.img-rounded {
  border-radius: 3px;
}

.img-circle {
  border-radius: 50%;
}
hr {
  margin-top: 17px;
  margin-bottom: 17px;
  border: 0;
  border-top: 1px solid #eeeeee;
}
.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  margin: -1px;
  padding: 0;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}
figure {
  margin: 0;
}
p {
  margin: 0 0 8.5px;
  
}
.lead {
  margin-bottom: 17px;
  font-size: 13px;
  font-weight: 200;
  line-height: 1.4;
}
@media (min-width: 768px) {
  .lead {
    font-size: 18px;
  }
}
small,
.small {
  font-size: 85%;
}
cite {
  font-style: normal;
}
.text-left {
  text-align: left;
}
.text-right {
  text-align: right;
}
.text-center {
  text-align: center;
}
.text-justify {
  text-align: justify;
}
.text-muted {
  color: #999999;
}
.text-primary {
  color: #949494;
}
a.text-primary:hover {
  color: #7b7b7b;
}
.text-success {
  color: #045702;
}
a.text-success:hover {
  color: #022501;
}
.text-info {
  color: #2c7ea1;
}
a.text-info:hover {
  color: #215f79;
}
.text-warning {
  color: #574802;
}
a.text-warning:hover {
  color: #251f01;
}
.text-danger {
  color: #ac1818;
}
a.text-danger:hover {
  color: #7f1212;
}
.bg-primary {
  color: #fff;
  background-color: #949494;
}
a.bg-primary:hover {
  background-color: #7b7b7b;
}
.bg-success {
  background-color: #bdedbc;
}
a.bg-success:hover {
  background-color: #95e294;
}
.bg-info {
  background-color: #c5e8f7;
}
a.bg-info:hover {
  background-color: #98d6f1;
}
.bg-warning {
  background-color: #ffefa4;
}
a.bg-warning:hover {
  background-color: #ffe671;
}
.bg-danger {
  background-color: #ffc9c9;
}
a.bg-danger:hover {
  background-color: #ff9696;
}

h1,
.h1 {
  font-size: 31px;
}
h2,
.h2 {
  font-size: 25px;
}
h3,
.h3 {
  font-size: 21px;
}
h4,
.h4 {
  font-size: 15px;
}
h5,
.h5 {
  font-size: 12px;
}
h6,
.h6 {
  font-size: 11px;
}
.bg-primary {
  color: #fff;
  background-color: #949494;
}
a.bg-primary:hover {
  background-color: #7b7b7b;
}
.bg-warning {
  background-color: #ffefa4;
}
a.bg-warning:hover {
  background-color: #ffe671;
}
.bg-danger {
  background-color: #ffc9c9;
}
a.bg-danger:hover {
  background-color: #ff9696;
}
.bg-success {
  background-color: #bdedbc;
}
a.bg-success:hover {
  background-color: #95e294;
}
.bg-info {
  background-color: #c5e8f7;
}
a.bg-info:hover {
  background-color: #98d6f1;
}
.page-header {
  padding-bottom: 7.5px;
  margin: 34px 0 17px;
  border-bottom: 1px solid #eeeeee;
}
ul,
ol {
  margin-top: 0;
  margin-bottom: 8.5px;
}
ul ul,
ol ul,
ul ol,
ol ol {
  margin-bottom: 0;
}
.list-unstyled {
  padding-left: 0;
  list-style: none;
}
.list-inline {
  padding-left: 0;
  list-style: none;
}
.list-inline > li {
  display: inline-block;
  padding-left: 5px;
  padding-right: 5px;
}
.list-inline > li:first-child {
  padding-left: 0;
}
dl {
  margin-bottom: 17px;
}
dt,
dd {
  line-height: 1.42857143;
}
dt {
  font-weight: bold;
}
dd {
  margin-left: 0;
}
@media (min-width: 768px) {
  .dl-horizontal dt {
    float: left;
    width: 160px;
    clear: left;
    text-align: right;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .dl-horizontal dd {
    margin-left: 180px;
  }
  .dl-horizontal dd:before,
  .dl-horizontal dd:after {
    content: " ";
    /* 1 */
    display: table;
    /* 2 */
  }
  .dl-horizontal dd:after {
    clear: both;
  }
}
abbr[title],
abbr[data-original-title] {
  cursor: help;
  border-bottom: 1px dotted #999999;
}
abbr.initialism {
  font-size: 90%;
  text-transform: uppercase;
}
blockquote {
  padding: 8.5px 17px;
  margin: 0 0 17px;
  border-left: 5px solid #eeeeee;
}
blockquote p {
  font-size: 15px;
  font-weight: 300;
  line-height: 1.25;
}
blockquote p:last-child {
  margin-bottom: 0;
}
blockquote small {
  display: block;
  line-height: 1.42857143;
  color: #999999;
}
blockquote small:before {
  content: '\2014 \00A0';
}
blockquote.pull-right {
  padding-right: 15px;
  padding-left: 0;
  border-right: 5px solid #eeeeee;
  border-left: 0;
}
blockquote.pull-right p,
blockquote.pull-right small,
blockquote.pull-right .small {
  text-align: right;
}
blockquote.pull-right small:before,
blockquote.pull-right .small:before {
  content: '';
}
blockquote.pull-right small:after,
blockquote.pull-right .small:after {
  content: '\00A0 \2014';
}
blockquote:before,
blockquote:after {
  content: "";
}
address {
  margin-bottom: 17px;
  font-style: normal;
  line-height: 1.42857143;
}
table {
  max-width: 100%;
  /* background-color: transparent; */
}
th {
  text-align: left;
  font-weight: 400;
  color: #303641;
}
.table {
  width: 100%;
  margin-bottom: 17px;
}
.table > thead > tr > th,
.table > tbody > tr > th,
.table > tfoot > tr > th,
.table > thead > tr > td,
.table > tbody > tr > td,
.table > tfoot > tr > td {
  padding: 8px;
  line-height: 1.42857143;
  vertical-align: top;
  border-top: 1px solid #ebebeb;
}
.table > thead > tr > th .progress,
.table > tbody > tr > th .progress,
.table > tfoot > tr > th .progress,
.table > thead > tr > td .progress,
.table > tbody > tr > td .progress,
.table > tfoot > tr > td .progress {
  margin-bottom: 0;
}
.table > thead > tr > th .label,
.table > tbody > tr > th .label,
.table > tfoot > tr > th .label,
.table > thead > tr > td .label,
.table > tbody > tr > td .label,
.table > tfoot > tr > td .label {
  margin-left: 5px;
  margin-right: 5px;
  padding-left: 10px;
  padding-right: 10px;
}
.table > thead > tr > th {
  vertical-align: bottom;
  border-bottom: 2px solid #ebebeb;
}
.table > caption + thead > tr:first-child > th,
.table > colgroup + thead > tr:first-child > th,
.table > thead:first-child > tr:first-child > th,
.table > caption + thead > tr:first-child > td,
.table > colgroup + thead > tr:first-child > td,
.table > thead:first-child > tr:first-child > td {
  border-top: 0;
}
.table > tbody + tbody {
  border-top: 2px solid #ebebeb;
}
.table .table {
  background-color: #ffffff;
}
.table-condensed > thead > tr > th,
.table-condensed > tbody > tr > th,
.table-condensed > tfoot > tr > th,
.table-condensed > thead > tr > td,
.table-condensed > tbody > tr > td,
.table-condensed > tfoot > tr > td {
  padding: 5px;
}
.table-bordered {
  border: 1px solid #ebebeb;
}
.table-bordered > thead > tr > th,
.table-bordered > tbody > tr > th,
.table-bordered > tfoot > tr > th,
.table-bordered > thead > tr > td,
.table-bordered > tbody > tr > td,
.table-bordered > tfoot > tr > td {
  border: 1px solid #ebebeb;
}
.table-bordered > thead > tr > th,
.table-bordered > thead > tr > td {
  background-color: #f5f5f6;
  border-bottom-width: 1px;
  color: #a6a7aa;
}
.table-bordered > tfoot > tr > th,
.table-bordered > tfoot > tr > td {
  background-color: #f5f5f6;
  border-top-width: 1px;
  color: #a6a7aa;
}
.table-striped > tbody > tr:nth-child(odd) > td,
.table-striped > tbody > tr:nth-child(odd) > th {
  background-color: #f8f8f8;
}
.table-hover > tbody > tr:hover > td,
.table-hover > tbody > tr:hover > th {
  background-color: #f2f2f4;
}
table col[class*="col-"] {
  float: none;
  display: table-column;
}
table td[class*="col-"],
table th[class*="col-"] {
  float: none;
  display: table-cell;
}
.table > thead > tr > td.active,
.table > tbody > tr > td.active,
.table > tfoot > tr > td.active,
.table > thead > tr > th.active,
.table > tbody > tr > th.active,
.table > tfoot > tr > th.active,
.table > thead > tr.active > td,
.table > tbody > tr.active > td,
.table > tfoot > tr.active > td,
.table > thead > tr.active > th,
.table > tbody > tr.active > th,
.table > tfoot > tr.active > th {
  background-color: #f2f2f4;
}
.table > thead > tr > td.active,
.table > tbody > tr > td.active,
.table > tfoot > tr > td.active,
.table > thead > tr > th.active,
.table > tbody > tr > th.active,
.table > tfoot > tr > th.active,
.table > thead > tr.active > td,
.table > tbody > tr.active > td,
.table > tfoot > tr.active > td,
.table > thead > tr.active > th,
.table > tbody > tr.active > th,
.table > tfoot > tr.active > th {
  background-color: #f2f2f4;
}
.table-hover > tbody > tr > td.active:hover,
.table-hover > tbody > tr > th.active:hover,
.table-hover > tbody > tr.active:hover > td,
.table-hover > tbody > tr.active:hover > th {
  background-color: #e5e5e8;
}
.table > thead > tr > td.success,
.table > tbody > tr > td.success,
.table > tfoot > tr > td.success,
.table > thead > tr > th.success,
.table > tbody > tr > th.success,
.table > tfoot > tr > th.success,
.table > thead > tr.success > td,
.table > tbody > tr.success > td,
.table > tfoot > tr.success > td,
.table > thead > tr.success > th,
.table > tbody > tr.success > th,
.table > tfoot > tr.success > th {
  background-color: #bdedbc;
}
.table-hover > tbody > tr > td.success:hover,
.table-hover > tbody > tr > th.success:hover,
.table-hover > tbody > tr.success:hover > td,
.table-hover > tbody > tr.success:hover > th {
  background-color: #a9e8a8;
}
.table > thead > tr > td.info,
.table > tbody > tr > td.info,
.table > tfoot > tr > td.info,
.table > thead > tr > th.info,
.table > tbody > tr > th.info,
.table > tfoot > tr > th.info,
.table > thead > tr.info > td,
.table > tbody > tr.info > td,
.table > tfoot > tr.info > td,
.table > thead > tr.info > th,
.table > tbody > tr.info > th,
.table > tfoot > tr.info > th {
  background-color: #c5e8f7;
}
.table-hover > tbody > tr > td.info:hover,
.table-hover > tbody > tr > th.info:hover,
.table-hover > tbody > tr.info:hover > td,
.table-hover > tbody > tr.info:hover > th {
  background-color: #afdff4;
}
.table > thead > tr > td.warning,
.table > tbody > tr > td.warning,
.table > tfoot > tr > td.warning,
.table > thead > tr > th.warning,
.table > tbody > tr > th.warning,
.table > tfoot > tr > th.warning,
.table > thead > tr.warning > td,
.table > tbody > tr.warning > td,
.table > tfoot > tr.warning > td,
.table > thead > tr.warning > th,
.table > tbody > tr.warning > th,
.table > tfoot > tr.warning > th {
  background-color: #ffefa4;
}
.table-hover > tbody > tr > td.warning:hover,
.table-hover > tbody > tr > th.warning:hover,
.table-hover > tbody > tr.warning:hover > td,
.table-hover > tbody > tr.warning:hover > th {
  background-color: #ffeb8a;
}
.table > thead > tr > td.danger,
.table > tbody > tr > td.danger,
.table > tfoot > tr > td.danger,
.table > thead > tr > th.danger,
.table > tbody > tr > th.danger,
.table > tfoot > tr > th.danger,
.table > thead > tr.danger > td,
.table > tbody > tr.danger > td,
.table > tfoot > tr.danger > td,
.table > thead > tr.danger > th,
.table > tbody > tr.danger > th,
.table > tfoot > tr.danger > th {
  background-color: #ffc9c9;
}
.table-hover > tbody > tr > td.danger:hover,
.table-hover > tbody > tr > th.danger:hover,
.table-hover > tbody > tr.danger:hover > td,
.table-hover > tbody > tr.danger:hover > th {
  background-color: #ffafaf;
}
@media (max-width: 767px) {
  .table-responsive {
    width: 100%;
    margin-bottom: 12.75px;
    overflow-y: hidden;
    overflow-x: scroll;
    -ms-overflow-style: -ms-autohiding-scrollbar;
    border: 1px solid #ebebeb;
    -webkit-overflow-scrolling: touch;
  }
  .table-responsive > .table {
    margin-bottom: 0;
  }
  .table-responsive > .table > thead > tr > th,
  .table-responsive > .table > tbody > tr > th,
  .table-responsive > .table > tfoot > tr > th,
  .table-responsive > .table > thead > tr > td,
  .table-responsive > .table > tbody > tr > td,
  .table-responsive > .table > tfoot > tr > td {
    white-space: nowrap;
  }
  .table-responsive > .table-bordered {
    border: 0;
  }
  .table-responsive > .table-bordered > thead > tr > th:first-child,
  .table-responsive > .table-bordered > tbody > tr > th:first-child,
  .table-responsive > .table-bordered > tfoot > tr > th:first-child,
  .table-responsive > .table-bordered > thead > tr > td:first-child,
  .table-responsive > .table-bordered > tbody > tr > td:first-child,
  .table-responsive > .table-bordered > tfoot > tr > td:first-child {
    border-left: 0;
  }
  .table-responsive > .table-bordered > thead > tr > th:last-child,
  .table-responsive > .table-bordered > tbody > tr > th:last-child,
  .table-responsive > .table-bordered > tfoot > tr > th:last-child,
  .table-responsive > .table-bordered > thead > tr > td:last-child,
  .table-responsive > .table-bordered > tbody > tr > td:last-child,
  .table-responsive > .table-bordered > tfoot > tr > td:last-child {
    border-right: 0;
  }
  .table-responsive > .table-bordered > tbody > tr:last-child > th,
  .table-responsive > .table-bordered > tfoot > tr:last-child > th,
  .table-responsive > .table-bordered > tbody > tr:last-child > td,
  .table-responsive > .table-bordered > tfoot > tr:last-child > td {
    border-bottom: 0;
  }
}
table > tbody > tr.highlight > td,
table > tbody > tr.highlight > th {
  background-color: #f1f2f400 !important;
  color: #303641;
}
.table > thead > tr > .middle-align,
.table > tbody > tr > .middle-align,
.table > tfoot > tr > .middle-align {
  vertical-align: middle;
}
fieldset {
  padding: 0;
  margin: 0;
  border: 0;
  min-width: 0;
}
legend {
  display: block;
  width: 100%;
  padding: 0;
  margin-bottom: 17px;
  font-size: 18px;
  line-height: inherit;
  color: #7d8086;
  border: 0;
  border-bottom: 1px solid #e5e5e5;
}
label {
  display: inline-block;
  margin-bottom: 5px;
}
input[type="search"] {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
input[type="radio"],
input[type="checkbox"] {
  margin: 4px 0 0;
  margin-top: 1px \9;
  /* IE8-9 */
  line-height: normal;
}
input[type="file"] {
  display: block;
}
input[type="range"] {
  display: block;
  width: 100%;
}
select[multiple],
select[size] {
  height: auto;
}
input[type="file"]:focus,
input[type="radio"]:focus,
input[type="checkbox"]:focus {
  outline: thin dotted #333;
  outline: 5px auto -webkit-focus-ring-color;
  outline-offset: -2px;
}
input[type="file"]:focus,
input[type="radio"]:focus,
input[type="checkbox"]:focus {
  outline: thin dotted #333;
  outline: 5px auto -webkit-focus-ring-color;
  outline-offset: -2px;
}
output {
  display: block;
  padding-top: 7px;
  font-size: 12px;
  line-height: 1.42857143;
  color: #555555;
}




  textarea.form-control1 {
    height: auto;
  }
  input[type="date"] {
    line-height: 31px;
  }
  .form-group {
    margin-bottom: 15px;
  }
  
  .radio,
  .checkbox {
    display: block;
    min-height: 17px;
    margin-top: 10px;
    margin-bottom: 10px;
    padding-left: 20px;
  }
  .radio label,
  .checkbox label {
    display: inline;
    font-weight: normal;
    cursor: pointer;
  }
  .radio input[type="radio"],
  .radio-inline input[type="radio"],
  .checkbox input[type="checkbox"],
  .checkbox-inline input[type="checkbox"] {
    float: left;
    margin-left: -20px;
    margin-top: 1px;
  }
  .radio + .radio,
  .checkbox + .checkbox {
    margin-top: -5px;
  }
  
  .radio-inline,
  .checkbox-inline {
    display: inline-block;
    padding-left: 20px;
    margin-bottom: 0;
    vertical-align: middle;
    font-weight: normal;
    cursor: pointer;
  }
  .radio-inline + .radio-inline,
  .checkbox-inline + .checkbox-inline {
    margin-top: 0;
    margin-left: 10px;
  }
  input[type="radio"][disabled],
  input[type="checkbox"][disabled],
  .radio[disabled],
  .radio-inline[disabled],
  .checkbox[disabled],
  .checkbox-inline[disabled],
  fieldset[disabled] input[type="radio"],
  fieldset[disabled] input[type="checkbox"],
  fieldset[disabled] .radio,
  fieldset[disabled] .radio-inline,
  fieldset[disabled] .checkbox,
  fieldset[disabled] .checkbox-inline {
    cursor: not-allowed;
  }





  .has-feedback {
    position: relative;
  }
  .has-feedback .form-control1 {
    padding-right: 38.75px;
  }
  .has-feedback .form-control1-feedback {
    position: absolute;
    top: 22px;
    right: 0;
    display: block;
    width: 31px;
    height: 31px;
    line-height: 31px;
    text-align: center;
  }
    .ui-widget-content {
    border: 1px solid #aaa;
    background: #ffffff;

    color: #222;
}
#callcenter-llamada-paneles > div > fieldset, #callcenter-llamada-paneles > div#callcenter-llamada-paneles-izq > div > fieldset {
    overflow: auto;
    position: absolute;
    top: 0.25em;
    bottom: 0.5em;
    left: 0.5em;
    right: 0.5em;
}
</style>

