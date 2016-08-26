<style>
.stoDivPerezvon{
    display: none;
}
.stoDivOtkaz{
    display: none;
}
.stoDivOtrab{
    display: none;
}
</style>
<script type="text/javascript" charset="utf-8">
function checkCallsForm(){
	var send = true;
	var curentDayLimit = moment().format('YYYY-MM-DD HH:mm');
	var cal_input = $('#date_next_call').val();
	var inputDay = moment(cal_input, 'DD-MM-YYYY HH:mm').format('YYYY-MM-DD HH:mm');
	var call_comment = $('textarea#call_comment').val();
	var res_call_id = $('#res_call_id').val();
	//console.log(curentDayLimit);
	//console.log(inputDay);
	/*if(res_call_id!=2&&moment(inputDay).isBefore(curentDayLimit)){
		swal("Ошибка", 'Дата следующего звонка должна быть неранее сегодняшнего дня!', "error");
		send = false;
	}
	
	if(call_comment==''){
		//alert('Проверте заполнение даты выдачи документа!');
		swal("Ошибка заполнения!", "Заполните комментарий!", "error"); 
		send = false;
	}*/

    if(res_call_id==0){
        swal("Ошибка", 'Заполните результат звонка!', "error");
        send = false;
    }
	
	if(send){
		$('#CallsForm').submit();
	}
	
}

function checkUserForm(){
	var send = true;
	var name = $('#name').val();
	if(name==''){
		//alert('Проверте заполнение даты выдачи документа!');
		swal("Ошибка заполнения!", "Проверте заполнение поля имени!", "error"); 
		send = false;
	}
	
	
	if(send){
		$('#UserForm').submit();
	}
	
}

function changeResCall(){
    var res_call_id = $('#res_call_id').val();
    if(res_call_id==5){
        $('.stoDivPerezvon').hide();
        $('.stoDivOtrab').hide();
        $('.stoDivOtkaz').show();
    }

    if(res_call_id==4||res_call_id==2){
        $('.stoDivPerezvon').show();
        $('.stoDivOtkaz').hide();
        $('.stoDivOtrab').hide();
    }

    if(res_call_id==3){
        $('.stoDivPerezvon').hide();
        $('.stoDivOtkaz').hide();
        $('.stoDivOtrab').hide();
    }

    if(res_call_id==1){
        $('.stoDivPerezvon').hide();
        $('.stoDivOtkaz').hide();
        $('.stoDivOtrab').show();
    }
}
</script>
