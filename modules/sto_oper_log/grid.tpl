<!-- Data Table -->
<link rel="stylesheet" href="adm/inc/data_table/jquery.dataTables.min.css" />
<script src="adm/inc/data_table/jquery.dataTables.min.js"></script>
<script>
	$(document).ready(function() {
		$('#stat_table').DataTable( {
			"lengthMenu": [[20, 100, 500, -1], [20, 100, 500, "Все"]]
		} );
		table = $('#stat_table2').DataTable( {
			"lengthMenu": [[50, 100, 500, -1], [50, 100, 500, "Все"]]
		} );
	} );
</script>
<script>
function PlayCall(AudioFile, oper_id, phone,res,res_id){
	var audioPlayer = $('#audioPlayer');
	$('#oper_id').val(oper_id);
	$('#phone').val(phone);
	$('#res').text(res);
	$('#res_id').text(res_id);
	showControl();
	//alert(AudioFile);
	audioPlayer.attr({
          src: "http://192.168.0.200/freeswitch/"+AudioFile,
          autoplay: "autoplay"
		});
	
}
function saveControl(){
	var ROOT_ID = {ROOT_ID};
	var oper_id = $('#oper_id').val();
	var phone = $('#phone').val();
	var Ocenka = $('input[name=Ocenka]:checked').val();
	var res_id = $('#res_id').text(res_id);
	$.post("modules/sto_oper_log/control.php", {oper_id: oper_id, ROOT_ID: ROOT_ID, phone: phone, Ocenka: Ocenka, res_id:res_id},
		function(data){
			//alert(data);
			closeControl();
		});
	
}
function closeControl(){
	$("#audioPlayer").trigger('pause');
	$('#ControlLisenDiv').hide();
	$('#waitGear').hide();
}
function showControl(){
	$('#waitGear').show();
	$('#ControlLisenDiv').show();
}
function ShowStatTable(){
	var oper_type = 11;
	var oper_id = $('#oper_id option:selected').val();
	var stat_id = $('#stat_id option:selected').val();
	var date_start = $('#date_start').val();
	var date_end = $('#date_end').val();
	var limit = $('#limit option:selected').val();
	//alert(limit);
	$('#table_rows').html('');
	$('#waitGear').show();
	$.post("modules/sto_oper_log/show_stat.php", {oper_type: oper_type, oper_id:oper_id,stat_id:stat_id,date_start:date_start,date_end:date_end,limit:limit},
			function(data){
				//alert(data);
				var obj = jQuery.parseJSON(data);
				if(obj.result=='OK'){
					table.destroy();
					$('#table_rows').html(obj.html);
					console.log(obj.sql);
					table = $('#stat_table2').DataTable( {
						"lengthMenu": [[50, 100, 500, -1], [50, 100, 500, "Все"]]
					} );
					$('#waitGear').hide();
				}
				else{
					swal("Ошибка Сервера!", "Сбой записи !", "error");
				}
			});
}
</script>