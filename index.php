<?php
session_start();
if (!(isset($_SESSION['login']) && $_SESSION['login'] != '')) {
    header ("Location: login.html");
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CRVS</title>
    <!-- <link rel='stylesheet' href='http://ajax.googleapis.com/ajax/libs/dojo/1.10.0/dijit/themes/soria/soria.css'> -->
    <link rel="stylesheet" href="carlo.css" type="text/css" />
    <link rel="stylesheet" href="demo.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="app/css/crvs.css">
    
    <script type="text/javascript">
    // Configure Dojo.
    var dojoConfig = {
        baseUrl: location.href.substring(0,location.href.lastIndexOf('/')),
        async: true,
//        parseOnLoad:true,
        locale: "en-us"
    };
    </script>
    <script type="text/javascript" src="dojo/dojo.js"></script>
    <!--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/dojo/1.10.0/dojo/dojo.js"></script> -->
    <script type="text/javascript" src="app/jquery.js"></script>
    <script type="text/javascript" src="src.js" charset="utf-8"></script>
</head>
<body class="claro" style="background-color: #5191bb!important;">
    <script type="text/javascript">
        var sendName;
        var sendEmail;
        var sendNID;

        var confirmation_code_input;
        var confirmation_code_gen;
    </script>

    <div id="preloader">Loading Application...</div>
    <!-- Using Declarative Require to "hang" some modules off demo object for declarative scripting -->
    <script type="dojo/require">
        "demo.local" : "dojo/i18n",
        "demo.parser" : "dojo/parser",
        "demo.dom": "dojo/dom",
        "demo.registry": "dijit/registry",
        "demo.request": "dojo/request",
        "demo.lang": "dojo/_base/lang",
        "demo.Dialog": "dijit/Dialog",
        "demo.Form": "dijit/form/Form",
        "demo.Button": "dijit/form/Button",
        "demo.FormSelect": "dijit/form/Select",
        "demo.ValidationTextBox": "dijit/form/ValidationTextBox",

        "demo.dijit" : "dijit/dijit",
        "demo.domstyle" : "dojo/dom-style"
    </script>

    <!--<script type="text/javascript">
        require(["dijit/ConfirmDialog"], function(ConfirmDialog){
            teacherConfirmDialog = new ConfirmDialog({
                title: "Enter Code to Confirm",
                content: "<input type='text' id='teacher_confirmation_input' maxlength='6' data-dojo-type='dijit/form/TextBox' intermediateChanges='false' trim='false' uppercase='false' lowercase='false' propercase='false' selectOnClick='false' style='width: 100%;' placeHolder='CODE'></input>",
                style: "width: 300px"
            });
        });
    </script>-->

    <div data-dojo-type="dijit/layout/BorderContainer" id="mainContainer"  style="background-color: #5191bb!important;"
         data-dojo-props="gutters:false">
        <div data-dojo-type="dijit/layout/ContentPane" id="headerPane"
             data-dojo-props="splitter:false, region:'top'" style="background-color: #5191bb">
            <div style="float: left">
                <img src="app/img/dpe-logo.jpg" alt="DPE-LOG" height="40px"/>
                <img src="app/img/bdgov-logo.png" alt="GOV-LOG" height="40px"/>
                <img src="app/img/a2i_logo.jpg" alt="GOV-LOG" height="40px"/>
            </div>
            <div style="float: left; line-height: 40px; margin-left: 10px;color:white"><strong>প্রাথমিক শিক্ষা অধিদপ্তর</strong></div>

<!--            <div data-dojo-attach-point="logoutButton" dojoType="dijit.form.Button" label="Logout">-->
                <button type="button" data-dojo-type="dijit/form/Button" class="logoutButton">
                    <span>Logout</span>
                    <script type="dojo/on" data-dojo-event="click">
                        location.href = dojoConfig.baseUrl + '/logout.php';
                    </script>
                </button>
        </div>
        <div data-dojo-type="dijit/layout/BorderContainer" id="mainSplitter"
             data-dojo-props="liveSplitters: false, design: 'sidebar', region: 'center'">
            <div data-dojo-type="dijit/layout/AccordionContainer"
                 id="leftAccordion" data-dojo-props="minSize: 20, region: 'leading'" style="width: 14%;">
                <div data-dojo-type="dijit/layout/ContentPane" id="ap1"
                     data-dojo-props="title: 'Menu', href:'app/html/menus/ap1.html'"
                     class="paneAccordion"></div>
                <div data-dojo-type="dijit/layout/ContentPane" id="ap2"
                     data-dojo-props="title: 'Help', href:'app/html/menus/ap2.html'"
                     class="paneAccordion"></div>
            </div>
<!--            <div data-dojo-type="dijit/layout/ContentPane" id="mainTabContainer"-->
<!--                 data-dojo-props="region: 'center', title: 'Welcome', href:'app/html/welcome.html'">-->
<!--            </div>-->
            <div data-dojo-type="dijit/layout/TabContainer" id="mainTabContainer"
                 data-dojo-props="region: 'center'">
                <div data-dojo-type="dijit/layout/ContentPane" id="tabWelcome"
                     data-dojo-props="title: 'Welcome', href:'app/html/welcome.html', executeScripts: true"></div>
            </div>
        </div>
    </div>

    <div data-dojo-type="dijit.Dialog" id="teacher_confirmation_dialog" title="Enter the Code to Confirm" style="display: none">
        <form data-dojo-type="dijit.form.Form">
            <script type="dojo/event" data-dojo-event="onSubmit" data-dojo-args="e">
                dojo.stopEvent(e);
                if(!this.isValid()){ window.alert('Please fix fields'); return; }
                    if(confirmation_code_gen === confirmation_code_input){
                        dijit.byId('teacher_confirmation_dialog').hide();
                        alert("Successfully Added Teacher");
                        confirmation_code_gen = null;
                        confirmation_code_input = null;
                    } else {
                        dijit.byId("teacher_confirmation_dialog").set('title',"Code You entered is Invalid");
                        dijit.byId("teacher_confirmation_dialog").set('backgroundColor',"red");
                        confirmation_code_input = null;
                    }
            </script>
            <div class="dijitDialogPaneContentArea">

                <label for='foo'>Confirmation Code:</label><div id="teacher_conf_code_input" data-dojo-type="dijit.form.ValidationTextBox" value='' data-dojo-props="required:true" onChange="confirmation_code_input=this.value" style="font-weight:bold;" placeHolder="CODE"></div>
            </div>
            <div class="dijitDialogPaneActionBar">
                    <button data-dojo-type="dijit.form.Button" type="submit">OK</button>
                    <button data-dojo-type="dijit.form.Button" type="button"
                        data-dojo-props="onClick:function(){dijit.byId('teacher_confirmation_dialog').hide();}">Cancel</button>
            </div>
         </form>
    </div>

    <div data-dojo-type="dijit.Dialog" id="dialogFormTeacher" title="New/Edit Teacher" style="display: none">
        <form data-dojo-type="dijit.form.Form">
            <script type="dojo/event" data-dojo-event="onSubmit" data-dojo-args="e">
                dojo.stopEvent(e);
                if(this.validate()){
                    demo.saveForm("teacher",this.id,function(message){
                            var teachers_grid = dijit.byId("grid-teacher-refresh-id");
                            var school_id = demo.getSelectedSchoolId();
                            if(school_id !== undefined){
                                //console.debug(teachers_grid.get("value"));
                                demo.reloadGrid(teachers_grid.get("value"), "api/teachers/"+school_id, function(){});
                            }
                            dijit.byId('dialogFormTeacher').hide();
                            
                            //SENDING A EMAIL TO THE TEACHERS EMAIL ADDRESS
                            //var data = dojo.toJson({"teacherName":sendName, "teacherNID":sendNID, "teacherEmail":sendEmail});
                            var data = {};
                            data["teacherName"]=sendName;
                            data["teacherNID"]=sendNID;
                            data["teacherEmail"]=sendEmail;
                            demo.email("teacher",data,function(code){
                                //console.log(message);
                                confirmation_code_gen = code;
                                console.debug('CONFIRMATION-CODE: '+confirmation_code_gen);
                                dijit.byId("teacher_conf_code_input").set('value', '');
                                dijit.byId("teacher_confirmation_dialog").show();
                                //alert(code);
                            },function(message){
                                alert(message);
                            });
                        },function(message){
                    });
                }else{
                    alert('Form contains invalid data.  Please correct first');
                    return false;
                }
                return false;
            </script>
            <div class="dijitDialogPaneContentArea">
                <input type="hidden" name="id" id="dialogFormTeacher-id" data-dojo-type="dijit/form/TextBox"/>
                <input type="hidden" id="grid-teacher-refresh-id" data-dojo-type="dijit/form/TextBox"/>
                <input type="hidden" name="school_id" id="dialogFormTeacher-school-id" data-dojo-type="dijit/form/TextBox"/>
                <label for='foo'>Name:</label><div id="dialogFormTeacher-name" name="name" data-dojo-type="dijit.form.ValidationTextBox" data-dojo-props="required:true" onChange="sendName=this.value"></div>
                <label for='foo1'>NID:</label><div type="number" id="dialogFormTeacher-nid" name="teacher_nid" maxLength="17" data-dojo-type="dijit.form.ValidationTextBox" data-dojo-props="required:true" onChange="sendNID=this.value"></div>
                <label for='foo2'>Email Address:</label><div id="dialogFormTeacher-email" name="teacher_email" data-dojo-type="dijit.form.ValidationTextBox" data-dojo-props="required:true" onChange="sendEmail=this.value"></div>
            </div>
            <div class="dijitDialogPaneActionBar">
                <button data-dojo-type="dijit.form.Button" type="submit">OK</button>
                <button data-dojo-type="dijit.form.Button" type="button"
                        data-dojo-props="onClick:function(){dijit.byId('dialogFormTeacher').hide();}">Cancel</button>
            </div>
        </form>
    </div>

    <div data-dojo-type="dijit.Dialog" id="dialogFormStudentSubmit" title="Sure to Submit?" style="display: none">
        <form data-dojo-type="dijit.form.Form">
            <script type="dojo/event" data-dojo-event="onSubmit" data-dojo-args="e">
                dojo.stopEvent(e);
                if(this.validate()){
                    /*demo.saveForm("teacher",this.id,function(message){
                            var teachers_grid = dijit.byId("grid-teacher-refresh-id");
                            var school_id = demo.getSelectedSchoolId();
                            if(school_id !== undefined){
                                //console.debug(teachers_grid.get("value"));
                                demo.reloadGrid(teachers_grid.get("value"), "api/teachers/"+school_id, function(){});
                            }
                            dijit.byId('dialogFormTeacher').hide();
                        },function(message){
                    });*/
                }else{
                    alert('Form contains invalid data.  Please correct first');
                    return false;
                }
                return false;
            </script>
            <div class="dijitDialogPaneContentArea">
                <div  id="dialogFormStudentSubmit-data" name="name" data-dojo-type="dijit.form.Textarea" style="width: 500px; overflow: scroll; height:300px;"></div>
            </div>
            <div class="dijitDialogPaneActionBar">
                <button data-dojo-type="dijit.form.Button" type="submit">OK</button>
                <button data-dojo-type="dijit.form.Button" type="button"
                        data-dojo-props="onClick:function(){dijit.byId('dialogFormStudentSubmit').hide();}">Cancel</button>
            </div>
        </form>
    </div>

    <div data-dojo-type="dijit.Dialog" id="dialogFormClass" title="New/Edit Class" style="display: none">
        <form data-dojo-type="dijit.form.Form">
            <script type="dojo/event" data-dojo-event="onSubmit" data-dojo-args="e">
                dojo.stopEvent(e);
                if(this.validate()){
                demo.saveForm("class",this.id,function(message){
                var classes_grid = dijit.byId("grid-class-refresh-id");
                var school_id = demo.getSelectedSchoolId();
                if(school_id !== undefined){
                //console.debug(classes_grid.get("value"));
                demo.reloadGrid(classes_grid.get("value"), "api/classes/"+school_id, function(){});
                }
                dijit.byId('dialogFormClass').hide();
                },function(message){
                });
                }else{
                alert('Form contains invalid data.  Please correct first');
                return false;
                }
                return false;
            </script>
            <div class="dijitDialogPaneContentArea">
                <input type="hidden" name="id" id="dialogFormClass-id" data-dojo-type="dijit/form/TextBox"/>
                <input type="hidden" id="grid-class-refresh-id" data-dojo-type="dijit/form/TextBox"/>
                <input type="hidden" name="school_id" id="dialogFormClass-school-id" data-dojo-type="dijit/form/TextBox"/>
                <label for='foo'>Name:</label><div  id="dialogFormClass-name" name="name" data-dojo-type="dijit.form.ValidationTextBox" data-dojo-props="required:true"></div>
<!--                <br/>-->
                <label for='foo'>Class Teacher:</label><div id="dialogFormClass-class_teacher_id" name="class_teacher_id"
                                                              data-dojo-type="dijit/form/FilteringSelect"
                    /></div>
            </div>
            <div class="dijitDialogPaneActionBar">
                <button data-dojo-type="dijit.form.Button" type="submit">OK</button>
                <button data-dojo-type="dijit.form.Button" type="button"
                        data-dojo-props="onClick:function(){dijit.byId('dialogFormClass').hide();}">Cancel</button>
            </div>
        </form>
    </div>

    <div data-dojo-type="dijit.Dialog" id="healthDialog" title="হেলথ আইডি নিবন্ধন ফর্ম" style="display: none; height: auto">
        <form data-dojo-type="dijit.form.Form">
            <script type="dojo/event" data-dojo-event="onSubmit" data-dojo-args="e">
                dojo.stopEvent(e);
                if(this.validate()){
                    demo.saveHealthForm("student",this.id,function(message){
                        dijit.byId('healthDialog').hide();
                    },function(message){});
                }else{
                    alert('Form contains invalid data.  Please correct first');
                return false;
                }
                return false;
            </script>
            <div class="dijitDialogPaneContentArea">
                <input type="hidden" id="id_for_healthform" name="id_for_healthform" data-dojo-type="dijit/form/TextBox"/>

                <div data-dojo-type="dijit.layout.TabContainer" style="height: 500px; width: 450px;">
                    <div data-dojo-type="dijit.layout.ContentPane" title="সাধারন তথ্য">
                        <table border="0" style="border-collapse: separate; table-layout: fixed;">
                            <colgroup>
                            <col class="colgroup_first_col"></col>
                            <col></col>
                            </colgroup>
                                <tbody>
                                    <tr>
                                        <td><label>ফর্ম নাম্বার</label></td>
                                        <td>
                                            <input type="number" id="healthform_formno" name="healthform_formno" required maxlength="6" data-dojo-type="dijit/form/TextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" style="width: 100%;" placeHolder="ফর্ম নম্বর লিখুন" promptMessage="Username must be letters and numbers
                only, and at least 4 characters long"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>হেলথ আইডি</label></td>
                                        <td>
                                            <input type="number" id="healthform_helthID" name="healthform_helthID" required maxlength="11" data-dojo-type="dijit/form/TextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" style="width: 100%;" placeHolder="হেলথ আইডি"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>১. নাম (বাংলায়)</label></td>
                                        <td>
                                            <input type="text" id="healthform_name_ban" name="healthform_name_ban" required data-dojo-type="dijit/form/TextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" style="width: 100%;" placeHolder="বাংলায় লিখুন"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>২. নাম (ইংরেজিতে)</label></td>
                                        <td>
                                            <input type="text" id="healthform_name_eng" name="healthform_name_eng" required data-dojo-type="dijit/form/TextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" style="width: 100%;" placeHolder="ইংরেজিতে লিখুন"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>৩. জন্ম তারিখ (দিন/মাস/বছর)</label>
                                        </td>
                                        <td>
                                            <input type="text" id="healthform_birthdate" name="healthform_birthdate" required data-dojo-type="dijit/form/DateTextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" invalidMessage="$_unset_$"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>৪. জন্মস্থান</label>
                                        </td>
                                        <td>
                                            <input type="text" id="healthform_birthplace" name="healthform_birthplace" required maxlength="2" data-dojo-type="dijit/form/TextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" placeHolder="জন্মস্থান কোড" selectOnClick="false"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>৫. লিঙ্গ</label>
                                        </td>
                                        <td>
                                            <select id="healthform_sex" name="healthform_sex" data-dojo-type="dijit/form/Select" value="পুরুষ" required intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" invalidMessage="$_unset_$" pageSize="Infinity" searchDelay="200">
                                                <option value="পুরুষ">
                                                পুরুষ</option>
                                                <option value="মহিলা">
                                                মহিলা</option>
                                                <option value="অন্যান্য">
                                                অন্যান্য</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>৬. জন্ম নিবন্ধন নম্বর</label>
                                        </td>
                                        <td>
                                            <input type="number" id="healthform_birth_no" name="healthform_birth_no" required maxlength="17" data-dojo-type="dijit/form/TextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" placeHolder="সংখ্যায় লিখুন"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>৭. ধর্ম</label>
                                        </td>
                                        <td>
                                            <select id="healthform_religion" name="healthform_religion" data-dojo-type="dijit/form/Select" value="ধর্ম" required intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" invalidMessage="$_unset_$" pageSize="Infinity">
                                                <option value="ইসলাম">
                                                ইসলাম</option>
                                                <option value="হিন্দু">
                                                হিন্দু</option>
                                                <option value="বৌদ্ধ">
                                                বৌদ্ধ</option>
                                                <option value="খ্রিষ্টান">
                                                খ্রিষ্টান</option>
                                                <option value="অন্যান্য">
                                                অন্যান্য</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>৮. মোবাইল নম্বর</label>
                                        </td>
                                        <td>
                                            <input type="number" id="healthform_moblie" name="healthform_moblie" data-dojo-type="dijit/form/TextBox" required maxlength="11" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" placeHolder="সংখ্যায় লিখুন"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>৯. পেশা</label>
                                        </td>
                                        <td>
                                            <input type="text" id="healthform_occupation" name="healthform_occupation" data-dojo-type="dijit/form/TextBox" required maxlength="2" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" placeHolder="পেশা কোড"></input>
                                        </td>
                                    </tr>

                                </tbody>
                        </table>
                    </div>
                    

                    <div data-dojo-type="dijit.layout.ContentPane" title="বৈবাহিক তথ্যাবলী">
                        <table border="0" style="border-collapse: separate; table-layout: fixed;">
                            <colgroup>
                            <col class="colgroup_first_col"></col>
                            <col></col>
                            </colgroup>
                                <tbody>
                                    <tr>
                                        <td><label>১০. বৈবাহিক অবস্থা</label></td>
                                        <td>
                                            <select id="healthform_maritual_status" name="healthform_maritual_status" required data-dojo-type="dijit/form/Select" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" invalidMessage="$_unset_$" pageSize="Infinity">
                                                <option value="অবিবাহিত">
                                                অবিবাহিত</option>
                                                <option value="বিবাহিত">
                                                বিবাহিত</option>
                                                <option value="তালাক প্রাপ্ত">
                                                তালাক প্রাপ্ত</option>
                                                <option value="বিধবা">
                                                বিধবা</option>
                                                <option value="বিপত্নীক">
                                                বিপত্নীক</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>১১. নাম (বাংলায়)</label></td>
                                        <td>
                                            <input type="text" id="healthform_maritual_name_ban" name="healthform_maritual_name_ban" required data-dojo-type="dijit/form/TextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" style="width: 100%;" placeHolder="বাংলায় লিখুন"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>১২. নাম (ইংরেজিতে)</label></td>
                                        <td>
                                            <input type="text" id="healthform_maritual_name_eng" name="healthform_maritual_name_eng" required data-dojo-type="dijit/form/TextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" style="width: 100%;" placeHolder="ইংরেজিতে লিখুন"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>১৩. NID/BRN নম্বর</label></td>
                                        <td>
                                            <input type="number" id="healthform_maritual_nidbrn" name="healthform_maritual_nidbrn" required maxlength="17" data-dojo-type="dijit/form/TextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" style="width: 100%;" placeHolder="সংখ্যায় লিখুন"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>১৪. মোবাইল নম্বর</label></td>
                                        <td>
                                            <input type="number" id="healthform_maritual_cellno" name="healthform_maritual_cellno" required maxlength="11" data-dojo-type="dijit/form/TextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" style="width: 100%;" placeHolder="সংখ্যায় লিখুন"></input>
                                        </td>
                                    </tr>
                                </tbody>
                        </table>
                    </div>


                    <div data-dojo-type="dijit.layout.ContentPane" title="পিতার তথ্যাবলী">
                        <table border="0" style="border-collapse: separate; table-layout: fixed;">
                            <colgroup>
                            <col class="colgroup_first_col"></col>
                            <col></col>
                            </colgroup>
                                <tbody>
                                    <tr>
                                        <td><label>১৫. নাম (বাংলায়)</label></td>
                                        <td>
                                            <input type="text" id="healthform_father_name_ban" name="healthform_father_name_ban" required data-dojo-type="dijit/form/TextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" style="width: 100%;" placeHolder="বাংলায় লিখুন"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>১৬. নাম (ইংরেজিতে)</label></td>
                                        <td>
                                            <input type="text" id="healthform_father_name_eng" name="healthform_father_name_eng" required data-dojo-type="dijit/form/TextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" style="width: 100%;" placeHolder="ইংরেজিতে লিখুন"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>১৭. NID/BRN নম্বর</label></td>
                                        <td>
                                            <input type="number" id="healthform_father_nidbrn" name="healthform_father_nidbrn" required maxlength="17" data-dojo-type="dijit/form/TextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" style="width: 100%;" placeHolder="সংখ্যায় লিখুন"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>১৮. পিতা মৃত হইলে মৃত্যুর সন</label>
                                        </td>
                                        <td>
                                            <input type="text" id="healthform_father_death_date" name="healthform_father_death_date" data-dojo-type="dijit/form/DateTextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" invalidMessage="$_unset_$"></input>
                                        </td>
                                    </tr>
                                </tbody>
                        </table>
                    </div>


                    
                    <div data-dojo-type="dijit.layout.ContentPane" title="মাতার তথ্যাবলী">
                        <table border="0" style="border-collapse: separate; table-layout: fixed;">
                            <colgroup>
                            <col class="colgroup_first_col"></col>
                            <col></col>
                            </colgroup>
                                <tbody>
                                    <tr>
                                        <td><label>১৯. নাম (বাংলায়)</label></td>
                                        <td>
                                            <input type="text" id="healthform_mather_name_ban" name="healthform_mather_name_ban" required data-dojo-type="dijit/form/TextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" style="width: 100%;" placeHolder="বাংলায় লিখুন"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>২০. নাম (ইংরেজিতে)</label></td>
                                        <td>
                                            <input type="text" id="healthform_mather_name_eng" name="healthform_mather_name_eng" required data-dojo-type="dijit/form/TextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" style="width: 100%;" placeHolder="ইংরেজিতে লিখুন"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>২১. NID/BRN নম্বর</label></td>
                                        <td>
                                            <input type="number" id="healthform_mather_nidbrn" name="healthform_mather_nidbrn" required maxlength="17" data-dojo-type="dijit/form/TextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" style="width: 100%;" placeHolder="সংখ্যায় লিখুন"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>২২. মাতা মৃত হইলে মৃত্যুর সন</label></td>
                                        <td>
                                            <input type="text" id="healthform_mather_death_date" name="healthform_father_death_date" data-dojo-type="dijit/form/DateTextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" invalidMessage="$_unset_$"></input>
                                        </td>
                                    </tr>
                                </tbody>
                        </table>
                    </div>


                    <div data-dojo-type="dijit.layout.ContentPane" title="ঠিকানা">
                        <fieldset style="border: 2px groove threedface; margin: 2px; padding: 0.75em;">
                            <legend>২৩. বর্তমান ঠিকানা</legend>
                            <textarea type="text" id="healthform_present_address" name="healthform_present_address" required data-dojo-type="dijit/form/Textarea" intermediateChanges="false" rows="3" trim="false" uppercase="false" lowercase="false" propercase="false" style="margin-left: 5%; width: 70%; height: auto;"></textarea>
                        </fieldset>
                        <fieldset style="border: 2px groove threedface; margin: 2px; padding: 0.75em;">
                            <legend>২৪. স্থায়ী ঠিকানা</legend>
                            <textarea type="text" id="healthform_permanent_address" name="healthform_permanent_address" required data-dojo-type="dijit/form/Textarea" intermediateChanges="false" rows="3" trim="false" uppercase="false" lowercase="false" propercase="false" style="margin-left: 5%; width: 70%; height: auto;"></textarea>
                        </fieldset>
                    </div>


                    <div data-dojo-type="dijit.layout.ContentPane" title="অফিসিয়াল">
                        <fieldset style="border: 2px groove threedface; margin: 2px; padding: 0.75em;">
                            <legend>ডাটা এন্ট্রি অপারেটরের তথ্যাবলী</legend>
                            <table border="0" style="border-collapse: separate; table-layout: fixed;">
                            <colgroup>
                            <col class="colgroup_first_col"></col>
                            <col></col>
                            </colgroup>
                                <tbody>
                                    <tr>
                                        <td><label>(ক) NID নম্বর</label></td>
                                        <td>
                                            <input type="number" id="healthform_operator_nid" name="healthform_operator_nid" maxlength="17" required data-dojo-type="dijit/form/TextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" style="width: 100%;" placeHolder="সংখ্যায় লিখুন"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>(খ) এন্ট্রি তারিখ</label></td>
                                        <td>
                                            <input type="date" id="healthform_operator_entrydate" name="healthform_operator_entrydate" required data-dojo-type="dijit/form/DateTextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" invalidMessage="$_unset_$"></input>
                                        </td>
                                    </tr>
                                </tbody>
                        </table>
                        </fieldset>

                        <fieldset style="border: 2px groove threedface; margin: 2px; padding: 0.75em;">
                            <legend>বয়োমেট্রিক তথ্য সংগ্রহকারী</legend>
                            <table border="0" style="border-collapse: separate; table-layout: fixed;">
                            <colgroup>
                            <col class="colgroup_first_col"></col>
                            <col></col>
                            </colgroup>
                                <tbody>
                                    <tr>
                                        <td><label>(ক) NID নম্বর</label></td>
                                        <td>
                                            <input type="number" id="healthform_biometric_nid" name="healthform_biometric_nid" maxlength="17" required data-dojo-type="dijit/form/TextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" selectOnClick="false" style="width: 100%;" placeHolder="সংখ্যায় লিখুন"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>(খ) এন্ট্রি তারিখ</label></td>
                                        <td>
                                            <input type="date" id="healthform_biometric_entrydate" name="healthform_biometric_entrydate" required data-dojo-type="dijit/form/DateTextBox" intermediateChanges="false" trim="false" uppercase="false" lowercase="false" propercase="false" invalidMessage="$_unset_$"></input>
                                        </td>
                                    </tr>
                                </tbody>
                        </table>
                        </fieldset>
                    </div>


                    

                </div>
            </div>
            <div class="dijitDialogPaneActionBar">
                <button data-dojo-type="dijit.form.Button" type="submit">OK</button>
                <button data-dojo-type="dijit.form.Button" type="button" data-dojo-props="onClick:function(){dijit.byId('healthDialog').hide();}">Cancel</button>
            </div>
        </form>
    </div>
</body>
</html>
