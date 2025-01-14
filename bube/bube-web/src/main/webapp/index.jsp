<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="head.jsp"%>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script>
	  document.addEventListener('DOMContentLoaded', function() {
		    var elems = document.querySelectorAll('.collapsible');
		    var instances = M.Collapsible.init(elems, {
		    	  accordion: false
		    });
		  });
	  $(document).ready(function(){
		    $('select').formSelect();
		  });

	  $(document).ready(function(){
		    $.get('${pageContext.request.contextPath}/ListarCompanias', function(companiasJson){
		    	$.each(companiasJson, function(index, compania) {
		    		$('#compania-linea').append($('<option>').val(compania.id).text(compania.nombre));
		    		$('select').formSelect();
		    		
			    });
			});
		    
		});
	</script>
	<%@include file="navbar.jsp"%>
	
	<div class="row">
		<div class="col s3">
			<%if(sesion.getAttribute("administrador") != null){ %>
			 <ul class="collapsible">
			    <li>
			      <div class="collapsible-header"><i class="teal-text material-icons">edit_location</i>Agregar Paradas</div>
			      <div class="collapsible-body">
			      	<div class="input-field col s12">
				      <input name = "nombre-parada" id="nombre-parada" type="text">
				      <label class="active" for="nombre-parada">Nombre parada</label>
				      <div class="right">
				      	<button id="btnAddParada" class="white-text orange darken-4 mdl-button mdl-js-button mdl-button--fab">
						  <i class="material-icons">control_point</i>
					  	</button>
				      </div>
				    </div>
			      </div>
			    </li>
			    <li>
			      <div class="collapsible-header"><i class="teal-text material-icons">map</i>Agregar Linea</div>
			      <div class="collapsible-body mh">
				  	<div class="input-field col s12">
				      <input name = "codigo-linea" id="codigo-linea" type="text">
				      <label class="active" for="codigo-linea">Codigo</label>
				    </div>
				    <div class="input-field col s12">
				    	<p>
					      <label>
					        <input id="desvio-linea" value="true" type="checkbox" />
					        <span>¿Desvío?</span>
					      </label>
					    </p>
				    </div>
				    <div class="input-field col s6">
				    	<input name = "origen-linea" id="origen-linea" type="text">
				      	<label class="active" for="origen-linea">Origen</label>
				    </div>
				    <div class="input-field col s6">
				    	<input name = "destino-linea" id="destino-linea" type="text">
				      	<label class="active" for="destino-linea">Destino</label>
				    </div>
				    <div class="input-field col s12">
					    <select id="compania-linea">
					      <option value="" disabled selected>Elegir compañia</option>
					    </select>
					    <label>Compañia</label>
				    </div>
				    <div class="input-field col s12">
				    	<div class="right">
				      	<button id="btnAddLinea" class="white-text orange darken-4 mdl-button mdl-js-button mdl-button--fab">
						  <i class="material-icons">control_point</i>
					  	</button>
				      </div>
				    </div>
			      </div>
			    </li>
			    <li>
			      <div class="collapsible-header"><i class="teal-text material-icons">location_off</i>Eliminar Paradas</div>
			      <div class="collapsible-body">
			      	<div class="input-field col s12">
					<p>Presion el botón y luego seleccione la parada que desea eliminar</p>
				      <div class="right">
				      	<button id="btnDeleteParada" class="white-text orange darken-4 mdl-button mdl-js-button mdl-button--fab">
						  <i class="material-icons">delete</i>
					  	</button>
				      </div>
				    </div>
			      </div>
			    </li>
			    <li>
			      <div class="collapsible-header"><i class="teal-text material-icons">timeline</i>Eliminar una línea</div>
			      <div class="collapsible-body">
			      	<div class="input-field col s12">
					<p>Presione el botón y luego seleccione el recorrido en el mapa para eliminar la línea de bus</p>
				      <div class="right">
				      	<button id="btnDeleteRecorrido" class="white-text orange darken-4 mdl-button mdl-js-button mdl-button--fab">
						  <i class="material-icons">delete</i>
					  	</button>
				      </div>
				    </div>
			      </div>
			    </li>				

		      	<!-- <span>Lorem ipsum dolor sit amet.</span>
		      	<button id="btnArea" class="mdl-button mdl-js-button mdl-button--fab mdl-button--colored">
				  <i class="material-icons">signal_cellular_null</i>
				</button>-->
			</ul>
			<%}else{%>
				<ul class="collapsible">
					<li>
						<div class="collapsible-header"><i class="teal-text material-icons">edit_location</i>Buscar Direccion</div>
							<div class="collapsible-body">
								<div class="input-field col s12">
									<input name = "dir_id" id="dirId" type="text">
									<label class="active" for="dir_id">Nombre de la calle</label>
								<div class="input-field col s12">
									<input name = "num_p" id ="numP" type="text"/> 
									<label class="active" for="num_p">Nro de puerta</label>
								</div>	 
								<div class="right">
									<button onclick="buscarDir()" class="white-text orange darken-4 mdl-button mdl-js-button mdl-button--fab">
										<i class="material-icons">search</i>
									</button> 
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="collapsible-header"><i class="teal-text material-icons">add</i>Buscar Intersección</div>
							<div class="collapsible-body">
								<div class="input-field col s12">
									<input name = "calle1" id="calle1" type="text">
									<label class="active" for="calle1">Nombre de la calle 1</label>
								<div class="input-field col s12">
									<input name = "calle2" id="calle2" type="text">
									<label class="active" for="calle2">Nombre de la calle 2</label>
								</div>	 
								<div class="right">
									<button onclick="buscarCruce()" class="white-text orange darken-4 mdl-button mdl-js-button mdl-button--fab">
										<i class="material-icons">search</i>
									</button> 
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="collapsible-header"><i class="teal-text material-icons">edit_location</i>Buscar un recorrido</div>
							<div class="collapsible-body">
								<div class="input-field col s12">
									<input name = "destino_s" id="destino" type="text">
									<label class="active" for="destino_s">Destino</label>
								<div class="input-field col s12">
									<input name = "nrolinea_s" id ="codigo" type="text"/> 
									<label class="active" for="nrolinea_s">Nro de linea</label>
								</div>	 
								<div class="right">
									<button onclick="buscarRecorrido()" class="white-text orange darken-4 mdl-button mdl-js-button mdl-button--fab">
										<i class="material-icons">search</i>
									</button> 
								</div>
							</div>
						</div>
					</li>	
					<li>
				      <div class="collapsible-header"><i class="teal-text material-icons">info</i>Información de Linea</div>
				      <div class="collapsible-body">
				      	<div class="input-field col s12">
						<div id="infoLinea">
							<p>Presione el botón y luego seleccione una recorrido en el mapa</p>
						</div>
					      <div class="right">
					      	<button id="btnInfoLinea" class="white-text orange darken-4 mdl-button mdl-js-button mdl-button--fab">
							  <i class="material-icons">info</i>
						  	</button>
					      </div>
					    </div>
				      </div>
				    </li>
					<li>
				      <div class="collapsible-header"><i class="teal-text material-icons">access_time</i>Horarios por parada</div>
				      <div class="collapsible-body">
				      	<div class="input-field col s12">
						<div id="infoLinea">
							<p>Presione el botón y luego seleccione una parada para ver los horarios</p>
						</div>
					      <div class="right">
					      	<button id="btnInfoLinea" class="white-text orange darken-4 mdl-button mdl-js-button mdl-button--fab">
							  <i class="material-icons">info</i>
						  	</button>
					      </div>
					    </div>
				      </div>
				    </li>
				    <li>
				      <div class="collapsible-header"><i class="teal-text material-icons">directions_bus</i>Ver lineas en una parada</div>
				      <div class="collapsible-body">
				      	<div class="input-field col s12">
						<div id="infoLinea">
							<p>Presione el botón y luego seleccione una parada para ver las lineas que pasan</p>
						</div>
					      <div class="right">
					      	<button id="btnInfoLinea" class="white-text orange darken-4 mdl-button mdl-js-button mdl-button--fab">
							  <i class="material-icons">info</i>
						  	</button>
					      </div>
					    </div>
				      </div>
				    </li>	
				</ul>		
			<%}%>
			
		

			
		</div>
    	<div class="col s9">
			<div id="map"></div>
		</div>

		
		<!-- <div>
			<input id="direccionId" type="text"/>
			<button onclick="buscarDireccion()" ></button>
		</div>  -->
		
			
		<!-- <div> 			
			<input name = "dir_id" id="dirId" type="text">
			<label class="active" for="dir_id">Nombre de la calle</label>									
		</div>

		<div>
			<input name = "num_p" id ="numP" type="text"/> 
			<label class="active" for="num_p">Nro de puerta</label>
			<button onclick="buscarDir()" ></button>dd
		</div> -->

			
		
		
	
    </div>
	
	
	<script type="text/javascript">

	var map;
	var coord;
	proj4.defs('EPSG:32721', '+proj=utm + zone=21 + south + datum=WGS84 + units=m + no_defs');
	//ol.proj.proj4.register(proj4);
	
	//var pronos = ol.proj.get('EPSG:32721');
	
	
	var formatWFS = new ol.format.WFS();

    var formatGML = new ol.format.GML3({
    	featureNS: 'busUy',
        featureType: 'parada',
        srsName: 'EPSG:32721'
    });

    var formatGML2 = new ol.format.GML3({
    	featureNS: 'busUy',
        featureType: 'linea',
        srsName: 'EPSG:32721'
    });

    var xs = new XMLSerializer();

	var sourceWFS = new ol.source.Vector({
	    loader: function (extent, resolution, projection) {
	        var url = "http://localhost:8080/geoserver/wfs?service=WFS"
	                + "&version=2.0.0&request=GetFeature"
	                + '&outputFormat=application/json'
	                + "&typename=busUy:departamento"
	                + "&format_options=callback:loadFeatures"
	                + '&srsname=EPSG:32721';
	        // use jsonp: false to prevent jQuery from adding the "callback"
	        $.ajax({url: url, dataType: 'jsonp', jsonp: false});
	    }
	});

	/**
	 * JSONP WFS callback function.
	 * @param {Object} response The response object.
	 */
	window.loadFeatures = function (response) {
		 sourceWFS.addFeatures(new ol.format.GeoJSON().readFeatures(response));
	};	

    var layerWFS = new ol.layer.Vector({
        visible: true,
    	source: sourceWFS
	});

    var layerWFS2 = new ol.layer.Vector({
        visible: true,
    	source: sourceWFS
	});

	var layers = [
	    new ol.layer.Image({
	        visible: true,
	        source: new ol.source.ImageWMS({
	            url: 'http://localhost:8080/geoserver/wms?',
	            params: {'LAYERS': 'busUy:Montevideo'},
	            serverType: 'geoserver',
	            crossOrigin: 'anonymous'
	        }),
	        opacity: 0.5
	    }),
	    new ol.layer.Vector({
	        visible: true,
	    	source: new ol.source.Vector({
	        	url: 'http://localhost:8080/geoserver/wfs?request=getFeature&typeName=busUy:parada&srs=EPSG:32721&outputFormat=application/json',
	        	format: new ol.format.GeoJSON()
	    	})
		}),
		 new ol.layer.Vector({
	        visible: true,
	    	source: new ol.source.Vector({
	        	url: 'http://localhost:8080/geoserver/wfs?request=getFeature&typeName=busUy:linea&srs=EPSG:32721&outputFormat=application/json',
	        	format: new ol.format.GeoJSON()
	    	})
		}),
	layerWFS    
	];	
	
	var interaction;
	
	var interactionSelectPointerMove = new ol.interaction.Select({
	    condition: ol.events.condition.pointerMove
	});
	
	var interactionSelect = new ol.interaction.Select({
	    style: new ol.style.Style({
	        stroke: new ol.style.Stroke({
	            color: '#FF2828'
	        })
	    })
	});
	
	var interactionSnap = new ol.interaction.Snap({
	    source: layerWFS.getSource()
	});

	var interactionSnap2 = new ol.interaction.Snap({
	    source: layerWFS2.getSource()
	});

	
	map = new ol.Map({
	    layers: layers,
	    controls: [],
	    interactions: [
	    	interactionSelectPointerMove,
	        new ol.interaction.MouseWheelZoom(),
	        new ol.interaction.DragPan()
	    ],
	    target: 'map',
	    view: new ol.View({
	    	//projection: pronos,
	        center: ol.proj.fromLonLat([-56.18816, -34.90328]),
	        zoom: 11
	        })
	});

	var transactWFS = function (p, f) {
	    var node;
	    switch (p) {
	        case 'insert':
	            node = formatWFS.writeTransaction([f], null, null, formatGML);
	            break;
	        case 'update':
	            node = formatWFS.writeTransaction(null, [f], null, formatGML);
	            break;
	        case 'delete':
	            node = formatWFS.writeTransaction(null, null, [f], formatGML);
	            break;
	    }
	    s = new XMLSerializer();
	    str = s.serializeToString(node);
	    $.ajax('http://localhost:8080/geoserver/wfs', {
	        type: 'POST',
	        dataType: 'xml',
	        processData: false,
	        contentType: 'text/xml',
	        data: str
	    }).done( function(){
	    	layerWFS.getSource().clear();
	        layerWFS.getSource().refresh();
	        });
	}

	var transactWFS2 = function (p, f) {
	    var node;
	    switch (p) {
	        case 'insert':
	            node = formatWFS.writeTransaction([f], null, null, formatGML2);
	            break;
	        case 'update':
	            node = formatWFS.writeTransaction(null, [f], null, formatGML2);
	            break;
	        case 'delete':
	            node = formatWFS.writeTransaction(null, null, [f], formatGML2);
	            break;
	    }
	    s = new XMLSerializer();
	    str = s.serializeToString(node);
	    $.ajax('http://localhost:8080/geoserver/wfs', {
	        type: 'POST',
	        dataType: 'xml',
	        processData: false,
	        contentType: 'text/xml',
	        data: str
	    }).done( function(){
	        layerWFS2.getSource().clear();
	        layerWFS2.getSource().refresh();
	        });
	}
	
	$('button').click(function () {
		
	    $(this).siblings().removeClass('btn-active');
	    $(this).addClass('btn-active');
	    map.removeInteraction(interaction);
	    interactionSelect.getFeatures().clear();
	    map.removeInteraction(interactionSelect);	    

	    switch ($(this).attr('id')) {

	        case 'btnEdit':
	            map.addInteraction(interactionSelect);
	            interaction = new ol.interaction.Modify({
	                features: interactionSelect.getFeatures()
	            });
	            map.addInteraction(interaction);
	            map.addInteraction(interactionSnap);
	            map.addInteraction(interactionSnap2);
	            dirty = {};
	            interactionSelect.getFeatures().on('add', function (e) {
	                e.element.on('change', function (e) {
	                    dirty[e.target.getId()] = true;
	                });
	            });
	            interactionSelect.getFeatures().on('remove', function (e) {
	                var f = e.element;
	                if (dirty[f.getId()]) {
	                    delete dirty[f.getId()];
	                    var featureProperties = f.getProperties();
	                    delete featureProperties.boundedBy;
	                    var clone = new ol.Feature(featureProperties);
	                    clone.setId(f.getId());
	                    transactWFS('update', clone);
	                }
	            });
	            break;

	        case 'btnAddParada':
	        	var nombreParada = document.getElementById("nombre-parada").value;
	            interaction = new ol.interaction.Draw({
	                type: 'Point',
	                source: layerWFS.getSource()
	            });
	            map.addInteraction(interaction);
	            interaction.on('drawend', function (e) {
	            		e.feature.set('geom', e.feature.getGeometry()); 
	                	e.feature.set('nombre', nombreParada);
	                    transactWFS('insert', e.feature); 
	            });
	            break;

	        case 'btnAddLinea':
	        	const fechaActual = new Date().toISOString();
		        
	        	var codigoLinea = document.getElementById("codigo-linea").value;
	        	var desvioLinea = $('#desvio-linea:checked').val();
	        	var origenLinea = document.getElementById("origen-linea").value;
	        	var destinoLinea = document.getElementById("destino-linea").value;
	        	var companiaLinea = $('#compania-linea').find(":selected").val();

	        	if (desvioLinea == null){
	        	    desvioLinea = false;
	        	}
	        	else{
					desvioLinea = true;
		        }


	        	console.log(desvioLinea);
	        	console.log(fechaActual);
	        	
	        	interaction = new ol.interaction.Draw({
	                type: 'LineString',
	                source: layerWFS2.getSource()
	            });
	            map.addInteraction(interaction);
	            interaction.on('drawend', function (e) {
	            	e.feature.set('geom', e.feature.getGeometry()); 
                	e.feature.set('codigo', codigoLinea);
                	e.feature.set('destino', destinoLinea);
                	e.feature.set('origen', origenLinea);
                	e.feature.set('compania_id', companiaLinea);
                	e.feature.set('desvio', desvioLinea);
                	e.feature.set('fechamod', fechaActual);
	                transactWFS2('insert', e.feature);
	            });
	            break;

	        case 'btnDeleteParada':
	            interaction = new ol.interaction.Select();
	            interaction.getFeatures().on('add', function (e) {
	                transactWFS('delete', e.target.item(0));
	                layerWFS.getSource().removeFeature(e.target.item(0));
	                interactionSelectPointerMove.getFeatures().clear();
	                interaction.getFeatures().clear();
	            });
	            map.addInteraction(interaction);
	            break;

	        case 'btnDeleteRecorrido':
	            interaction = new ol.interaction.Select();
	            interaction.getFeatures().on('add', function (e) {
	                transactWFS2('delete', e.target.item(0));
	                layerWFS2.getSource().removeFeature(e.target.item(0));
	                interactionSelectPointerMove.getFeatures().clear();
	                interaction.getFeatures().clear();
	            });
	            map.addInteraction(interaction);
	            break;

	        case 'btnInfoLinea':
	            interaction = new ol.interaction.Select();
	            interaction.getFeatures().on('add', function (e) {
	            	var info = document.getElementById('infoLinea');
		            if (e.target.item(0).c.includes("linea")) {
		            	$.ajax({
		                    type : "GET",
		                    data : {},
		                    url : "/bube-web/BuscarCompania?id=" + e.target.item(0).get('compania_id'),
		                    success: function(data){
		                            var nombreCompania = data.nombre;
		                            info.innerHTML = "Datos de la linea seleccionada:" + '<br>';
		        	                info.innerHTML += "Compania: " + nombreCompania + '<br>';
		        	                info.innerHTML += "Codigo: " + e.target.item(0).get('codigo') + '<br>';
		        	                info.innerHTML += "Origen: " + e.target.item(0).get('origen') + '<br>';
		        	                info.innerHTML += "Destion: " + e.target.item(0).get('destino') + '<br>';
		        	                if (e.target.item(0).get('desvio')){
		        	                	info.innerHTML += "Recorrido con desvios por obras"
		        			        } else {
		        			        	info.innerHTML += "Recorrido sin variaciones"
		        					}
		                   }
		                });
				    } else {
				    	info.innerHTML = "Seleccione una recorrido en el mapa";
					}
	            });
	            map.addInteraction(interaction);
	            break;
		 	case 'btnBuscarDir':
				var direccion_dir = document.getElementById('dirId').value;
        		var numeroPuerta = document.getElementById('numP').value;

				var image = new ol.layer.Image({
                visible: true, 
                source: new ol.source.ImageWMS({
					url: 'http://localhost:8080/geoserver/busUy/wms?&REQUEST=GetMap&LAYERS=busUy%3Adirecciones&CQL_FILTER=nom_calle like' + direccion_dir + 'and num_puerta=' + numeroPuerta,
					params: {'LAYERS': 'busUy:direcciones'},
                    serverType: 'geoserver',
                    crossOrigin: 'anonymous'
                }),
                style: new ol.style.Circle({
                    fill: fill,
                    stroke: stroke,
                    radius: 10
              	}),
              	projection: new OpenLayers.Projection("EPSG:32721"),
                opacity: 0.0
            	});
        		map.addLayer(image);  

				break;

	        default:
	            break;
	    }
	});
	var draw;
	function buscarDireccion() {
    	var direccion = document.getElementById('direccionId');
        var direccionVal = direccion.value;
        if (direccionVal !=='') { 
        	var fill = new ol.style.Fill({
        		   color: '#eb05d8'
        		 });
        	 var stroke = new ol.style.Stroke({
        		   color: '#3399CC',
        		   width: 1.25
        		 });
        	 
        	var image = new ol.layer.Image({
                visible: true, 
                source: new ol.source.ImageWMS({
                    url: 'http://localhost:8080/geoserver/busUy/wms?service=WMS&version=1.1.0&request=GetMap&layers=busUy%3Amanzanas&bbox=553617.1875%2C6134394.5%2C589042.5625%2C6158890.0&srs=EPSG%3A32721&styles=&format=image%2Fpng&CQL_FILTER=carpeta_ca=' + direccionVal,
                    params: {'LAYERS': 'busUy:manzanas'},
                    serverType: 'geoserver',
                    crossOrigin: 'anonymous'
                }),
                style: new ol.style.Circle({
                    fill: fill,
                    stroke: stroke,
                    radius: 5
              	}),
              	projection: new OpenLayers.Projection("EPSG:32721"),
                opacity: 0.5
            });
        	map.addLayer(image);        	
        	
        	   		       
        }
    }
	
	function buscarDir() {

    	var direccion_dir = document.getElementById('dirId').value;
        var numeroPuerta = document.getElementById('numP').value;
		
	    if (direccion_dir !=='') { 
        	var fill = new ol.style.Fill({
        		   color: '#000000'
        		 });
        	 var stroke = new ol.style.Stroke({
        		   color: '#000000',
        		   width: 10.25
        		 });
        	 
        	var image = new ol.layer.Image({
                visible: true, 
                source: new ol.source.ImageWMS({
					url: 'http://localhost:8080/geoserver/busUy/wms?&REQUEST=GetMap&LAYERS=busUy%3Adirecciones&styles=busUyPunto&srs=EPSG%3A3857&format=image%2Fpng&CQL_FILTER=nom_calle like %27' + direccion_dir + '%27 and num_puerta=' + numeroPuerta,
					params: {'LAYERS': 'busUy:direcciones'},
                    serverType: 'geoserver',
                    crossOrigin: 'anonymous',
					ratio: 10
                }),
                style: new ol.style.Circle({
                    fill: fill,
                    stroke: stroke,
                    //radius: 10
              	}),
              	projection: new OpenLayers.Projection("EPSG:32721"),
                opacity: 1,
				name:'dir_search'
            });
			map.getLayers().getArray()
			.filter(layer => layer.get('name') === 'dir_search')
			.forEach(layer => map.removeLayer(layer));
  			
        	map.addLayer(image);  
			console.log(
			map.getLayers().getArray()
			);      	
        	
        	   		       
        }
	}

	function buscarRecorrido() {

		var destino = document.getElementById('destino').value;
		var codigo = document.getElementById('codigo').value;

		if (destino !=='') { 
				var vector = new ol.layer.Vector({
                visible: true,
                source: new ol.source.Vector({
                    url: 'http://localhost:8080/geoserver/busUy/wfs?request=getFeature&typeName=busUy:linea&srs=EPSG:32721&outputFormat=application/json&cql_filter=%20destino%20like %27' + destino + '%27 and codigo like %27' + codigo + '%27',
                    format: new ol.format.GeoJSON()
                }),
				//name:'recorrido_search'
            });

            map.addLayer(vector);
			vectorLayer.getSource().removeFeature(vector);			
		/*
			map.getLayers().getArray()
			.filter(layer => layer.get('name') === 'recorrido_search')
			.forEach(layer => map.removeLayer(layer));
			
			console.log(
			map.getLayers().getArray()
			); */
			
							
		}
	}
</script>
</body>
</html>