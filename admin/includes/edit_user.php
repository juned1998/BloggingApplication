
<?php

if(isset($_GET['edit_user'])){
    $the_user_id = $_GET['edit_user'];
    
    
        $query = "SELECT * FROM users WHERE user_id = {$the_user_id}";

    $select_user_query = mysqli_query($connection,$query);

    while($row = mysqli_fetch_assoc($select_user_query)) {
            $user_id       = $row['user_id'];
            $username      = $row['username'];
            $user_password = $row['user_password'];
            $user_firstname= $row['user_firstname'];
            $user_lastname = $row['user_lastname'];
            $user_email    = $row['user_email'];
            $user_image    = $row['user_image'];
            $user_role     = $row['user_role'];
    
    }
    
    
}
   

   if(isset($_POST['create_user'])) {
   
            $user_firstname    = escape($_POST['user_firstname']);
            $user_lastname     = escape($_POST['user_lastname']);
            $user_role         = escape($_POST['user_role']);
            $username          = escape($_POST['username']);
            $user_email        = escape($_POST['user_email']);
            $user_password     = escape($_POST['user_password']);
    
//            $post_image        = escape($_FILES['image']['name']);
//            $post_image_temp   = escape($_FILES['image']['tmp_name']);
    
    
            
     //       $post_date         = escape(date('d-m-y'));

       
  //      move_uploaded_file($post_image_temp, "../images/$post_image" );
       

$query = "INSERT INTO users(user_firstname, user_lastname, user_role,username,user_email,user_password) ";

$query .= "VALUES('{$user_firstname}','{$user_lastname}','{$user_role}','{$username}','{$user_email}', '{$user_password}') "; 

$create_user_query = mysqli_query($connection, $query); 
confirmQuery($create_user_query); 

   }
    

    
    
?>

    <form action="" method="post" enctype="multipart/form-data">    
     
     
     
      <div class="form-group">
         <label for="user_firstname">Firstname</label>
          <input type="text" value="<?php echo $user_firstname; ?>" class="form-control" name="user_firstname">
      </div>
      
      
      

       <div class="form-group">
         <label for="user_lastname">Lastname</label>
          <input type="text" value="<?php echo $user_lastname; ?>" class="form-control" name="user_lastname">
      </div>
     
     
         <div class="form-group">
       
       <select name="user_role" id="">
           <option value='<?php echo $user_role; ?>'><?php echo $user_role; ?></option>
           <?php 
            if($user_role == 'admin')
                echo "<option value='subscriber'>subscriber</option>";
           else
                echo "<option value='admin'>admin</option>";
           ?>
       </select>
       
       
       
       
      </div>
      
<!--
      <div class="form-group">
         <label for="post_image">Post Image</label>
          <input type="file"  name="image">
      </div>
-->

      <div class="form-group">
         <label for="username">Username</label>
          <input type="text" value="<?php echo $username; ?>"class="form-control" name="username">
      </div>
      
      <div class="form-group">
         <label for="user_email">Email</label>
          <input value="<?php echo $user_email; ?>" type="email" class="form-control" name="user_email">
      </div>
      
      <div class="form-group">
         <label for="user_password">Password</label>
          <input value="<?php echo $user_password; ?>" type="password" class="form-control" name="user_password">
      </div>
      
      
      

       <div class="form-group">
          <input class="btn btn-primary" type="submit" name="create_user" value="Add User">
      </div>


</form>
    
    