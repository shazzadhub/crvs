require([
 	"dojo/_base/fx",
	"dojo/_base/lang",
    'dojo/_base/array',
	"dojo/dom-style",
    "dojo/parser",
	"dojo/ready",
	"dijit/registry",
	"dojox/layout/ContentPane",
	"dojo/data/ItemFileReadStore",
    "dojo/request",
    "dijit/form/RadioButton",
    'dojox/mobile/CheckBox',
    'dijit/form/CheckBox',
    'dojox/mobile/RadioButton',
    'dijit/form/DateTextBox',
    'dijit/form/ComboBox',
    'dijit/form/Select',
    'dijit/form/Textarea',
    'dijit/form/NumberTextBox',
    'dijit/form/ToggleButton'
], function(baseFx, lang, array, domStyle, parser, ready, registry, ContentPane, ItemFileReadStore, request, RadioButton){

    var store = [];
    var school_types = [];
    var head_teachers = [];

    var selected_school_id = undefined;
    var selected_student_id = undefined;

	lang.setObject("demo.basename", function(path, suffix) {
	    var b = path.replace(/^.*[\/\\]/g, '');
	 
	    if (typeof(suffix) == 'string' && b.substr(b.length - suffix.length) == suffix) {
	        b = b.substr(0, b.length - suffix.length);
	    }
	 
	    return b;
	});
	
	lang.setObject("demo.addTab", function(tabContainer, href, title, closable){
		if (typeof tabContainer === "string"){
			tabContainer = registry.byId(tabContainer);
		}

		var tabName = "tab" + demo.basename(href,".html"),
			tab = registry.byId(tabName);
		if (typeof tab === "undefined"){
			tab = new ContentPane({
				id: tabName,
                //schoolid: tabName,
				title: title,
				href: href,
				closable: closable,
				style: "padding: 0;",
                executeScripts: true,
                onclick: function(){
                    alert(this.schoolid);
                }
			});
			tabContainer.addChild(tab);
		}
		tabContainer.selectChild(tab);

	});
	


	lang.setObject("demo.formatterIcon", function(iconClass){
		return '<div class="' + iconClass + '"></div>';
	});
	lang.setObject("demo.getPlaces", function(){
		return store;
	});
	lang.setObject("demo.getSchoolTypes", function(){
		return school_types;
	});
    lang.setObject("demo.getHeadTeachers", function(){
        return head_teachers;
    });
	lang.setObject("demo.getSelectedSchoolId", function(){
		return selected_school_id;
	});
	lang.setObject("demo.getSelectedStudentId", function(){
		return selected_student_id;
	});
	lang.setObject("demo.setSelectedStudentId", function(id){
		selected_student_id = id;
	});

	lang.setObject("demo.saveForm", function(model,form_name, onSuccess,onFailure){
        if(confirm('Confirm to create, press OK to submit')){
            dojo.xhrPost({
                url: "api/" + model + "/save",
                form: form_name,
                handleAs: 'json',
                load: function(response){
                    if (response.status == 'success') {
                        //widget.onSuccess(response);
                        onSuccess(response.message);
                    } else {
                        //widget.onFailure(response);
                        onFailure(response.message);
                    }
                }
            });
        }
        return false;
	});

    lang.setObject("demo.email", function(model,form_name, onSuccess,onFailure){
        dojo.xhrPost({
            url: "api/" + model + "/mail",
            form: form_name,
            handleAs: 'json',
            load: function(response){
                if (response.status == 'success') {
                    //widget.onSuccess(response);
                    onSuccess(response.message);
                } else {
                    //widget.onFailure(response);
                    onFailure(response.message);
                }
            }
        });
    });

    lang.setObject("demo.saveHealthForm", function(model,form_name, onSuccess,onFailure){
        if(confirm('Confirm to create, press OK to submit')){
            dojo.xhrPost({
                url: "api/" + model + "/healthidsave",
                form: form_name,
                handleAs: 'json',
                load: function(response){
                    if (response.status == 'success') {
                        //widget.onSuccess(response);
                        onSuccess(response.message);
                    } else {
                        //widget.onFailure(response);
                        onFailure(response.message);
                    }
                }
            });
        }
        return false;
    });

    lang.setObject("demo.getGridSelectedRow", function(gridid){
        var grid = dijit.byId(gridid);
//        console.debug(grid);
        var items = grid.selection.getSelected();
//        console.debug(items.length);
        var v = false;
        if(items.length) {
//            console.debug(items);
            array.forEach(items, function(selectedItem){
//                console.debug(selectedItem);
                if(selectedItem !== null){
//                    console.debug(selectedItem);
                    array.forEach(grid.store.getAttributes(selectedItem), function(attribute){
//                        console.debug(attribute);
                        if(attribute == 'id'){
//                            console.debug(grid.store);
                            v = grid.store.getValues(selectedItem, attribute);
                        }
                    });
                }
            });
        }
        return v;
    });

	lang.setObject("demo.deleteById", function(del_href, gridid, href){

        var id = demo.getGridSelectedRow(gridid);
        console.debug(id);
        console.debug(gridid);
        if(id){
            request.post("api/" + del_href + "/delete/" + id, {
                data: {},
                headers: {}
            }).then(function(text){
                demo.reloadGrid(gridid, href, function(){});
            });
        }
	});

	lang.setObject("demo.loadContentById", function(model, gridid){
        var id = demo.getGridSelectedRow(gridid);

        if(id){
            demo.addTab("mainTabContainer", "app/html/school_edit.html", "Edit School: " + id, true);
        }
	});

	lang.setObject("demo.reloadGrid", function(gridid, href, callback){
        var newStore = new ItemFileReadStore({url: href});
        var grid = dijit.byId(gridid);
        grid.setStore(newStore);
        callback();
	});

	ready(function(){
		parser.parse().then(function(objects){
			baseFx.fadeOut({  //Get rid of the loader once parsing is done
				node: "preloader",
				onEnd: function() {
					domStyle.set("preloader","display","none");
                    //alert('ko');
				}
			}).play();
            request.get("api/places",{
            }).then(function(data){
                    store = data;
                });
            request.get("api/school_types",{
            }).then(function(data){
                    school_types = data;
                });
            request.get("api/head_teachers",{
            }).then(function(data){
                    head_teachers = data;
                });
            //dijit.byId("mainTabContainer") .destroyRecursive(true);
            var tabs = dijit.byId("mainTabContainer");
            dojo.connect(tabs,"_transition", function(newPage, oldPage){
//                console.log("I was showing: ", oldPage || "nothing");
//                console.log("I am now showing: ", newPage);
            if(newPage.id.indexOf("tabschool_edit.html?id=")>=0){
                //window.location.hash = '#school-id='+newPage.id.replace("tabschool_edit.html?id=", "");
                selected_school_id = newPage.id.replace("tabschool_edit.html?id=", "");
            }else{
                //window.location.hash = '';
                selected_school_id = undefined;
            }

            });
		});
	});
});