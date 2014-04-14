$(document).ready(function(){
   	$('.toHide').hide();
    updateMemberType();
  });

function updateMemberType(){
  	var selected_memtype = $('select#memselect option:selected').text();
    if(selected_memtype == "Resident"){
        $('.toHide').hide();
        $("#namelabel").html("First Name");
    }else if(selected_memtype == "Business"){
        $('.toHide').show();
        $("#orglabel").html("Business Name");
        $("#namelabel").html("Contact Name");
    }else if(selected_memtype == "Organization"){
        $('.toHide').show();
        $("#orglabel").html("Organization Name");
        $("#namelabel").html("Contact Name");
    }
}




