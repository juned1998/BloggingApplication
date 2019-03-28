<?php

//GENERAL HELPERS START

function get_user_name(){
    return isset($_SESSION['username']) ? $_SESSION['username'] : null ;
}
//GENERAL HELPERS ENDS



//DATABASE HELPER FUNCTION START
function fetchRecords($result){
    return mysqli_fetch_array($result);
}

function query($query){
    global $connection;
    $result = mysqli_query($connection, $query);
    confirmQuery($result);
    return $result;
}


//DATABASE HELPER FUNCTION ENDS


//AUTHENTICATION HELPER FUNCTION START

function is_admin(){
    global $connection;

    if(isLoggedIn()){
        $query = "SELECT user_role FROM users WHERE user_id =".$_SESSION['user_id']."";
        $result = mysqli_query($connection , $query);
        confirmQuery($result);

        $row = fetchRecords($result);

        if($row['user_role']=='admin'){
            
            return true;

        } else{

            return false;
            
        }
    }
    return false;
}

function isLoggedIn(){
    if(isset($_SESSION['user_role'])){
        return true;
    }
   return false;
}

function loggedInUserId(){
    if(isLoggedIn()){
        $result = query("SELECT * FROM users WHERE username='" . $_SESSION['username'] ."'");
        confirmQuery($result);
        $user = mysqli_fetch_array($result);
        return mysqli_num_rows($result) >= 1 ? $user['user_id'] : false;
    }
    return false;

}


//AUTHENTICATION HELPER FUNCTION ENDS


//USER SPECIFIC STARTS

function get_all_user_posts(){
    return query("SELECT * FROM posts WHERE user_id=".loggedInUserId()."");
}

