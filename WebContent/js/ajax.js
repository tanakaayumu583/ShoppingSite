console.log("aaa");
$('#inpMail').on('input',function(event) {
    var check_str = $(this).val();
    console.log(check_str);
    if(check_str){
        $.ajax({
            url: "/ShoppingSite/jp.co.aforce.servlet/Ajax_unique_check",
            type:"POST",
            data:{
                check: check_str,
                fuild: 'login_id',
            },
           success: function(response) {
           // リクエストが成功した場合の処理
           if(response =="Success"){
           $('#warning').hide();
            }else if(response =="Failure"){
            $('#warning').show();
            }
            },
            
           error: function(xhr) {
           // リクエストが失敗した場合の処理
           alert('吐き出し2');
           console.log(xhr.responseText); // エラーメッセージを表示
           }
        })
        
    }
});