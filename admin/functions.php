<?php
function confirmQuery($result)
{
    global $connection;
    if(!result){
        die("Query failed".mysqli_error($result));
    }
    
}


function insert_categories(){
global $connection;    
if(isset($_POST['submit'])){
            $cat_title = $_POST['cat_title'];
            if($cat_title == "" || empty($cat_title)){
                echo "<h4 style = 'color:red;'>Title cannot be empty !<h4>";
            }
            else{
                $query = "INSERT INTO categories(cat_title)";
                $query.= "VALUE('{$cat_title}')";
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

?>