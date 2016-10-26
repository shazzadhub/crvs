<?php
session_start();
require 'flight/Flight.php';

require 'lib/EasyPDO.php';
Flight::register('db', 'EasyPDO', array('mysql:dbname=sixaxist_crvs;host=localhost;charset=UTF8', "sixaxist_shazzad", "shazzad"));

Flight::map('checkLogin', function(){
    if (!(isset($_SESSION['login']) && $_SESSION['login'] != '')) {
        $output = array(
            'error' => 'Login required!'
        );
        Flight::json($output);
    }
});

Flight::route('/', function(){
    echo 'hello world!';
});

Flight::route('/user/new', function(){
    //Flight::checkLogin();

    $db = Flight::db();

    //$db->insert("users", array('name'=>'masud','email'=>'masud@kiteplexit.com','password'=>md5(md5('mas123'))));
    //$db->insert("users", array('name'=>'shazzad','email'=>'shazzad@kiteplexit.com','password'=>md5(md5('sha1234'))));

    Flight::json(array(
        'status'  => 'success',
        'message' => 'User Created Successfully.'
    ));
});

Flight::route('/user/save', function(){
    //Flight::checkLogin();

    $db = Flight::db();

    //$db->insert("users", array('name'=>'masud','email'=>'masud@kiteplexit.com','password'=>md5(md5('mas123'))));

    Flight::json(array(
        'status'  => 'success',
        'message' => 'User Created Successfully.'
    ));
});

Flight::route('POST /login', function(){
    $data = Flight::request()->data;

    $db = Flight::db();

    $username = $data->username;
    $password = md5(md5($data->password));

    $user_info = $db->fetchAll("SELECT id, name, email FROM users WHERE name=:name AND password=:password",
        array('name'=>$username,'password'=>$password)
    );

    if($user_info) {
        $_SESSION['login'] = 'YES';
        $_SESSION['user_info'] = $user_info;

        Flight::json(array(
            'status'  => 'success',
            'message' => 'Logged in'
        ));
    } else {
        Flight::json(array(
            'status'  => 'failure',
            'message' => 'Invalid login or password'
        ));
    }
});



