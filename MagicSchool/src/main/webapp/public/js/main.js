
$('.input-group-magic-school > input').on('focus',function(e){

    $(this).parent(this).children('label').css('bottom','100%').css('color','white');
    $(this).parent(this).children('label').removeClass('animation-shake-magic-school');
})
$('.input-group-focusout-magic-school > input').on('focusout',function(e){
    if($(this).val().length == 0)
        $(this).parent(this).children('label').css('bottom','10px').css('color','#8d8c86');

})
// $('#password').on('input', function (e) {
//     // e.preventDefault();
//     securityView(passwordSecurityPoint(this));
// })
function passwordSecurityPoint(element)
{
    let password = $(element).val();
    let point = 0;
    const special = new RegExp("[~!@#$%^&*()\_+`=<>,\\.:'{}()\"\-?\/]");
    if (special.test(password)&&/[^0-9]/g.test(password))
        point++;
    if(/[A-Z]/g.test(password))
        point++;
    if(/[0-9]/g.test(password))
        point++;
    if (password.length > 10)
        point++;
    if(password.length < 6)
        point = 0;
    return point;
}

function securityView(point){
    $('.box-security-lv1').css('backgroundColor',function(){
        if(point > 0)
        {
            return "#3B3B98";
        }
        else {
            return "white"
        }
    });
    $('.box-security-lv2').css('backgroundColor',function(){
        if(point > 1)
        {
            return "#B33771";
        }
        else {
            return "white"
        }
    });
    $('.box-security-lv3').css('backgroundColor',function(){
        if(point > 2)
        {
            return "#82589F";
        }
        else {
            return "white"
        }
    });
    $('.box-security-lv4').css('backgroundColor',function(){
        if(point > 3)
        {
            return "#6D214F";
        }
        else {
            return "white"
        }
    });
}