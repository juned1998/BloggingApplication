<?php include"includes/admin_header.php"; ?>
<?php// include "functions.php";
?>
<?php
//Using session for displaying user profile

if(isset($_SESSION['username'])){
    
    $username = $_SESSION['username'];
    
    $query = "SELECT * FROM users WHERE username = '{$username}'";
    $select_user_profile_query = mysqli_query($connection , $query);
    while($row = mysqli_fetch_array($select_user_profile_query)){
        
            $user_id       = $row['user_id'];
            $username      = $row['username'];
            $user_password = $row['user_password'];
            $user_firstname= $row['user_firstname'];
            $user_lastname = $row['user_lastname'];
            $user_email    = $row['user_email'];
            $user_role     = $row['user_role'];
    
    }
   
    
}
    
?>

<?php

   if(isset($_POST['edit_user'])) {
   
            $user_firstname    = escape($_POST['user_firstname']);
            $user_lastname     = escape($_POST['user_lastname']);
            $username          = escape($_POST['username']);
            $user_email        = escape($_POST['user_email']);

//            $post_image        = escape($_FILES['image']['name']);
//            $post_image_temp   = escape($_FILES['image']['tmp_name']);
    
    
            
     //       $post_date         = escape(date('d-m-y'));

       
  //      move_uploaded_file($post_image_temp, "../images/$post_image" );
       

       
       $query = "UPDATE users SET ";
          $query .="user_firstname = '{$user_firstname}', ";
          $query .="user_lastname = '{$user_lastname}', ";
          $query .="username = '{$username}', ";
          $query .="user_email = '{$user_email}' ";
          $query .= "WHERE username = '{$username}' ";
        
        $edit_user_query = mysqli_query($connection,$query);
        
        confirmQuery( $edit_user_query);

       
       

   }

















?>












        <!-- Navigation -->
 <?php include"includes/admin_navigation.php";?>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                <h1 class="page-header">
                    Welcome to Admin 
                    <small>Author</small>
                </h1>
            
<!--        Form start-->
                        
    <form action="" method="post" enctype="multipart/form-data">    
     
     
     
      <div class="form-group">
         <label for="user_firstname">Firstname</label>
          <input type="text" value="<?php echo $user_firstname; ?>" class="form-control" name="user_firstname">
      </div>
      
      
      

       <div class="form-group">
         <label for="user_lastname">Lastname</label>
          <input type="text" value="<?php echo $user_lastname; ?>" class="form-control" name="user_lastname">
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
          <input class="btn btn-primary" type="submit" name="edit_user" value="Update Profile">
      </div>


</form>                        
                        
                        
<!--        Form ends                -->
                        
                        
                        
                        
                        
                        
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

<?php include "includes/admin_footer.php";?>
