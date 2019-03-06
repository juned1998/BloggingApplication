
<?php
   
if(isset($_GET['p_id'])){
$query = "SELECT * from posts";
$the_post_id = $_GET['p_id'];
}
        $select_posts_by_id= mysqli_query($connection , $query);

        while($row = mysqli_fetch_assoc($select_posts_by_id))
        {
        $post_id = $row['post_id'];
         $post_author = $row['post_author'];  
         $post_title = $row['post_title'];      
         $post_category_id = $row['post_category_id'];  
         $post_status = $row['post_status'];  
         $post_image = $row['post_image'];  
        $post_tags = $row['post_tags']; 
        $post_comment_count = $row['post_comment_count'];
          $post_date = $row['post_date'];
    
        }
}
?>

    <form action="" method="post" enctype="multipart/form-data">    
     
     
      <div class="form-group">
         <label for="title">Post Title</label>
          <input type="text" class="form-control" name="title">
      </div>

         <div class="form-group">
       <label for="category">Category</label>
    <input type="text" class="form-control" name="post_category">
      </div>




       <div class="form-group">
         <label for="title">Post Author</label>
          <input type="text" class="form-control" name="author">
      </div> 
      
      

       <div class="form-group">
<!--
         <select name="post_status" id="">
             <option value="draft">Post Status</option>
             <option value="published">Published</option>
             <option value="draft">Draft</option>
         </select>
-->
           <label for="title">Post Status</label>
          <input type="text" class="form-control" name="author">
      </div>
      
      
      
    <div class="form-group">
         <label for="post_image">Post Image</label>
          <input type="file"  name="image">
      </div>

      <div class="form-group">
         <label for="post_tags">Post Tags</label>
          <input type="text" class="form-control" name="post_tags">
      </div>
      
      <div class="form-group">
         <label for="post_content">Post Content</label>
         <textarea class="form-control "name="post_content" id="" cols="30" rows="10">
         </textarea>
      </div>
      
      

       <div class="form-group">
          <input class="btn btn-primary" type="submit" name="create_post" value="Publish Post">
      </div>


</form>
    