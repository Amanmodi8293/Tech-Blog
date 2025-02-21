
$(document).ready(function (e) {

    $("#add-post-form").on("submit", function (event) {
//                    This code get called when from is submitted.
        event.preventDefault();

        let form = new FormData(this);

//                    Send AddPostServlet servlet

        $.ajax({
            url: "AddPostServlet",
            type: 'POST',
            data: form,
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                if (data.trim() == "Done") {
                    swal("Good job!", "Posted Successfully !", "success");
                } else {
                    swal("Error!!", "Something went wrong...try again.", "error");
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                swal("Error!!", "Something went wrong...try again.", "error");
            },
            processData: false,
            contentType: false
        });


    });
});

    