Flight::route('/schools', function(){
    Flight::checkLogin();

    $db = Flight::db();

    //$db->insert("schools", array('name'=>'Mirpur School','created'=>date("Y-m-d h:i:s")));
    $schools = $db->fetchAll("
            SELECT
                sch.`id`,
                  sch.`name` `name`,
                  `eiin`,
                  `created`,
                  `modified`,
                  plc1.`name` `division`,
                  plc2.`name` `district`,
                  plc3.`name` `subdistrict`,
                  `school_type_id`
            FROM `schools` AS sch
            INNER JOIN `places` AS plc1 ON sch.`division` = plc1.`id`
            INNER JOIN `places` AS plc2 ON sch.`district` = plc2.`id`
            INNER JOIN `places` AS plc3 ON sch.`subdistrict` = plc3.`id`

            ");
    Flight::json(array(
        'identifier'=>'id',
        'items' => $schools
    ));
});

Flight::route('/places', function(){
    Flight::checkLogin();

    $db = Flight::db();

    $places = $db->fetchAll("SELECT * FROM places");
    Flight::json($places);
});

Flight::route('/school_types', function(){
    Flight::checkLogin();

    $db = Flight::db();

    $school_types = $db->fetchAll("SELECT * FROM school_types");
    Flight::json($school_types);
});

Flight::route('/head_teachers', function(){
    Flight::checkLogin();

    $db = Flight::db();

    $head_teachers = $db->fetchAll("SELECT id, ht_name FROM head_teachers");
    Flight::json($head_teachers);
});

Flight::route('/divisions', function(){
    Flight::checkLogin();

    $db = Flight::db();

    $divisions = $db->fetchAll("SELECT * FROM places WHERE type_id=1");
//    Flight::json($divisions);
    Flight::json(array(
        'identifier'=>'id',
        'items' => $divisions
    ));
});

Flight::route('/districts', function(){
    Flight::checkLogin();

    $db = Flight::db();

    $districts = $db->fetchAll("SELECT * FROM places WHERE type_id=2");
//    Flight::json($districts);
    Flight::json(array(
        'identifier'=>'id',
        'items' => $districts
    ));
});

Flight::route('/districts/@division', function($division){
    Flight::checkLogin();

    $db = Flight::db();

    $districts = $db->fetchAll("SELECT * FROM places WHERE type_id=2 AND parent_id=:parent_id" , array('parent_id'=>$division));
//    Flight::json($districts);
    Flight::json(array(
        'identifier'=>'id',
        'items' => $districts
    ));
});

Flight::route('/subdistricts', function(){
    Flight::checkLogin();

    $db = Flight::db();

    $subdistricts = $db->fetchAll("SELECT * FROM places WHERE type_id=3");
//    Flight::json($subdistricts);
    Flight::json(array(
        'identifier'=>'id',
        'items' => $subdistricts
    ));
});

Flight::route('/subdistricts/@district', function($district){
    Flight::checkLogin();

    $db = Flight::db();

    $subdistricts = $db->fetchAll("SELECT * FROM places WHERE type_id=3 AND parent_id=:parent_id" , array('parent_id'=>$district));
//    Flight::json($subdistricts);
    Flight::json(array(
        'identifier'=>'id',
        'items' => $subdistricts
    ));
});

Flight::route('POST /school/delete/@id', function($id){
    //$data = Flight::request()->data;
    //var_dump($data);
    //Flight::checkLogin();

    $db = Flight::db();
    $flg = $db->delete("schools", array('id'=>$id));
    if($flg){
        Flight::json(array(
            'status'  => 'success',
            'message' => 'School deleted successfully.'
        ));
    }else{
        Flight::json(array(
            'status'  => 'failure',
            'message' => 'School could not be deleted.'
        ));
    }
});

Flight::route('POST /school/save', function(){
    Flight::checkLogin();

    $db = Flight::db();
    $data = array(
        'name'=>$_POST['name'],
        'eiin'=>$_POST['eiin'],
        'created'=> date("Y-m-d H:i:s"),
        'division'=>$_POST['division'],
        'district'=>$_POST['district'],
        'subdistrict'=>$_POST['subdistrict'],
        'school_type_id'=>$_POST['school_type_id'],
        'head_teacher_id'=>$_POST['head_teacher_id']
    );

    if(isset($_POST['id'])){
        $flg = $db->update("schools",$data, array('id'=>$_POST['id']));
    }else{
        $flg = $db->insert("schools",$data);
    }

    if($flg){
        Flight::json(array(
            'status'  => 'success',
            'message' => 'School Saved Successfully.'
        ));
    }else{
        Flight::json(array(
            'status'  => 'failure',
            'message' => 'Error Occurred.'
        ));
    }
});

Flight::route('/school/edit/@id', function($id){
    Flight::checkLogin();

    $db = Flight::db();
    $user_info = $db->fetchRow("SELECT id, name, school_type_id, division, district, subdistrict, eiin, head_teacher_id, DATE_FORMAT(modified,'%Y-%m-%d') AS modified FROM schools WHERE id=:id",
        array('id'=>$id)
    );
    if($user_info){
        Flight::json($user_info);
    }else{
        Flight::json(array(
            'status'  => 'failure',
            'message' => 'Invalid school id.'
        ));
    }
});

Flight::route('/teachers/@school_id', function($school_id){
    Flight::checkLogin();

    $db = Flight::db();

    $teachers = $db->fetchAll("SELECT * FROM teachers WHERE school_id=:school_id" , array('school_id'=>$school_id));
//    Flight::json($districts);
    Flight::json(array(
        'identifier'=>'id',
        'items' => $teachers
    ));
});

Flight::route('POST /teacher/save', function(){
    Flight::checkLogin();

    $db = Flight::db();
    $data =         array(
        'name'=>$_POST['name'],
        'school_id'=>$_POST['school_id']
    );

    if(isset($_POST['id']) && !empty($_POST['id'])){
        $flg = $db->update("teachers",$data, array('id'=>$_POST['id']));
    }else{
        $flg = $db->insert("teachers",$data);
    }

    if($flg){
        Flight::json(array(
            'status'  => 'success',
            'message' => 'School Saved Successfully.'
        ));
    }else{
        Flight::json(array(
            'status'  => 'failure',
            'message' => 'Error Occurred.'
        ));
    }
});
Flight::route('POST /teacher/mail', function(){
    echo 'mail testing';
    $to = "shazzadurrahaman@gmail.com";
    $subject = "Test Email from CRVS";

    $message = "
    <html>
    <head>
    <title>CRVS</title>
    </head>
    <body>
    <p>This is the confirmation that one Teacher has added to the server</p>
    <table>
    <tr>
    <th>Name</th>
    <th>School</th>
    </tr>
    <tr>
    <td>Test Teacher 1</td>
    <td>Uttara School Test</td>
    </tr>
    </table>
    </body>
    </html>
    ";

    // Always set content-type when sending HTML email
    $headers = "MIME-Version: 1.0" . "\r\n";
    $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

    // More headers
    $headers .= 'From: <shazzad@kiteplexit.com>' . "\r\n";
    // $headers .= 'Cc: myboss@example.com' . "\r\n";

    mail($to,$subject,$message,$headers);
});
Flight::route('/teacher/@id', function($id){
    Flight::checkLogin();

    $db = Flight::db();
    $teacher = $db->fetchRow("SELECT * FROM teachers WHERE id=:id",
        array('id'=>$id)
    );
    if($teacher){
        Flight::json($teacher);
    }else{
        Flight::json(array(
            'status'  => 'failure',
            'message' => 'Invalid teacher id.'
        ));
    }
});
Flight::route('POST /teacher/delete/@id', function($id){

    $db = Flight::db();
    $flg = $db->delete("teachers", array('id'=>$id));
    if($flg){
        Flight::json(array(
            'status'  => 'success',
            'message' => 'Teacher deleted successfully.'
        ));
    }else{
        Flight::json(array(
            'status'  => 'failure',
            'message' => 'Teacher could not be deleted.'
        ));
    }
});

// classes
Flight::route('/classes/@school_id', function($school_id){
    Flight::checkLogin();

    $db = Flight::db();

    $classes = $db->fetchAll("SELECT * FROM classes WHERE school_id=:school_id" , array('school_id'=>$school_id));
//    Flight::json($districts);
    Flight::json(array(
        'identifier'=>'id',
        'items' => $classes
    ));
});

Flight::route('POST /class/save', function(){
    Flight::checkLogin();

    $db = Flight::db();
    $data = array(
        'name'=>$_POST['name'],
        'class_teacher_id'=>$_POST['class_teacher_id'],
        'school_id'=>$_POST['school_id']
    );

    if(isset($_POST['id']) && !empty($_POST['id'])){
        $flg = $db->update("classes",$data, array('id'=>$_POST['id']));
    }else{
        $flg = $db->insert("classes",$data);
    }

    if($flg){
        Flight::json(array(
            'status'  => 'success',
            'message' => 'Class Saved Successfully.'
        ));
    }else{
        Flight::json(array(
            'status'  => 'failure',
            'message' => 'Error Occurred.'
        ));
    }
});
Flight::route('/class/@id', function($id){
    Flight::checkLogin();

    $db = Flight::db();
    $class = $db->fetchRow("SELECT * FROM classes WHERE id=:id",
        array('id'=>$id)
    );
    if($class){
        Flight::json($class);
    }else{
        Flight::json(array(
            'status'  => 'failure',
            'message' => 'Invalid class id.'
        ));
    }
});
Flight::route('POST /class/delete/@id', function($id){

    $db = Flight::db();
    $flg = $db->delete("classes", array('id'=>$id));
    if($flg){
        Flight::json(array(
            'status'  => 'success',
            'message' => 'Class deleted successfully.'
        ));
    }else{
        Flight::json(array(
            'status'  => 'failure',
            'message' => 'Class could not be deleted.'
        ));
    }
});


////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// students start
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

Flight::route('/students/@school_id/@class_id', function($school_id,$class_id){
    Flight::checkLogin();

    $db = Flight::db();

    $students = $db->fetchAll("SELECT * FROM students WHERE school_id=:school_id AND class_id=:class_id" ,
        array('school_id'=>$school_id,'class_id'=>$class_id));

    Flight::json(array(
        'identifier'=>'id',
        'items' => $students
    ));
});

Flight::route('POST /student/save', function(){
    Flight::checkLogin();

    $db = Flight::db();

    $PSC = 0;
    $JSC = 0;
    $SSC = 0;
    $ibtadayi = 0;
    $JDC = 0;
    $dakhil = 0;
    $student_father_death_if = 0;
    $student_mother_death_if = 0;
    if(isset($_POST['PSC'])){ if(!empty($_POST['PSC'])){ $PSC = 1;}}
    if(isset($_POST['JSC'])){ if(!empty($_POST['JSC'])){ $JSC = 1;}}
    if(isset($_POST['SSC'])){ if(!empty($_POST['SSC'])){ $SSC = 1;}}
    if(isset($_POST['ibtadayi'])){ if(!empty($_POST['ibtadayi'])){ $ibtadayi = 1;}}
    if(isset($_POST['JDC'])){ if(!empty($_POST['JDC'])){ $JDC = 1;}}
    if(isset($_POST['dakhil'])){ if(!empty($_POST['dakhil'])){ $dakhil = 1;}}
    if(isset($_POST['student_father_death_if'])){ if(!empty($_POST['student_father_death_if'])){ $student_father_death_if = 1;}}
    if(isset($_POST['student_mother_death_if'])){ if(!empty($_POST['student_mother_death_if'])){ $student_mother_death_if = 1;}}

    $data = array(
        'student_ed_id'=>$_POST['studentid'],
        'form_serial_no'=>$_POST['student_form_serial_no'],
        'name_ban'=>$_POST['student_name_ban'],
        'name_eng'=>$_POST['student_name_eng'],
        'birth_no'=>$_POST['student_birth_no'],
        'birth_place'=>$_POST['student_birth_place'],
        'birth_date'=>$_POST['student_birth_date'],
        'student_sex'=>$_POST['student_sex'],
        'student_nationality'=>$_POST['student_nationality'],
        'student_nationality_other'=>$_POST['student_nationality_other'],
        'student_classCode'=>$_POST['student_classCode'],

        'PSC'=>$PSC,
        'JSC'=>$JSC,
        'SSC'=>$SSC,
        'ibtadayi'=>$ibtadayi,
        'JDC'=>$JDC,
        'dakhil'=>$dakhil,
        'student_father_death_if'=>$student_father_death_if,
        'student_mother_death_if'=>$student_mother_death_if,

        'student_religion'=>$_POST['student_religion'],
        'student_relegion_other'=>$_POST['student_relegion_other'],
        'student_bloodbroup'=>$_POST['student_bloodbroup'],
        'student_spotmark'=>$_POST['student_spotmark'],
        'student_disability_if'=>$_POST['student_disability_if'],
        'student_disability_code'=>$_POST['student_disability_code'],

        'student_younger_brother_name_ban'=>$_POST['student_younger_brother_name_ban'],
        'student_younger_brother_name_eng'=>$_POST['student_younger_brother_name_eng'],
        'student_younger_brother_borndate'=>$_POST['student_younger_brother_borndate'],
        'student_younger_brother_brn'=>$_POST['student_younger_brother_brn'],

        'student_younger_brother_name_ban1'=>$_POST['student_younger_brother_name_ban1'],
        'student_younger_brother_name_eng1'=>$_POST['student_younger_brother_name_eng1'],
        'student_younger_brother_borndate1'=>$_POST['student_younger_brother_borndate1'],
        'student_younger_brother_brn1'=>$_POST['student_younger_brother_brn1'],

        'student_younger_brother_name_ban2'=>$_POST['student_younger_brother_name_ban2'],
        'student_younger_brother_name_eng2'=>$_POST['student_younger_brother_name_eng2'],
        'student_younger_brother_borndate2'=>$_POST['student_younger_brother_borndate2'],
        'student_younger_brother_brn2'=>$_POST['student_younger_brother_brn2'],

        'student_younger_brother_name_ban3'=>$_POST['student_younger_brother_name_ban3'],
        'student_younger_brother_name_eng3'=>$_POST['student_younger_brother_name_eng3'],
        'student_younger_brother_borndate3'=>$_POST['student_younger_brother_borndate3'],
        'student_younger_brother_brn3'=>$_POST['student_younger_brother_brn3'],

        'student_father_nid_have'=>$_POST['student_father_nid_have'],
        'student_father_nid'=>$_POST['student_father_nid'],
        'student_father_name_ban'=>$_POST['student_father_name_ban'],
        'student_father_name_eng'=>$_POST['student_father_name_eng'],
        'student_father_deathdate'=>$_POST['student_father_deathdate'],
        
        'student_mother_nid_have'=>$_POST['student_mother_nid_have'],
        'student_mother_nid'=>$_POST['student_mother_nid'],
        'student_mother_name_ban'=>$_POST['student_mother_name_ban'],
        'student_mother_name_eng'=>$_POST['student_mother_name_eng'],
        'student_mother_deathdate'=>$_POST['student_mother_deathdate'],
        
        'student_legalgurdian_nid'=>$_POST['student_legalgurdian_nid'],
        'student_legalgurdian_name_ban'=>$_POST['student_legalgurdian_name_ban'],
        'student_legalgurdian_rel'=>$_POST['student_legalgurdian_rel'],

        'student_address_pres'=>$_POST['student_address_pres'],
        'student_address_pres_word'=>$_POST['student_address_pres_word'],
        'student_address_pres_upozilla'=>$_POST['student_address_pres_upozilla'],
        'student_address_pres_zilla'=>$_POST['student_address_pres_zilla'],
        'student_address_pres_dist'=>$_POST['student_address_pres_dist'],
        'student_address_pres_postcode'=>$_POST['student_address_pres_postcode'],
        
        'student_address_parm'=>$_POST['student_address_parm'],
        'student_address_prmt_word'=>$_POST['student_address_prmt_word'],
        'student_address_prmt_upozilla'=>$_POST['student_address_prmt_upozilla'],
        'student_address_prmt_zilla'=>$_POST['student_address_prmt_zilla'],
        'student_address_prmt_dist'=>$_POST['student_address_prmt_dist'],
        'student_address_prmt_postcode'=>$_POST['student_address_prmt_postcode'],

        'student_operator_nid'=>$_POST['student_operator_nid'],
        'student_operator_name_ban'=>$_POST['student_operator_name_ban'],
        'student_operator_entrydate'=>$_POST['student_operator_entrydate'],

        'student_biometric_nid'=>$_POST['student_biometric_nid'],
        'student_biometric_name_ban'=>$_POST['student_biometric_name_ban'],
        'student_biometric_entrydate'=>$_POST['student_biometric_entrydate']

        //'class_id'=>$_POST['class_id'],
        //'school_id'=>$_POST['school_id']
    );
    


    if(isset($_POST['id']) && !empty($_POST['id'])){
        $flg = $db->update("students",$data, array('id'=>$_POST['id']));
    }else{
        $data['class_id'] = $_POST['class_id'];
        $data['school_id'] = $_POST['school_id'];
        $data['created'] = date("Y-m-d H:i:s");
        $flg = $db->insert("students",$data);
    }

    if($flg){
        Flight::json(array(
            'status'  => 'success',
            'message' => 'Student Saved Successfully.'
        ));
    }else{
        Flight::json(array(
            'status'  => 'failure',
            'message' => 'Error Occurred.'
        ));
    }
});
Flight::route('POST /student/healthidsave', function(){
    Flight::checkLogin();

    $db = Flight::db();
    $data = array(
        'healthform_formno'=>$_POST['healthform_formno'],
        'healthform_helthID'=>$_POST['healthform_helthID'],
        'healthform_name_eng'=>$_POST['healthform_name_eng'],
        'healthform_name_ban'=>$_POST['healthform_name_ban'],
        'healthform_birthdate'=>$_POST['healthform_birthdate'],
        'healthform_birthplace'=>$_POST['healthform_birthplace'],
        'healthform_sex'=>$_POST['healthform_sex'],
        'healthform_birth_no'=>$_POST['healthform_birth_no'],
        'healthform_religion'=>$_POST['healthform_religion'],
        'healthform_moblie'=>$_POST['healthform_moblie'],
        'healthform_occupation'=>$_POST['healthform_occupation'],
        'healthform_maritual_status'=>$_POST['healthform_maritual_status'],
        'healthform_maritual_name_eng'=>$_POST['healthform_maritual_name_eng'],
        'healthform_maritual_name_ban'=>$_POST['healthform_maritual_name_ban'],
        'healthform_maritual_nidbrn'=>$_POST['healthform_maritual_nidbrn'],
        'healthform_maritual_cellno'=>$_POST['healthform_maritual_cellno'],
        'healthform_father_name_ban'=>$_POST['healthform_father_name_ban'],
        'healthform_father_name_eng'=>$_POST['healthform_father_name_eng'],
        'healthform_father_nidbrn'=>$_POST['healthform_father_nidbrn'],
        'healthform_father_death_date'=>$_POST['healthform_father_death_date'],
        'healthform_mather_name_ban'=>$_POST['healthform_mather_name_ban'],
        'healthform_mather_name_eng'=>$_POST['healthform_mather_name_eng'],
        'healthform_mather_nidbrn'=>$_POST['healthform_mather_nidbrn'],
        'healthform_mather_death_date'=>$_POST['healthform_mather_death_date'],
        'healthform_present_address'=>$_POST['healthform_present_address'],
        'healthform_permanent_address'=>$_POST['healthform_permanent_address'],
        'healthform_operator_nid'=>$_POST['healthform_operator_nid'],
        'healthform_operator_entrydate'=>$_POST['healthform_operator_entrydate'],
        'healthform_biometric_nid'=>$_POST['healthform_biometric_nid'],
        'healthform_biometric_entrydate'=>$_POST['healthform_biometric_entrydate'],
    );
    


    if(isset($_POST['id_for_healthform']) && !empty($_POST['id_for_healthform'])){
        $flg = $db->update("students",$data, array('id'=>$_POST['id_for_healthform']));
    }else{
        //$data['class_id'] = $_POST['class_id'];
        //$data['school_id'] = $_POST['school_id'];
        $data['created'] = date("Y-m-d H:i:s");
        $flg = $db->insert("students",$data);
    }

    if($flg){
        Flight::json(array(
            'status'  => 'success',
            'message' => 'Student Saved Successfully.'
        ));
    }else{
        Flight::json(array(
            'status'  => 'failure',
            'message' => 'Error Occurred.'
        ));
    }
});
Flight::route('/student/@id', function($id){
    Flight::checkLogin();

    $db = Flight::db();
    $class = $db->fetchRow("SELECT * FROM students WHERE id=:id",
        array('id'=>$id)
    );
    if($class){
        Flight::json($class);
    }else{
        Flight::json(array(
            'status'  => 'failure',
            'message' => 'Invalid Student id.'
        ));
    }
});
Flight::route('POST /student/delete/@id', function($id){

    $db = Flight::db();
    $flg = $db->delete("students", array('id'=>$id));
    if($flg){
        Flight::json(array(
            'status'  => 'success',
            'message' => 'Student deleted successfully.'
        ));
    }else{
        Flight::json(array(
            'status'  => 'failure',
            'message' => 'Student could not be deleted.'
        ));
    }
});

Flight::start();
?>
