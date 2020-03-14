$(function() {
    $('#new-img').change(function(e){
        let file = e.target.files[0];
        let reader = new FileReader();

        if(file.type.indexOf("image") < 0){
            alart("画像ファイルを選択してください");
            return false;
        }

        reader.onload = (function(file){
            return function(e){
                $("#new-img_prev").attr("src", e.target.result);
                $("#new-img_prev").attr("title", file.name);
            };
        })(file);
        reader.readAsDataURL(file);

    });
});

