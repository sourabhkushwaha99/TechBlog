

 
 function doLike(pid, uid)
 {
     console.log(pid + "," + uid)
     const d = {
         uid: uid,
         pid: pid,
         operation: 'like'
     }

     $.ajax({
         url: "LikeServlet",
         data: d,
         success: function (data, textStatus, jqXHR) {
             console.log(data);
             
		//	 if(data.trim() == "true"){
		//		let c = $(".like-counter").html()  ;
		//		let likeButton = $(`#like-button-${uid}`);
				
				
		//		likeButton.removeClass('btn-outline-primary').addClass('btn-primary');
			
		//		c++;
			
				
		//		$(".like-counter").html(c) ;
				
				
				
		//	 }else{
		//		let likeButton = $(`#like-button-${uid}`);
				
		//		likeButton.removeClass('btn-primary').addClass('btn-outline-primary');
		//	 }
			 

		         if(data.trim() == "true" || data.trim() == "false"){
		             // Find the specific like counter and button for this post and update it
		             let likeCounter = $(`#like-counter-${pid}`);
		             let likeButton = $(`#like-button-${pid}`);
		             let count = parseInt(likeCounter.html().trim());
		             
		             if (data.trim() == "true") {
		                 count++;
		                 likeButton.removeClass('btn-outline-primary').addClass('btn-primary');
		             } else {
		                 count--;
		                 likeButton.removeClass('btn-primary').addClass('btn-outline-primary');
		             }
		             
		             likeCounter.html(count);
		         }
			 
			 
			 
         },
         error: function (jqXHR, textStatus, errorThrown) {
             console.log(data)
         }
     })
 }