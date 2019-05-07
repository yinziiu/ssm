/* global M */
M.closure(function(require) {

    M.JApp('articletop', function(target) {
        if(target.hasClass("_j_top")){
            setTopArticle(target);
        }else{
            cancelTopArticle(target);
        }
    });
    var noteList = $(".notes_list");
    var noteListLi = noteList.find('li');

    function move(elem){
        var ltIE = !$.support.leadingWhitespace;
        setNotesHeight();
        setNotesAbsolute();
        orderNoteList(elem, ltIE);
        setParentAuto(ltIE);
    }

    function setNotesHeight(){
        var noteHeight = 0;
        noteListLi = $(".notes_list li");
        noteListLi.each(function(){
            var height = $(this).outerHeight();
            $(this).data("ht", height).css("top", noteHeight);
            noteHeight += height;
        });
        noteList.height(noteHeight);
    }

    function setNotesAbsolute(){
        noteList.addClass('abs');
    }

    function setParentAuto(ltIE){
        if(ltIE){
            setTimeout(function(){
                noteList.removeClass('abs').height('auto');
            }, 400);
        } else {
            $(".notes_list li").first().on('transitionend webkitTransitionEnd mozTransitionEnd oTransitionEnd MSTransitionEnd',function(){
                noteList.removeClass('abs').height('auto');
            });
        }
    }

    function orderNoteList(upLi, ltIE){
        var noteList = $(".notes_list li");
        
        var upLiIndex = upLi.index();
        var upLiHeight = upLi.data("ht");

        if(upLiIndex === 0){
            return;
        }

        noteList.each(function(i, ele){
            var ele = $(ele);
            var top = parseInt(ele.css("top"));
            upLiIndex > i && singleLiMove(ele, top, upLiHeight, ltIE);
            upLiIndex == i && singleLiMove(ele, 0, 0, ltIE);
        });
        setTimeout(function(){
            noteList.first().before(upLi);
        }, 400);
    }

    /*function isTopInCurrentPage(o){
        var min,max;
        min = max = $(".notes_list li").eq(1).data("order");
        noteListLi.each(function(i, elem){
            var order = elem.data("order");
            if(o == order) return;
            (order < min) && (min = order);
            (order > max) && (max = order);
        });
        if(min < o < max) {
            return true;
        } else {
            return false;
        }
    }*/

    function singleLiMove(elem, top, distance, ltIE){
        var top = top + distance ;
        ltIE ? elem.stop().animate({"top": top}, "normal") : elem.css("top", top);
    }

    /*function scrollToNoteList(){
        var scrollTop = $(".notes_list").eq(0).offset().top - 100;
        $('body, html').animate({"scrollTop" : scrollTop}, 400);
    }*/

    function setHtmlStatus(liobj, type)
    {

        if(type == 'cancel'){
            liobj.find("._j_up_icon").hide().end()
                .find(".ding")
                .removeClass("_j_cancel_top").removeClass("dinged")
                .addClass("_j_top");
            liobj.attr("data-top", 0);
        }else{
            liobj.find("._j_up_icon").show().end()
                .find(".ding")
                .removeClass("_j_top")
                .addClass("_j_cancel_top").addClass("dinged");
            liobj.attr("data-top", 1);
        }
    }
    function cancel_top(liobj)
    {
        setHtmlStatus(liobj, "cancel");
    }
    function set_top(liobj)
    {
        var cObj = noteList.find("li[data-top='1']");
        setHtmlStatus(liobj, "set");
        setHtmlStatus(cObj, "cancel");
        move(liobj);
    }
    function setTopArticle(obj) {
        var parLi = obj.parents("li");
        var iid = obj.data("iid");
        if(obj.hasClass("loading")){
            return false;
        }
        obj.addClass("loading");
        $.ajax({
            type: "POST",
            url: '/wo/ajax_post.php',
            data: {
                'sAction' : 'setTop',
                'iIid' : iid
            },
            dataType: 'json',
            success: function(data) {
                obj.removeClass("loading");
                if (! data.error) {
                    if(data.payload.ret == 1){
                        set_top(parLi);

                    }
                    else if(data.payload.ret == 2){
                        mAlert(data.payload.msg);
                    }
                    else if(data.payload.ret == 0){
                        show_login();
                    }
                }
                else{
                    mAlert(data.error.error);
                }
            }
        });
    }
    function cancelTopArticle(obj) {
        var parLi = obj.parents("li");
        if(obj.hasClass("loading")){
            return false;
        }
        obj.addClass("loading");
        $.ajax({
            type: "POST",
            url: '/wo/ajax_post.php',
            data: {
                'sAction' : 'cancelTop'
            },
            dataType: 'json',
            success: function(data) {
                obj.removeClass("loading");
                if (! data.error) {
                    if(data.payload.ret == 1){
                        cancel_top(parLi);
                    }
                    else if(data.payload.ret == 0){
                        show_login();
                    }
                }
                else{
                    mAlert(data.error.error);
                }
            }
        });
    }
});
