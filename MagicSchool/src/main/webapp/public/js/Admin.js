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
$('.edit-teacher-email-magic-school').on('click', function () {
    $('.edit-email-window-magic-school  #editEmailUserID').val($(this).parent().attr('userID'))
    $('.edit-email-window-magic-school').css('display', 'block');
    OpenBackground();
})
$('.edit-teacher-password-magic-school').on('click', function () {
    $('.edit-teacher-password-window-magic-school #teacherID').val($(this).parent().attr('userID'))
    console.log($('.edit-teacher-password-window-magic-school #teacherID').val())
    $('.edit-teacher-password-window-magic-school').css('display', 'block');
    OpenBackground();
})
$('.background-opacity > .btn').on('click', function (e) {
    closeAllWindows();
})
$('.delete-cat-magic-school').on('click', function () {
    $('.delete-cat-window-magic-school  #deleteCatID').val($(this).parent().attr('catID'));
    $('.delete-cat-window-magic-school .p-cat-name-magic-school').html($(this).parent().attr('catName'));
    OpenBackground();
    $('.delete-cat-window-magic-school').css('display', 'block');
})
$('.add-cat-magic-school').on('click', function () {
    $('.edit-cat-window-magic-school .catOrParentID').val($(this).parent().attr('catID'));
    OpenBackground();
    $('.edit-cat-window-magic-school .btn-update-cat-magic-school').css('display', 'none');
    $('.edit-cat-window-magic-school .btn-add-cat-magic-school').css('display', 'block');
    $('.edit-cat-window-magic-school').css('display', 'block');
})
$('.update-cat-magic-school').on('click', function () {
    $('.edit-cat-window-magic-school .catOrParentID').val($(this).parent().attr('catID'));
    OpenBackground();
    $('.edit-cat-window-magic-school .btn-update-cat-magic-school').css('display', 'block');
    $('.edit-cat-window-magic-school .btn-add-cat-magic-school').css('display', 'none');
    $('.edit-cat-window-magic-school').css('display', 'block');
})

$('.delete-course-magic-school').on('click', function () {
    $('.delete-course-window-magic-school  #courseDeleteID').val($(this).parent().attr('courseID'));
    $('.delete-course-window-magic-school .p-cat-name-magic-school').html($(this).parent().attr('courseName'));
    OpenBackground();
    $('.delete-course-window-magic-school').css('display', 'block');
})
$('.delete-teacher-magic-school').on('click', function () {
    $('.delete-teacher-window-magic-school  #userDeleteID').val($(this).parent().attr('userID'));
    console.log($('.delete-teacher-window-magic-school  #userDeleteID').val());
    $('.delete-teacher-window-magic-school .p-cat-name-magic-school').html($(this).parent().attr('userName'));
    OpenBackground();
    $('.delete-teacher-window-magic-school').css('display', 'block');
})
$('.add-teacher-magic-school').on('click', function () {
    OpenBackground();
    $('.add-teacher-window-magic-school').css('display', 'block');
})
function checkFullName(element) {
    if ($(element).val() == 0) {
        alert("Full name is not empty");
        return false;
    }
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
function checkUsername(element) {
    if ($(element).val() == 0) {
        alert('Username is not empty');
        return false;
    }
    // $.getJSON(contextPath+'/Account/IsExistUsername?username='+$(element).val(),function(data){
    // });
    if (!/^[a-zA-Z0-9_]{4,50}$/g.test($(element).val())) {
        alert('invalid Username')
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