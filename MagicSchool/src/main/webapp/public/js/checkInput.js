function checkEmpty(element, ){
    const text = $(element).val();
    if(text.length == 0){
        $(element).parent(element).children('label').prop('title','not empty');
        $(element).parent(element).children('label').css('color','#e66767');
        $(element).parent(element).children('label').addClass('animation-shake-magic-school');
        $(element).parent(element).children('label').css('bottom','10px').css('color','#e66767');
        $(element).get(0).setCustomValidity('not empty');
    }
}
function checkUsername(contextPath){
    $.getJSON(contextPath+'/Account/IsExistUsername?username='+$('#username').val(),function(data){
        if(data == true)
        {
            $('#username').parent().children('label').prop('title','username already exists');
            $('#username').parent().children('label').css('color','#e66767');
            $('#username').parent().children('label').addClass('animation-shake-magic-school');
            $('#username').get(0).setCustomValidity('username already exists');
            return;
        }
    });
        if(!/^[a-zA-Z0-9_]{4,50}$/g.test($('#username').val())){
            $('#username').parent().children('label').prop('title','cannot contain special characters and 4<length<50');
            $('#username').parent().children('label').css('color','#e66767');
            $('#username').parent().children('label').addClass('animation-shake-magic-school');
            $('#username').get(0).setCustomValidity('cannot contain special characters and 4<length<50');
            return;
        }
        $('#username').get(0).setCustomValidity('');
        $('#username').parent().children('label').prop('title','');
        $('#username').parent().children('label').removeClass('animation-shake-magic-school');
}
function checkPassword(passwordSecurityPoint){
   if(passwordSecurityPoint<2){
       $('#password').parent().children('label').prop('title','is not security');
       $('#password').parent().children('label').css('color','#e66767');
       $('#password').parent().children('label').addClass('animation-shake-magic-school');
       $('#password').get(0).setCustomValidity('is not security');
       return;
   }
   $('#password').get(0).setCustomValidity('');
   $('#password').parent().children('label').prop('title','');
   $('#password').parent().children('label').removeClass('animation-shake-magic-school');
}
function checkConfirm(){
    if($('#confirm').val().length === 0) return;
    if ($('#confirm').val() !== $('#password').val()){
        $('#confirm').parent().children('label').prop('title','not equal password');
        $('#confirm').parent().children('label').css('color','#e66767');
        $('#confirm').parent().children('label').addClass('animation-shake-magic-school');
        $('#confirm').get(0).setCustomValidity('not equal password');
        return;
    }
    $('#confirm').get(0).setCustomValidity('');
    $('#confirm').parent().children('label').prop('title','');
    $('#confirm').parent().children('label').removeClass('animation-shake-magic-school');
}
function checkFullName()
{
    if(!/^[a-zA-Z\s]{4,50}$/g.test($('#name').val())){
        $('#name').parent().children('label').prop('title','invalid');
        $('#name').parent().children('label').css('color','#e66767');
        $('#name').parent().children('label').addClass('animation-shake-magic-school');
        $('#name').get(0).setCustomValidity('invalid');
        return;
    }
    $('#name').get(0).setCustomValidity('');
    $('#name').parent().children('label').prop('title','');
    $('#name').parent().children('label').removeClass('animation-shake-magic-school');
}
function checkEmail(contextPath)
{
    $.getJSON(contextPath+'/Account/IsExistEmail?email='+$('#email').val(),function(data){
        if(data === true)
        {
            $('#email').parent().children('label').prop('title','email already exists');
            $('#email').parent().children('label').css('color','#e66767');
            $('#email').parent().children('label').addClass('animation-shake-magic-school');
            $('#email').get(0).setCustomValidity('email already exists');
            return;
        }
    });
    if(!/^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$/g.test($('#email').val())){
        $('#email').parent().children('label').prop('title','invalid');
        $('#email').parent().children('label').css('color','#e66767');
        $('#email').parent().children('label').addClass('animation-shake-magic-school');
        $('#email').get(0).setCustomValidity('invalid');
        return;
    }
    $('#email').get(0).setCustomValidity('');
    $('#email').parent().children('label').prop('title','');
    $('#email').parent().children('label').removeClass('animation-shake-magic-school');
}
$('#form-login').on('submit',function(e){
    // e.preventDefault();
})
$('#form-register').on('submit',function(e){
    // e.preventDefault();
})