function get_all_posts_user_comments(){
    return query("SELECT * FROM posts
    INNER JOIN comments ON posts.post_id = comments.comment_post_id
    WHERE user_id=".loggedInUserId()."");

}

function get_all_user_categories(){
    return query("SELECT * FROM categories WHERE user_id=".loggedInUserId()."");
}

function get_all_user_published_posts(){
    return query("SELECT * FROM posts WHERE user_id=".loggedInUserId()." AND post_status='published'");
}

function get_all_user_draft_posts(){
    return query("SELECT * FROM posts WHERE user_id=".loggedInUserId()." AND post_status='draft'");
}

function get_all_user_approved_posts_comments(){
    return query("SELECT * FROM posts
    INNER JOIN comments ON posts.post_id = comments.comment_post_id
    WHERE user_id=".loggedInUserId()." AND comment_status='approved'");
}


function get_all_user_unapproved_posts_comments(){
    return query("SELECT * FROM posts
    INNER JOIN comments ON posts.post_id = comments.comment_post_id
    WHERE user_id=".loggedInUserId()." AND comment_status='unapproved'");
}


//USER SPECIFIC ENDS




function redirect($location){

    return  header("Location:".$location);
    
}

function users_online(){
    
    if(isset($_GET['onlineusers'])){
        global $connection;

            if(!$connection){
            session_start();
            include("../includes/db.php");

            $session = session_id();
            $time = time();
            $time_out_in_seconds = 5;
            $time_out = $time - $time_out_in_seconds;

            $query = "SELECT * FROM users_online where session = '$session'";
            $send_query = mysqli_query($connection , $query);
            $count = mysqli_num_rows($send_query);

            if($count == NULL){
            mysqli_query($connection ,"INSERT INTO users_online(session,time) VALUES('$session','$time')");
            }else{
            mysqli_query($connection ,"UPDATE users_online SET time = '$time' WHERE session = '$session'");    
            }

            $users_online_query = mysqli_query($connection ,"SELECT * FROM users_online WHERE time > '$time_out'");
            $count = mysqli_num_rows($users_online_query);
                echo $count;
            }


    }//GET request
}

users_online();



function confirmQuery($result)
{
    global $connection;
    if(!$result){
        die("Query failed".mysqli_error($connection));
    }
    
}


function insert_categories(){
global $connection;    
if(isset($_POST['submit'])){
            $cat_title = mysqli_real_escape_string($connection,$_POST['cat_title']);
            $user_id = loggedInUserId();
            if($cat_title == "" || empty($cat_title)){
                echo "<h4 style = 'color:red;'>Title cannot be empty !<h4>";
            }
            else{
                $query = "INSERT INTO categories(cat_title , user_id)";
                $query.= "VALUES('{$cat_title}' , '{$user_id}')";
                $create_category_query = mysqli_query($connection,$query);
                if(! $create_category_query){
                    die('Query Failed'.mysqli_error($connection));
                }
            }
                            
        }  
}

function findAllCategories(){
    global $connection;
    $query = "SELECT * from categories";
    if(!is_admin()){
        $query = "SELECT * FROM categories WHERE user_id=".loggedInUserId()."";
    }
$select_categories= mysqli_query($connection , $query);

while($row = mysqli_fetch_assoc($select_categories))
{
$cat_id = $row['cat_id'];    
$cat_title = $row['cat_title'];
echo"<tr>";    
echo"<td>{$cat_id}</td>";
echo"<td>{$cat_title}</td>";
echo"<td><a href='categories.php?delete={$cat_id}'>Delete</a></td>";
echo"<td><a href='categories.php?edit={$cat_id}'>Edit</a></td>"; 
echo "</tr>";    
}  
}

function deleteCategories(){
    global $connection;
      if(isset($_GET['delete'])){
        $the_cat_id = $_GET['delete'];
        $query = "DELETE FROM categories WHERE cat_id = {$the_cat_id}";
        $delete_category= mysqli_query($connection , $query);
        header("Location:categories.php");
    }  
}

function escape($string) {

global $connection;

return mysqli_real_escape_string($connection, trim($string));


}



/****** This function return row counts to admin index*******/
function recordCount($table){
  global $connection;  
$query = "SELECT * FROM ".$table;                    
$select_all_post = mysqli_query($connection , $query);
$result     = mysqli_num_rows($select_all_post);
confirmQuery($result);
return $result;   

}



function checkStatus($table , $column , $status){
global $connection;
 $query = "SELECT * FROM $table WHERE $column = '$status' ";
$result = mysqli_query($connection,$query);
return  mysqli_num_rows($result);
}

function checkUserRole($table , $column , $role){
global $connection;    
$query = "SELECT * FROM $table WHERE $column  = '$role' ";
$select_all_subscribers = mysqli_query($connection,$query);
return  mysqli_num_rows($select_all_subscribers);
}






function username_exists($username){

    global $connection;
    $query = "SELECT username FROM users WHERE username = '$username' ";
    $result = mysqli_query($connection , $query);
    confirmQuery($result);

    if(mysqli_num_rows($result) > 0 ){
        return true;
    }else{
        return false;
    }

}

function email_exists($email){

    global $connection;
    $query = "SELECT user_email FROM users WHERE user_email = '$email' ";
    $result = mysqli_query($connection , $query);
    confirmQuery($result);

    if(mysqli_num_rows($result) > 0 ){
        return true;
    }else{
        return false;
    }

}

function register_user($username,$email,$password){
    global $connection;

    $username = $_POST['username'];
    $email    = $_POST['email'];
    $password = $_POST['password'];

    // if(username_exists($username)){


    // }
    
  
        
        $username = mysqli_real_escape_string($connection , $username);
        $email    = mysqli_real_escape_string($connection , $email);
        $password = mysqli_real_escape_string($connection , $password);
        
        $password = password_hash($password , PASSWORD_BCRYPT , array('cost'=>12));
        $query = "INSERT INTO users(username,user_email,user_password , user_role) ";

        $query .= "VALUES('{$username}','{$email}', '{$password}' , 'subscriber' ) "; 

        $register_user_query = mysqli_query($connection, $query); 
        confirmQuery($register_user_query);    

        
    

}


function login_user($username , $password){

    global $connection;

    $username = trim($username);
    $password = trim($password);
 
    $username = mysqli_real_escape_string($connection , $username);
    $password = mysqli_real_escape_string($connection , $password);
    
    $query = "SELECT * FROM users WHERE username = '{$username}'";
    $select_user_query = mysqli_query($connection , $query );
    
    confirmQuery($select_user_query);
    
    while($row = mysqli_fetch_array($select_user_query)){
        $db_user_id = $row['user_id'];
        $db_username = $row['username'];
        $db_user_password = $row['user_password'];
        $db_user_firstname = $row['user_frstname'];
        $db_user_lastname = $row['user_lastname'];
        $db_user_role = $row['user_role'];
    }

    
    if(password_verify($password , $db_user_password)){
        $_SESSION['user_id'] = $db_user_id;
          $_SESSION['username'] = $db_username;
        $_SESSION['firstname'] = $db_user_firstname;
        $_SESSION['lastname'] = $db_user_lastname;
        $_SESSION['user_role'] = $db_user_role;
        
        redirect("/cms/admin/");
        
        
        
    } else{
       redirect("/cms/index.php");
    }
}

function count_records($result){
    return mysqli_num_rows($result);
}





?>