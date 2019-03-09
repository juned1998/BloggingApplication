
<?php

   
if(isset($_GET['p_id'])){

$the_post_id = $_GET['p_id'];
}
        $query = "SELECT * from posts WHERE post_id = $the_post_id";
        $select_posts_by_id= mysqli_query($connection , $query);

        while($row = mysqli_fetch_assoc($select_posts_by_id))
        {
        $post_id = $row['post_id'];
         $post_author = $row['post_author'];  
         $post_title = $row['post_title'];
        $post_content = $row['post_content'];     
         $post_category_id = $row['post_category_id'];  
         $post_status = $row['post_status'];  
         $post_image = $row['post_image'];  
        $post_tags = $row['post_tags']; 
        $post_comment_count = $row['post_comment_count'];
          $post_date = $row['post_date'];
    
        }
    
        if(isset($_POST['update_post'])){
            $post_title        = escape($_POST['title']);
            $post_author         = escape($_POST['author']);
            $post_category_id  = escape($_POST['post_category']);
            $post_status       = escape($_POST['post_status']);
    
            $post_image        = escape($_FILES['image']['name']);
            $post_image_temp   = escape($_FILES['image']['tmp_name']);
    
    
            $post_tags         = escape($_POST['post_tags']);
            $post_content      = escape($_POST['post_content']);
            
            move_uploaded_file($post_image_temp , "../images/$post_image");
            
            if(empty($post_image)) {
        
        $query = "SELECT * FROM posts WHERE post_id = $the_post_id ";
        $select_image = mysqli_query($connection,$query);
            
        while($row = mysqli_fetch_array($select_image)) {
            
           $post_image = $row['post_image'];
        
        }
            }
            
            $query = "UPDATE posts SET ";
          $query .="post_title  = '{$post_title}', ";
          $query .="post_category_id = '{$post_category_id}', ";
          $query .="post_date   =  now(), ";
          $query .="post_author = '{$post_author}', ";
          $query .="post_status = '{$post_status}', ";
          $query .="post_tags   = '{$post_tags}', ";
          $query .="post_content= '{$post_content}', ";
          $query .="post_image  = '{$post_image}' ";
          $query .= "WHERE post_id = {$the_post_id} ";
        
        $update_post = mysqli_query($connection,$query);
        
        confirmQuery($update_post);
            
        }



?>

    <form action="" method="post" enctype="multipart/form-data">    
     
     
      <div class="form-group">
         <label for="title">Post Title</label>
          <input value="<?php echo $post_title; ?>" type="text" class="form-control" name="title">
      </div>

              <div class="form-group">
       <label for="categories">Categories</label>
       <select name="post_category" id="">
           
      <?php

        $query = "SELECT * FROM categories ";
        $select_categories = mysqli_query($connection,$query);
        
        confirmQuery($select_categories);


        while($row = mysqli_fetch_assoc($select_categories )) {
        $cat_id = $row['cat_id'];
        $cat_title = $row['cat_title'];


        if($cat_id == $post_category_id) {

      
        echo "<option selected value='{$cat_id}'>{$cat_title}</option>";


        } else {

          echo "<option value='{$cat_id}'>{$cat_title}</option>";


        }

            
        }

?>
           
        
       </select>

      </div>

       <div class="form-group">
         <label for="title">Post Author</label>
          <input value="<?php echo $post_author; ?>" type="text" class="form-control" name="author">
      </div> 
      
      

       <div class="form-group">
<label for="title">Post Status</label>
         <select name="post_status" id="">
             <option value='<?php echo $post_status;?>'><?php echo $post_status;?></option>
             <?php
             if($post_status == 'draft'){
                echo "<option value='published'>Publish</option>";
             }
             else {
                echo "<option value='draft'>Draft</option>";
             }
             ?>
         </select>
      </div>
      
      
      
    <div class="form-group">
        <img width="100" src="../images/<?php echo $post_image;?>">
        <label for="post_image">Post Image</label>
          <input type="file"  name="image">
         
      </div>

      <div class="form-group">
         <label for="post_tags">Post Tags</label>
          <input value="<?php echo $post_tags; ?>" type="text" class="form-control" name="post_tags">
      </div>
      
      <div class="form-group">
         <label for="post_content">Post Content</label>
         <textarea  class="form-control "name="post_content" id="editor" cols="30" rows="10"><?php echo $post_content;?></textarea>
      </div>
      
      

       <div class="form-group">
          <input class="btn btn-primary" type="submit" name="update_post" value="Update Post">
      </div>


</form>
    