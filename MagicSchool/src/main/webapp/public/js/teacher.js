function closeAllWindows() {
    $('.edit-window-magic-school').css('display', 'none');
    $('.edit-window-magic-school input').val('');
    $('.background-opacity').css('display', 'none');
}
function OpenBackground() {
    $('.background-opacity').css('display', 'block');
}
$('.edit-name-magic-school').on('click', function () {
    OpenBackground();
    $('.edit-name-window-magic-school').css('display', 'block');
})
$('.edit-email-magic-school').on('click', function () {
    $('.edit-email-window-magic-school  #editEmailUserID').val($(this).parent().attr('userID'))
    OpenBackground();
    $('.edit-email-window-magic-school').css('display', 'block');
})
$('.edit-password-magic-school').on('click', function () {
    $('.edit-password-window-magic-school #editPasswordUserID').val($(this).parent().attr('userID'))
    OpenBackground();
    $('.edit-password-window-magic-school').css('display', 'block');
})
$('.add-course-magic-school').on('click',function(){
    OpenBackground();
    $('.add-course-window-magic-school').css('display', 'block');
})
$('.background-opacity > .btn').on('click', function (e) {
    closeAllWindows();
})
$('.add-chapter-magic-school').on('click', function(e){
    $('.add-Chapter-window-magic-school #courseIDChapter').val($(this).parent().attr('courseID'));
    OpenBackground();
    $('.add-Chapter-window-magic-school').css('display', 'block');
})
$('.delete-course-magic-school').on('click',function(e)
{
    $('#deleteCourseID').val($(this).parent().attr('courseID'));
    console.log($('#deleteCourseID').val());
    $('.delete-courses-window-magic-school .p-course-name-magic-school').html($(this).parent().attr('courseName'));
    OpenBackground();
    $('.delete-courses-window-magic-school').css('display', 'block');

})
$('.delete-chapter-magic-school').on('click',function(e){
    $('#deleteChapterID').val($(this).parent().attr('chapterID'));
    $('.delete-chapter-window-magic-school .p-chapter-name-magic-school').html($(this).parent().attr('chapterName'));
    OpenBackground();
    $('.delete-chapter-window-magic-school').css('display', 'block');
})
function checkFullName(element) {
    if ($(element).val() == 0) {
        alert("Full name is not empty");
        return false;
    }
    console.log(1231);
    if (!/^[a-z0-9A-Z\s]{4,50}$/g.test($(element).val())) {
        alert("invalid Full Name");
        return false;
    }
    return true;
}

function checkEmail(element) {
    if ($(element).val() == 0) {
        alert("Email is not empty");
        return false;
    }

    // $.getJSON(contextPath+'/Account/IsExistEmail?email='+$(element).val(),function(data){
    //
    // });
    if (!/^[a-zA-Z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$/g.test($(element).val())) {
        alert('invalid Email');
        return false;
    }
    return true;
}
function checkPassword(element,passwordSecurityPoint){
    if(passwordSecurityPoint<2){
        alert('password is not security');
        return false;
    }
    return true;
}