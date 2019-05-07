
(function(){

    var SlideDown = function( option ){
        this.option = option;
    }
    SlideDown.prototype.display = function(){

        var winWidth = $(window).width(), self = this, timer;

        $('body').prepend(
            '<div id="ywf_topimg" style="display:none; width:'+winWidth+'px; margin:0 auto; text-align:center; overflow: hidden; background:#5FCFE7; ">' +
                '<a target="_blank" href="/sales/" style="display:block; width:100%; height:100%;" >' +
                    '<img src="http://images.mafengwo.net/images/mdd/yiwofeng/topimg_20130829.jpg" />' +
                '</a>' +
            '</div>');

        setTimeout(function(){
            $('#ywf_topimg').slideDown(1000);

            setTimeout(function(){
                $('#ywf_topimg').animate(
                    {height: 100},
                    {complete: function(){
                        $('#ywf_topimg').bind('mouseenter', function(){
                            timer = setTimeout(function(){
                                $('#ywf_topimg').animate({height:208}, {duration:500});
                            }, 500);
                        });
                        $('#ywf_topimg').bind('mouseleave', function(){
                            clearTimeout(timer);
                            $('#ywf_topimg').animate({height:100},{duration:500});
                        });
                    }}
                );
            }, 8 * 1000);
        }, 1500);

        $('#ywf_topimg').bind('click',function(){
            $.get('/ajax/ajax_op_log_api.php?type=yiwofeng&mk='+encodeURIComponent('V4_目的地天窗跳转'));
        });
    }

    $(function(){
        return false;
        if(location.href.indexOf('sales') > 0) return false;
        
//        if($('.ub-info>a').attr('href') != '/u/17172230.html') return;
        
        $.getJSON('/sales/ajax.php', { act: 'GetInterest' }, function(json){
            if(json.ret == 1){
                (new SlideDown({ sales_id: json.msg })).display();
                $.get('/ajax/ajax_op_log_api.php?type=yiwofeng&mk='+encodeURIComponent('V5_天窗_弹出总数'));

            }
        });
    });

})();

(function ($) {
    $.asset = {
        Err:"服务器繁忙！"
    };
    function bindmodel() {
        $().keypress(modelstate).keyup(modelstate).mousedown(modelstate);
    }

    function unbindmodel() {
        $().unbind("keypress", modelstate).unbind("keyup", modelstate).unbind("mousedown", modelstate);
    }

    function modelstate(e) {
        var _r = !$(e.target).parents('#popup_container')[0];
        if (_r) {
            setTimeout(function () {
                try {
                    $("#popup_container input").eq(0).focus();
                } catch (_) {
                }
                ;
            }, 10);
        }
    }

    ;
    $.alerts = {

        // These properties can be read/written by accessing $.alerts.propertyName from your scripts at any time

        verticalOffset:-75, // vertical offset of the dialog from center screen, in pixels
        horizontalOffset:0, // horizontal offset of the dialog from center screen, in pixels/
        repositionOnResize:true, // re-centers the dialog on window resize
        overlayOpacity:.6, // transparency level of overlay
        overlayColor:'#000000', // base color of overlay
        draggable:false, // make the dialogs draggable (requires UI Draggables plugin)
        okButton:'&nbsp;\u786e\u5b9a&nbsp;', // text for the OK button
        cancelButton:'&nbsp;\u53d6\u6d88&nbsp;', // text for the Cancel button
        dialogClass:null, // if specified, this class will be applied to all dialogs
        modal:true,

        // Public methods

        alert:function (message, title, callback, icon, hide_close) {
            if (title == null || typeof(title) == 'undefined') {
                title = message;
                message = '';
            }
            if(icon == null || typeof(icon) == 'undefined') {
                icon = 1;
            }
            return $.alerts._show(title, message, null, 'alert', icon, function (result) {
                if (callback) {
                    var _ret = callback(result);
                    if (_ret === true || typeof(_ret) == "undefined") {
                        $.alerts._hide();
                    }
                    else {
                        $.alerts._errtip(_ret);
                    }
                }
                else {
                    $.alerts._hide();
                }
            }, hide_close);
        },

        confirm:function (message, callback, title, icon, hide_close) {
            if (title == null || typeof(title) == 'undefined') {
                title = message;
                message = '';
            }
            if(icon == null || typeof(icon) == 'undefined') {
                icon = 2;
            }
            return  $.alerts._show(title, message, null, 'confirm', icon, function (result) {
                if (callback) {
                    var _ret = callback(result);
                    if (_ret === true || typeof(_ret) == "undefined") {
                        $.alerts._hide();
                    }
                    else {
                        $.alerts._errtip(_ret);
                    }
                }
                else {
                    $.alerts._hide();
                }
            }, hide_close);
        },

        prompt:function (message, callback, value, title, hide_close) {
            if (title == null || typeof(title) == 'undefined') title = '请您输入';
            return $.alerts._show(title, message, value, 'prompt', -1, function (result) {
                if (callback) {
                    var _ret = callback(result);
                    if (_ret === true || typeof(_ret) == "undefined") {
                        $.alerts._hide();
                    }
                    else {
                        $.alerts._errtip(_ret);
                    }
                }
                else {
                    $.alerts._hide();
                }
            }, hide_close);
        },

        // Private methods

        _show:function (title, msg, value, type, icon, callback, hide_close) {

            $.alerts._hide();
            $.alerts._overlay('show');

            $("BODY").append(
                '<div id="popup_container" class="popup-box">'
                    + '<a class="close-btn" href="javascript:void(0);" id="popup_close"><i></i></a>'
                    + '<div class="pop-ico" id="popup_icon"></div>'
                    + '<div class="pop-ctn"><p class="hd" id="popup_title"></p><p class="bd" id="popup_message"></p></div>'
                    + '<div class="pop-btn" id="popup_btn"></div>'
                    + '</div>');

            if ($.alerts.dialogClass) $("#popup_container").addClass($.alerts.dialogClass);

            if(icon == -1) {
                $("#popup_icon").remove();
            } else {
                icon = parseInt(icon) > 3 ? 3 : parseInt(icon);
                $("#popup_icon").html('<i class="i' + icon + '"></i>')
            }

            $("#popup_content").addClass(type);
            $("#popup_title").html(title.replace(/\n/g, ''));
            $("#popup_message").html(msg.replace(/\n/g, ''));

            if(hide_close) {
                $("#popup_close").hide();
            } else {
                $("#popup_close").click(function () {
                    $.alerts._hide();
                });
            }

            switch (type) {
                case 'alert':
                    $("#popup_btn").html('<input type="button" class="btn-sub" value="' + $.alerts.okButton + '" id="popup_ok" />');
                    $("#popup_ok").click(function () {
                        setTimeout(function () {
                            callback(true);
                        }, 10);
                    });
                    $("#popup_ok").focus().keypress(function (e) {
                        if (e.keyCode == 13 || e.keyCode == 27) $("#popup_ok").trigger('click');
                    });
                    if ($.alerts.modal)bindmodel();
                    break;
                case 'confirm':
                    $("#popup_btn").html('<input type="button" class="btn-sub" value="' + $.alerts.okButton + '" id="popup_ok" /><input type="button" class="btn-esc" value="' + $.alerts.cancelButton + '" id="popup_cancel" />');
                    $("#popup_ok").click(function() {
                        setTimeout(function () {
                            callback(true);
                        }, 10);
                    });
                    $("#popup_cancel").click(function () {
                        setTimeout(function () {
                            callback(false);
                        }, 10);
                    });
                    $("#popup_ok").focus();
                    $("#popup_ok").keypress(function (e) {
                        if (e.keyCode == 13) $("#popup_ok").trigger('click');
                    });
                    $("#popup_cancel").keypress(function (e) {
                        if (e.keyCode == 13)  $("#popup_cancel").trigger('click');
                    });
                    if($.alerts.modal) bindmodel();
                    break;
                case 'prompt':
                    $("#popup_title").closest('.pop-ctn').removeClass('pop-ctn').addClass('pop-con');
                    $("#popup_message").html('<input type="text" class="oneline" id="popup_prompt" />');
                    $("#popup_btn").html('<input type="button" class="btn-sub" value="' + $.alerts.okButton + '" id="popup_ok" /> <input type="button" class="btn-esc" value="' + $.alerts.cancelButton + '" id="popup_cancel" />');
                    $("#popup_ok").click(function () {
                        var val = $("#popup_prompt").val();
                        setTimeout(function () {
                            callback(val);
                        }, 10);
                    });
                    $("#popup_cancel").click(function () {
                        $.alerts._hide();
                        setTimeout(function () {
                            if (callback) callback(null);
                        }, 10);
                    });
                    $("#popup_prompt, #popup_ok").keypress(function (e) {
                        if (e.keyCode == 13) $("#popup_ok").trigger('click');
                        if (e.keyCode == 27) $("#popup_cancel").trigger('click');
                    });
                    $("#popup_cancel").keypress(function (e) {
                        if (e.keyCode == 13) $("#popup_cancel").trigger('click');
                        if (e.keyCode == 27) $("#popup_cancel").trigger('click');
                    });
                    if (value) $("#popup_prompt").val(value);
                    if ($.alerts.modal)bindmodel();
                    $("#popup_prompt").focus().select();

                    break;
            }


            // Make draggable
            if ($.alerts.draggable) {
                try {
                    $("#popup_container").draggable({ handle:$("#popup_title") });
                    $("#popup_title").css({ cursor:'move' });
                } catch (e) { /* requires jQuery UI draggables */
                }
            }
            return $("#popup_container");
        },
        _hide:function () {
            $("#popup_container").remove();
            if ($.alerts.modal)unbindmodel();
            $.alerts._overlay('hide');
        },
        _errtip:function (msg) {
            $("#popup_errortip").html(msg).show();
        },

        _overlay:function (status) {
            switch (status) {
                case 'show':
                    $.alerts._overlay('hide');

                    var o = $('<div id="popup_overlay"></div>').css({
                        position:'fixed',
                        zIndex:999,
                        top:0,
                        left:0,
                        width:'100%',
                        height:'100%',
                        background:$.alerts.overlayColor,
                        opacity:$.alerts.overlayOpacity
                    }).appendTo($("BODY"));
                    var ifra = $('<iframe src="javascript:false;document.write(\'\');" class="popup_overlayiframe"></iframe>').css({opacity:0});

                    var ie6 = $.browser.msie && ($.browser.version == "6.0") && !$.support.style;

                    if (ie6) {
                        o.html('<p style="width:100%;height:100%"/>').css("height", $(window).height()).css("width", $(window).width()).prepend(ifra);
                        o = o.css({position:'absolute'})[0];
                        try {
                            for (var y in {Top:1, Left:1})
                                o.style.setExpression(y.toLowerCase(), "(_=(document.documentElement.scroll" + y + " || document.body.scroll" + y + "))+'px'");
                        }
                        catch (e) {
                            ;
                        }

                    }
                    break;
                case 'hide':
                    $("#popup_overlay").remove();
                    break;
            }
        },

        //tiny alert
        _timeid:0,
        _overShow:function (msg, timespan) {
            timespan = timespan || 3000;
            $("#over_container").remove();
            $("body").append('<div id="over_container" style="display:none"><div id="over_message"></div></div>');
            $("#over_message").text(msg).html($("#over_message").text().replace(/\n/g, "<br />"));
            $("#over_container").show();
            clearTimeout(this._timeid);
            this._timeid = setTimeout(function (cb) {
                $("#over_container").hide("fast", function () {
                    $(this).remove();
                });
            }, timespan);
            return $("#over_container");
        },
        overAlert:function (msg, time) {
            return $.alerts._overShow(msg, time);
        },
        //end tiny alert

        _reposition:function () {
            var top = (($(window).height() / 2) - ($("#popup_container").outerHeight() / 2)) + $.alerts.verticalOffset;
            var left = (($(window).width() / 2) - ($("#popup_container").outerWidth() / 2)) + $.alerts.horizontalOffset;
            if (top < 0) top = 0;
            if (left < 0) left = 0;

            // IE6 fix
            if ($.browser.msie && parseInt($.browser.version) <= 6) top = top + $(window).scrollTop();

            $("#popup_container").css({
                top:top + 'px',
                left:left + 'px'
            });
            $("#popup_overlay").height($(document).height());
        },

        _maintainPosition:function (status) {
            if ($.alerts.repositionOnResize) {
                switch (status) {
                    case true:
                        $(window).bind('resize', $.alerts._reposition);
                        break;
                    case false:
                        $(window).unbind('resize', $.alerts._reposition);
                        break;
                }
            }
        }

    }

    $.fn.mTipHide = function () {
        if ($(this).data("mtip")) {
            $(this).data("mtip").css("right", null);
            $(this).data("mtip").css("left", "-1000px");
        }
    };
    $.fn.mTip = function (msg, content, position) {
        var content = content || "";
        var _template = '<div class="eject_container"><div class="eject">'
            + '<p class="eject_position"></p>'
            + '<div class="eject_close btn_eject_close"><img title="关闭" src="http://images.mafengwo.net/images/wengweng/btn_close.gif" /></div>'
            + '<div>'
            + '<div class="eject_tit">' + msg + '</div>'
            + '<div class="eject_ts">' + content + '</div>'
            + '</div>'
            + '<div class="m_t_10">'
            + '</div>'
            + '</div></div>';

        return this.each(function () {
            var _p = $(this).offset();
            var _el = $(_template);
            if ($(this).data("mtip")) {
                if (position == "left") {
                    $(this).data("mtip").css("left", null);
                    $(this).data("mtip").css("right", $(this).data("pos") + 'px');
                }
                else {
                    $(this).data("mtip").css("left", $(this).data("pos") + 'px');
                }
                if (msg != "") {
                    $(this).data("mtip").find("div.eject_tit").html(msg);
                }
                if (content != "") {
                    $(this).data("mtip").find("div.eject_ts").html(content);
                }
                return;
            }
            $("BODY").append(_el);
            _el.hide().fadeIn("slow");
            _el.find(".btn_eject_close").click(function () {
                _el.css("right", null);
                _el.css("left", "-1000px");
            });

            if (position == "left") {
                var _r = ($(window).width() - _p.left) + 10;
                _el.find(".eject_position").addClass("eject_r");
                _el.css({
                    top:_p.top + 'px',
                    right:_r + 'px'
                });
                $(this).data("pos", _r);
            } else if (position == "bottom") {
                _el.find(".eject_position").addClass("eject_t");
                _el.css({
                    top:(_p.top + $(this).outerHeight()) + 10 + 'px',
                    left:_p.left + 'px'
                });
                $(this).data("pos", _p.left);
            } else if (position == "top") {
                _el.find(".eject_position").addClass("eject_b");
                _el.css({
                    top:(_p.top - _el.outerHeight()) - 10 + 'px',
                    left:_p.left + 'px'
                });
                $(this).data("pos", _p.left);
            }
            else {
                _el.find(".eject_position").addClass("eject_t");
                _el.css({
                    top:(_p.top + $(this).outerHeight()) + 10 + 'px',
                    left:_p.left + 'px'
                });
                $(this).data("pos", _p.left);
            }
            $(this).data("mtip", _el);

        });
    }
    // Shortuct 浮层 functions
    mAlert = function (message, title, callback, icon, hide_close) {
        return $.alerts.alert(message, title, callback, icon, hide_close);
    }

    mConfirm = function (message, callback, title, icon, hide_close) {
        return $.alerts.confirm(message, callback, title, icon, hide_close);
    };

    mPrompt = function (message, callback, value, title, hide_close) {
        return $.alerts.prompt(message, callback, value, title, hide_close);
    };

    mTinyAlert = function (message, time) {
        return $.alerts.overAlert(message, time)
    }

    mFloatPanel = function (html, position) {
        position = position || "top";
        return $("<div/>").appendTo($("body")).addClass("floatpanel").html(html).addClass("floatpanel" + position);
    }

    //ajax替换
    mAjaxReplace = function (obj, url, data, target) {
        if ($(obj).hasClass("moving"))return false;
        var target = target || "";
        if (target == "parent") {
            $(obj).parent().hide();
        }
        else {
            $(obj).hide();
        }
        $.post(url, data, function(data) {
            if (data.ret == 1) {
                if (target == "parent") {
                    $(obj).parent().replaceWith($(data.html).fadeIn(1500));
                }
                else {
                    $(obj).replaceWith($(data.html).fadeIn(1500,function () {
                        $(this).removeClass("moving");
                    }).addClass("moving"));//.fadeIn("slow");
                }
            }
            else {
                majaxerr(data);
            }
        }, 'json');
    }

    //截取字符串
    mSubStr = function (val, len) {
        var resVal = '';
        var byteValLen = 0;
        for (var i = 0; i < val.length; i++) {
            if (val[i].match(/[^\x00-\xff]/ig) != null)
                byteValLen += 2;
            else
                byteValLen += 1;
            if (byteValLen > len)
                break;
            resVal += val[i];
        }
        return resVal;
    };

    /**
     * 输入框中默认显示灰色文本
     * @param oConfig {Object} 配置参数，其结构为：
     * {
     *      text:{String} 默认文字,
     *      ziClass:{String} 文本默认显示的样式，默认为"gray"
     * }
     * @type jQuery
     * @example
     * 好友搜索输入框中默认灰色文本:"我要去看谁？"
     * $(".fc_input").inputDefault({
     *      text:_."我要去看谁？"
     * });
     */
    $.fn.inputDefault = function (oConfig) {
        var ziClass = oConfig.ziClass || "gray";
        if ($(this).val().length == 0)
            return this.focus(function () {
                if ($(this).hasClass(ziClass))$(this).val("").removeClass(ziClass);
            }).blur(function () {
                    if ($.trim($(this).val()).length == 0)$(this).val(oConfig.text).addClass(ziClass);
                }).val(oConfig.text).addClass(ziClass);
    };
    /**
     * 背景切换
     * @param oConfig {Object} 配置参数，其结构为：
     * {
     *      url:{String} 要切换的图片
     * }
     * @type jQuery
     * @example
     * $(".img").img2Bg({
     *      url:"xxxx"
     * });
     */
    $.fn.img2Bg = function (oConfig) {
        var oConfig = oConfig || {};
        return this.each(function () {
            var _url = $(this).attr("img2") || oConfig.url || "";
            if (_url.length > 0) {
                $(this).data("ourl", $(this).attr("src"));
                $(this).mouseover(function () {
                    $(this).attr("src", _url);
                }).mouseout(function () {
                        $(this).attr("src", $(this).data("ourl"));
                    }).parent().focus(function () {
                        $(this).trigger("blur")
                    });
            }

        });
    };

    $.fn.selectInput = function (oConfig) {
        var ret = {};
        this.each(function () {
            var oConfig = oConfig || {};
            var def_val = oConfig.def || "0";
            var _sel = $(this);
            var _ipt = $(this);
            $(this).change(function () {
                if ($(this).val() == def_val) {
                    _ipt = $('<input type="text" />').attr("name", $(this).attr("name") + "_i").attr("id", $(this).attr("id") + "_i")
                        .insertAfter($(this)).dblclick(function () {
                            _sel.show().children(':first-child').attr("selected", "selected");
                            $(this).hide();
                        });
                    $(this).hide();
                }
            });

            ret.val = function () {
                if (_sel.is(':visible')) {
                    return _sel.val();
                }
                else {
                    return _ipt.val();
                }
            };


        });
        return ret;
    };

})(jQuery);

//分歧终端机挑战
var _vs_fans_times = -999;
function PK_n(times, defaultval, back) {
    var t = '<div class="vs_fans"><div class="oneline"><div class="p_tit">下注彩金：</div><div class="p_rcon"><span class="h2"><select id="select_tipmoney"name="select2"size="1"class="input"><option>1000</option><option>2000</option><option>5000</option><option>8000</option><option>10000</option><option value="0">自定义</option></select></span><span class="ts" id="vs_fans_times">今日还可免费发起<span class="coin_t">0</span>次</span></div></div><div class="oneline"><div class="p_tit">选择粉丝：</div><div class="p_rcon"><input type="text"name="textfield"class="to_suggest"/></div></div><div class="oneline"><div class="p_tit">选择出拳：</div><div class="p_rcon"><a id="btn_1"href="javascript:void(0)"><img val="2" img2="http://file.mafengwo.cn/images/game/handwar/man_s1_on.gif"src="http://file.mafengwo.cn/images/game/handwar/man_s1.gif"width="120"height="120"border="0"title="剪子"/></a><a id="btn_2"href="javascript:void(0)"><img val="5" img2="http://file.mafengwo.cn/images/game/handwar/man_s2_on.gif"src="http://file.mafengwo.cn/images/game/handwar/man_s2.gif"width="120"height="120"border="0"title="包袱"/></a><a id="btn_3"href="javascript:void(0)"><img val="0" src="http://file.mafengwo.cn/images/game/handwar/man_s3.gif"img2="http://file.mafengwo.cn/images/game/handwar/man_s3_on.gif"width="120"height="120"border="0"title="锤"/></a></div></div><div class="oneline"><div class="p_tit">附言：</div><div class="p_rcon"><textarea name="textfield2"class="textfield_tosay"style="width:360px;"></textarea></div></div></div><div class="clr3"></div>';

    var defaultval = defaultval || false;
    var picselected = false;
    var busy = false;
    var _touid = 0;

    if (_vs_fans_times == -999)_vs_fans_times = parseInt(times);
    if (parseInt(_vs_fans_times) <= -50) {
        mAlert("今天你不能挑战了，明天再来吧~~");
        return;
    }

    var obj = mAlert(t, "挑战我的粉丝",function () {
        var money = parseInt(sipt.val());
        if (isNaN(money) || money < 1000 || money > 10000) {
            return "请输入1000-10000的整数";
        }
        if (!picselected) {
            return "请选择出拳";
        }
        if (!defaultval && obj.find("input.input_viled").length == 0) {
            return "请选择粉丝";
        }
        if (!busy) {
            busy = true;
            var _wagerid = lastimg.val;
            var _uid = 0
            if (defaultval) {
                _uid = defaultval;
            }
            else {
                _uid = obj.find(".to_suggest").data("val");
            }

            var _msg = obj.find("textarea").val();
            //if(_msg=="就想和你赌一把！"){_msg=""};
            jQuery.getJSON("/ajax/ajax_wagerother.php", {touid:_uid, wagerid:_wagerid, challengeflg:"challenge", cash:money, msg:_msg}, function (dat) {
                if (dat.ret == 1) {
                    mTinyAlert(dat.msg || "操作成功！");
                    if (typeof(back) == "function")back(dat.usercash);
                }
                else {
                    mAlert(dat.msg || "操作失败！");
                }
                _vs_fans_times = parseInt(dat.leavenum);
                busy = false;
            });
        }
        return true;
    }, -1).css({width:"500px", marginLeft:"-250px"})
        .find("textarea").inputDefault({text:"就想和你赌一把！"}).end();
    if (defaultval) {
        obj.find(".to_suggest").parent().parent().remove();
    }
    else {
        obj.find(".to_suggest").suggest("/ajax/ajax_suggest.php?type=fans");
    }
    var sipt = obj.find("#select_tipmoney").selectInput();
    var lastimg = {};
    obj.find("img").click(function () {
        picselected = true;
        if (lastimg.url) {
            lastimg.obj.attr("src", lastimg.url);
        }
        lastimg.obj = jQuery(this);
        lastimg.url = jQuery(this).attr("src");
        lastimg.val = jQuery(this).attr("val");
        jQuery(this).attr("src", jQuery(this).attr("img2"));

    }).parent().focus(function () {
            jQuery(this).trigger("blur")
        });

    if (_vs_fans_times > 0) {
        jQuery("#vs_fans_times").html('今日还可免费发起<span class="coin_t">' + _vs_fans_times + '</span>次');
    }
    else if (_vs_fans_times > -50) {
        jQuery("#vs_fans_times").html('每交1000金币挑战1次，今日还可发起<span class="coin_t">' + (_vs_fans_times + 50) + '</span>次');
    }
    else {
        jQuery("#vs_fans_times").html('今日你不能发起挑战了');
    }


}


//suggest
(function ($) {

    $.suggest = function (input, options) {

        var $input = $(input).attr("autocomplete", "off");
        var $results;

        var timeout = false;		// hold timeout ID for suggestion results to appear
        var prevLength = 0;			// last recorded length of $input.val()
        var cache = [];				// cache MRU list
        var cacheSize = 0;			// size of cache in chars (bytes?)

        if ($.trim($input.val()) == '' || $.trim($input.val()) == '中文/拼音') $input.val('中文/拼音').css('color', '#aaa');
        if (!options.attachObject)
            options.attachObject = $(document.createElement("ul")).appendTo('body');

        $results = $(options.attachObject);
        $("." + options.resultsClass).remove();
        $results.addClass(options.resultsClass);

        resetPosition();
        $(window).scroll(function () {
            resetPosition();
        });
        $(window)
            .load(resetPosition)// just in case user is changing size of page while loading
            .resize(resetPosition);

        $input.blur(function () {
            setTimeout(function () {
                $results.hide();
            }, 200);
        });

        $input.focus(function () {
            if ($.trim($(this).val()) == '中文/拼音') {
                $(this).val('');//.css('color','#000');
            }
            resetPosition();
        });
        $input.click(function () {
            var q = $.trim($(this).val());
            displayItems(q);
            $(this).select();
        });

        // help IE users if possible
        try {
            $results.bgiframe();
        } catch (e) {
        }

        $input.keyup(processKey);//

        function resetPosition() {
            // requires jquery.dimension plugin
            var offset = $input.offset();
            $results.css({
                top:(offset.top + input.offsetHeight) + 'px',
                left:offset.left + 'px'
            });
        }


        function processKey(e) {

            // handling up/down/escape requires results to be visible
            // handling enter/tab requires that AND a result to be selected

            if ((/27$|38$|40$/.test(e.keyCode) && $results.is(':visible')) ||
                (/^13$|^9$/.test(e.keyCode) && getCurrentResult())) {

                if (e.preventDefault)
                    e.preventDefault();
                if (e.stopPropagation)
                    e.stopPropagation();

                e.cancelBubble = true;
                e.returnValue = false;

                switch (e.keyCode) {

                    case 38: // up
                        prevResult();
                        break;

                    case 40: // down
                        nextResult();
                        break;
                    case 13: // return
                        selectCurrentResult();
                        break;

                    case 27: //	escape
                        $results.hide();
                        break;

                }

            } else if ($input.val().length != prevLength) {
                $input.css('color', '#aaa').removeClass("input_viled");
                if (timeout)
                    clearTimeout(timeout);
                timeout = setTimeout(suggest, options.delay);
                prevLength = $input.val().length;

            }
            else {
                $results.show();
            }


        }

        //cache
        function checkCache(q) {
            for (var i = 0; i < cache.length; i++)
                if (cache[i]['k'] == q) {
                    cache.unshift(cache.splice(i, 1)[0]); // add to front to implement LRU
                    return cache[0]["items"];
                }
            return false;
        }

        function addToCache(q, size, items) {
            while (cache.length && (cacheSize + size > options.maxCacheSize)) {
                var cached = cache.pop();
                cacheSize -= cached['size'];
            }
            cache.push({
                k:q,
                size:size,
                items:items
            });
            cacheSize += size;
        }

        //cache end
        function suggest() {

            var q = $.trim($input.val());
            displayItems(q);
        }

        function handleJson(data, key) {
            var html = '';
            //alert(typeof(data));
            if (data.length) {
                for (var i = 0; i < data.length; i++) {
                    html += '<li rel="' + data[i].name + '"><img align="absmiddle" src="' + data[i].logo + '"/><span val="' + data[i].userid + '">' + data[i].name + '</span></li>';
                }
                html = '<div class="gray ac_result_tip">' + key + '，按拼音排序</div><ul>' + html + '</ul>';
            }
            else {
                suggest_tip = '<div class="gray ac_result_tip">对不起，找不到：' + key + '</div>';
                html = suggest_tip + '<ul>' + html + '</ul>';
            }
            displayRet(html);
        }

        function displayItems(key) {
            if (key != "") {
                var _d = checkCache(key);
                if (_d) {
                    handleJson(_d, key);
                }
                else {
                    $.getJSON(options.source, {k:key}, function (data) {
                        handleJson(data, key);
                        addToCache(key, data.length, data);
                    });
                }
            }
            else {
                displayRet('<div class="gray ac_result_tip">请输入中文/拼音或者↑↓选择</div>');
            }
            return;
        }

        function displayRet(html) {
            $results.html(html).show();
            $results.children('ul').children('li:first-child').addClass(options.selectClass);

            $results.children('ul')
                .children('li')
                .mouseover(function () {
                    $results.children('ul').children('li').removeClass(options.selectClass);
                    $(this).addClass(options.selectClass);
                })
                .click(function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    selectCurrentResult();
                });
        }

        function getCurrentResult() {

            if (!$results.is(':visible'))
                return false;

            var $currentResult = $results.children('ul').children('li.' + options.selectClass);
            if (!$currentResult.length)
                $currentResult = false;

            return $currentResult;

        }

        function selectCurrentResult() {

            $currentResult = getCurrentResult();

            if ($currentResult) {
                $input.val($currentResult.children('span').html().replace(/<span>.+?<\/span>/i, ''));
                $input.data("val", $currentResult.children('span').attr("val"));
                prevLength = $input.val().length;
                $results.hide();
                $input.css('color', '#000').addClass("input_viled");
                if ($(options.dataContainer)) {
                    $(options.dataContainer).val($currentResult.attr('rel'));
                }

                if (options.onSelect) {
                    options.onSelect.apply($input[0], [$currentResult.children('span').attr("val")]);
                }
            }

        }

        function nextResult() {

            $currentResult = getCurrentResult();

            if ($currentResult && $currentResult.next().length) {
                $currentResult
                    .removeClass(options.selectClass)
                    .next()
                    .addClass(options.selectClass);
            }
            else
                $results.children('ul').children('li:last-child').removeClass(options.selectClass).end().children('li:first-child').addClass(options.selectClass);

        }

        function prevResult() {

            $currentResult = getCurrentResult();

            if ($currentResult && $currentResult.prev().length)
                $currentResult
                    .removeClass(options.selectClass)
                    .prev()
                    .addClass(options.selectClass);
            else
                $results.children('ul').children('li:first-child').removeClass(options.selectClass).end().children('li:last-child').addClass(options.selectClass);

        }

    }

    $.fn.suggest = function (source, options) {

        if (!source)
            return;

        options = options || {};
        options.source = source;
        options.hot_list = options.hot_list || [];
        options.delay = options.delay || 200;
        options.resultsClass = options.resultsClass || 'ac_results';
        options.selectClass = options.selectClass || 'ac_over';
        options.matchClass = options.matchClass || 'ac_match';
        options.minchars = options.minchars || 1;
        options.delimiter = options.delimiter || '\n';
        options.onSelect = options.onSelect || false;
        options.dataDelimiter = options.dataDelimiter || '\t';
        options.dataContainer = options.dataContainer || '#SuggestResult';
        options.attachObject = options.attachObject || null;
        options.maxCacheSize = 65536;

        this.each(function () {
            new $.suggest(this, options);
        });

        return this;

    };

})(jQuery);

//图片上传
if (jQuery)(function (jQuery) {
    jQuery.extend(jQuery.fn, {
        uploadify:function (options) {
            jQuery(this).each(function () {
                settings = jQuery.extend({
                    id:jQuery(this).attr('id'), // The ID of the object being Uploadified
                    uploader:'uploadify.swf', // The path to the uploadify swf file
                    script:'uploadify.php', // The path to the uploadify backend upload script
                    expressInstall:null, // The path to the express install swf file
                    folder:'', // The path to the upload folder
                    height:21, // The height of the flash button
                    width:52, // The width of the flash button
                    cancelImg:'cancel.png', // The path to the cancel image for the default file queue item container
                    wmode:'opaque', // The wmode of the flash file
                    scriptAccess:'sameDomain', // Set to "always" to allow script access across domains
                    fileDataName:'Filedata', // The name of the file collection object in the backend upload script
                    method:'POST', // The method for sending variables to the backend upload script
                    queueSizeLimit:1, // The maximum size of the file queue
                    simUploadLimit:1, // The number of simultaneous uploads allowed
                    queueID:false, // The optional ID of the queue container
                    displayData:'percentage', // Set to "speed" to show the upload speed in the default queue item
                    onInit:function () {
                    }, // Function to run when uploadify is initialized
                    onSelect:function () {
                    }, // Function to run when a file is selected
                    onQueueFull:function () {
                    }, // Function to run when the queue reaches capacity
                    onCheck:function () {
                    }, // Function to run when script checks for duplicate files on the server
                    onCancel:function () {
                    }, // Function to run when an item is cleared from the queue
                    onError:function () {
                    }, // Function to run when an upload item returns an error
                    onProgress:function () {
                    }, // Function to run each time the upload progress is updated
                    onComplete:function () {
                    }, // Function to run when an upload is completed
                    onAllComplete:function () {
                    }  // Functino to run when all uploads are completed
                }, options);
                var pagePath = location.pathname;
                pagePath = pagePath.split('/');
                pagePath.pop();
                pagePath = pagePath.join('/') + '/';
                var data = {};
                data.uploadifyID = settings.id;
                data.pagepath = pagePath;
                if (settings.buttonImg) data.buttonImg = escape(settings.buttonImg);
                if (settings.buttonText) data.buttonText = escape(settings.buttonText);
                if (settings.rollover) data.rollover = true;
                data.script = settings.script;
                data.folder = escape(settings.folder);
                if (settings.scriptData) {
                    var scriptDataString = '';
                    for (var name in settings.scriptData) {
                        scriptDataString += '&' + name + '=' + settings.scriptData[name];
                    }
                    data.scriptData = escape(scriptDataString.substr(1));
                }
                data.width = settings.width;
                data.height = settings.height;
                data.wmode = settings.wmode;
                data.method = settings.method;
                data.queueSizeLimit = settings.queueSizeLimit;
                data.simUploadLimit = settings.simUploadLimit;
                if (settings.hideButton)   data.hideButton = true;
                if (settings.fileDesc)     data.fileDesc = settings.fileDesc;
                if (settings.fileExt)      data.fileExt = settings.fileExt;
                if (settings.multi)        data.multi = true;
                if (settings.auto)         data.auto = true;
                if (settings.sizeLimit)    data.sizeLimit = settings.sizeLimit;
                if (settings.checkScript)  data.checkScript = settings.checkScript;
                if (settings.fileDataName) data.fileDataName = settings.fileDataName;
                if (settings.queueID)      data.queueID = settings.queueID;
                if (settings.onInit() !== false) {
                    jQuery(this).css('display', 'none');
                    jQuery(this).after('<div id="' + jQuery(this).attr('id') + 'Uploader"></div>');
                    swfobject.embedSWF(settings.uploader, settings.id + 'Uploader', settings.width, settings.height, '9.0.24', settings.expressInstall, data, {'quality':'high', 'wmode':settings.wmode, 'allowScriptAccess':settings.scriptAccess});
                    if (settings.queueID == false) {
                        jQuery("#" + jQuery(this).attr('id') + "Uploader").after('<div id="' + jQuery(this).attr('id') + 'Queue" class="uploadifyQueue"></div>');
                    }
                }
                if (typeof(settings.onOpen) == 'function') {
                    jQuery(this).bind("uploadifyOpen", settings.onOpen);
                }
                jQuery(this).bind("uploadifySelect", {'action':settings.onSelect, 'queueID':settings.queueID}, function (event, ID, fileObj) {
                    if (event.data.action(event, ID, fileObj) !== false) {
                        var byteSize = Math.round(fileObj.size / 1024 * 100) * .01;
                        var suffix = 'KB';
                        if (byteSize > 1000) {
                            byteSize = Math.round(byteSize * .001 * 100) * .01;
                            suffix = 'MB';
                        }
                        var sizeParts = byteSize.toString().split('.');
                        if (sizeParts.length > 1) {
                            byteSize = sizeParts[0] + '.' + sizeParts[1].substr(0, 2);
                        } else {
                            byteSize = sizeParts[0];
                        }
                        if (fileObj.name.length > 16) {
                            fileName = fileObj.name.substr(0, 15) + '...';
                        } else {
                            fileName = fileObj.name;
                        }
                        queue = '#' + jQuery(this).attr('id') + 'Queue';
                        if (event.data.queueID) {
                            queue = '#' + event.data.queueID;
                        }
                        jQuery(queue).append('<div id="' + jQuery(this).attr('id') + ID + '" class="uploadifyQueueItem">\
								<div class="cancel">\
									<!--<a href="javascript:jQuery(\'#' + jQuery(this).attr('id') + '\').uploadifyCancel(\'' + ID + '\')"><img src="' + settings.cancelImg + '" border="0" /></a>-->\
								</div>\
								<span class="fileName">' + fileName + ' (' + byteSize + suffix + ')</span><span class="percentage"></span>\
								<div class="uploadifyProgress">\
									<div id="' + jQuery(this).attr('id') + ID + 'ProgressBar" class="uploadifyProgressBar"><!--Progress Bar--></div>\
								</div>\
							</div>');
                    }
                });
                if (typeof(settings.onSelectOnce) == 'function') {
                    jQuery(this).bind("uploadifySelectOnce", settings.onSelectOnce);
                }
                jQuery(this).bind("uploadifyQueueFull", {'action':settings.onQueueFull}, function (event, queueSizeLimit) {
                    if (event.data.action(event, queueSizeLimit) !== false) {
                        alert('The queue is full.  The max size is ' + queueSizeLimit + '.');
                    }
                });
                jQuery(this).bind("uploadifyCheckExist", {'action':settings.onCheck}, function (event, checkScript, fileQueueObj, folder, single) {
                    var postData = new Object();
                    postData = fileQueueObj;
                    postData.folder = pagePath + folder;
                    if (single) {
                        for (var ID in fileQueueObj) {
                            var singleFileID = ID;
                        }
                    }
                    jQuery.post(checkScript, postData, function (data) {
                        for (var key in data) {
                            if (event.data.action(event, checkScript, fileQueueObj, folder, single) !== false) {
                                var replaceFile = confirm("Do you want to replace the file " + data[key] + "?");
                                if (!replaceFile) {
                                    document.getElementById(jQuery(event.target).attr('id') + 'Uploader').cancelFileUpload(key, true, true);
                                }
                            }
                        }
                        if (single) {
                            document.getElementById(jQuery(event.target).attr('id') + 'Uploader').startFileUpload(singleFileID, true);
                        } else {
                            document.getElementById(jQuery(event.target).attr('id') + 'Uploader').startFileUpload(null, true);
                        }
                    }, "json");
                });
                jQuery(this).bind("uploadifyCancel", {'action':settings.onCancel}, function (event, ID, fileObj, data, clearFast) {
                    if (event.data.action(event, ID, fileObj, data, clearFast) !== false) {
                        var fadeSpeed = (clearFast == true) ? 0 : 250;
                        jQuery("#" + jQuery(this).attr('id') + ID).fadeOut(fadeSpeed, function () {
                            jQuery(this).remove()
                        });
                    }
                });
                if (typeof(settings.onClearQueue) == 'function') {
                    jQuery(this).bind("uploadifyClearQueue", settings.onClearQueue);
                }
                var errorArray = [];
                jQuery(this).bind("uploadifyError", {'action':settings.onError}, function (event, ID, fileObj, errorObj) {
                    if (event.data.action(event, ID, fileObj, errorObj) !== false) {
                        var fileArray = new Array(ID, fileObj, errorObj);
                        errorArray.push(fileArray);
                        jQuery("#" + jQuery(this).attr('id') + ID + " .percentage").text(" - " + errorObj.type + " Error");
                        jQuery("#" + jQuery(this).attr('id') + ID).addClass('uploadifyError');
                    }
                });
                jQuery(this).bind("uploadifyProgress", {'action':settings.onProgress, 'toDisplay':settings.displayData}, function (event, ID, fileObj, data) {
                    if (event.data.action(event, ID, fileObj, data) !== false) {
                        jQuery("#" + jQuery(this).attr('id') + ID + "ProgressBar").css('width', data.percentage + '%');
                        if (event.data.toDisplay == 'percentage') displayData = ' - ' + data.percentage + '%';
                        if (event.data.toDisplay == 'speed') displayData = ' - ' + data.speed + 'KB/s';
                        if (event.data.toDisplay == null) displayData = ' ';
                        jQuery("#" + jQuery(this).attr('id') + ID + " .percentage").text(displayData);
                    }
                });
                jQuery(this).bind("uploadifyComplete", {'action':settings.onComplete}, function (event, ID, fileObj, response, data) {
                    if (event.data.action(event, ID, fileObj, unescape(response), data) !== false) {
                        jQuery("#" + jQuery(this).attr('id') + ID + " .percentage").text(' - Completed');
                        jQuery("#" + jQuery(this).attr('id') + ID).fadeOut(250, function () {
                            jQuery(this).remove()
                        });
                    }
                });
                if (typeof(settings.onAllComplete) == 'function') {
                    jQuery(this).bind("uploadifyAllComplete", {'action':settings.onAllComplete}, function (event, uploadObj) {
                        if (event.data.action(event, uploadObj) !== false) {
                            errorArray = [];
                        }
                    });
                }
            });
        },
        uploadifySettings:function (settingName, settingValue, resetObject) {
            var returnValue = false;
            jQuery(this).each(function () {
                if (settingName == 'scriptData' && settingValue != null) {
                    if (resetObject) {
                        var scriptData = settingValue;
                    } else {
                        var scriptData = jQuery.extend(settings.scriptData, settingValue);
                    }
                    var scriptDataString = '';
                    for (var name in scriptData) {
                        scriptDataString += '&' + name + '=' + escape(scriptData[name]);
                    }
                    settingValue = scriptDataString.substr(1);
                }
                returnValue = document.getElementById(jQuery(this).attr('id') + 'Uploader').updateSettings(settingName, settingValue);
            });
            if (settingValue == null) {
                if (settingName == 'scriptData') {
                    var returnSplit = unescape(returnValue).split('&');
                    var returnObj = new Object();
                    for (var i = 0; i < returnSplit.length; i++) {
                        var iSplit = returnSplit[i].split('=');
                        returnObj[iSplit[0]] = iSplit[1];
                    }
                    returnValue = returnObj;
                }
                return returnValue;
            }
        },
        uploadifyUpload:function (ID) {
            jQuery(this).each(function () {
                document.getElementById(jQuery(this).attr('id') + 'Uploader').startFileUpload(ID, false);
            });
        },
        uploadifyCancel:function (ID) {
            jQuery(this).each(function () {
                document.getElementById(jQuery(this).attr('id') + 'Uploader').cancelFileUpload(ID, true, false);
            });
        },
        uploadifyClearQueue:function () {
            jQuery(this).each(function () {
                document.getElementById(jQuery(this).attr('id') + 'Uploader').clearFileUploadQueue(false);
            });
        }
    })
})(jQuery);

//Select
(function ($) {
    $.fn.slt = function (obj, arr) {
        return this.each(function () {
            var iptName;
            var _text = "";
            $(this).click(clk);
            function clk() {
                $("#liandong_select ul li").die();
                $("#liandong_select").remove();
                iptName = $(this).attr("id");
                var iptOffSet = $(this).offset();
                var iptLeft = iptOffSet.left;
                var iptTop = iptOffSet.top + 20;
                var str = "<div id='liandong_select'><span><a id='fh'>返回顶层列表</a><a id='gb'>[&nbsp;关闭&nbsp;]</a></span><div class='c'><ul></ul></div><div style='clear:both;'></div></div>";
                areasLen = arr.length;
                var str2 = "";
                for (var i = 0; i < areasLen; i++) {
                    str2 = str2 + "<li title='" + arr[i][1] + "' id='p" + arr[i][0] + "'>" + arr[i][1] + "</li>";
                }
                $("body").append(str);
                $("#liandong_select ul").append(str2);
                $("#liandong_select").css({left:iptLeft + "px", top:iptTop + "px"});
                $("#liandong_select span a#fh").bind("click", function () {
                    $("#liandong_select ul").empty();
                    $("#liandong_select ul").append(str2);
                    _text = "";
                });
                $("#liandong_select span a#gb").bind("click", function () {
                    $("#liandong_select").remove();
                });
                $("#liandong_select ul li").live("click", liBind);
            }

            function liBind() {
                var liId = $(this).attr("id");
                var liText = _text.length > 0 ? _text + ">" + $(this).text() : $(this).text();
                _text = liText;
                var newArrVal = obj[liId];
                if (newArrVal == undefined || newArrVal == "") {
                    $("#" + iptName + "Val").val(liId.substr(1));
                    $("#" + iptName).val(liText);
                    $("#liandong_select").css("display", "none");
                    _text = "";
                }
                else {
                    listr = "";
                    pLen = newArrVal.length;
                    for (j = 0; j < pLen; j++) {
                        if ("p" + newArrVal[j][0] == liId) {
                            listr = listr + "<li title='" + newArrVal[j][1] + "' id='p" + newArrVal[j][0] + "' >" + newArrVal[j][1] + "</li>";
                        }
                        else listr = listr + "<li title='" + newArrVal[j][1] + "' id='p" + newArrVal[j][0] + "'>" + newArrVal[j][1] + "</li>";
                    }
                    $("#liandong_select ul").empty();
                    $("#liandong_select ul").append(listr);
                }
            }
        });
    };
})(jQuery);

//加金币效果
(function ($) {
    $.fn.UpNum = function (num, callback, font_size,z_index) {
        return this.each(function () {
            var _p = $(this).offset();
            var _x = Math.round(_p.left) + "px";
            var _y = Math.round(_p.top) + "px";
            if (num.toString().indexOf("-") == 0) {
                var _y1 = Math.round(_p.top) + 30 + "px";
            } else {
                var _y1 = Math.round(_p.top) - 30 + "px";
            }
            var fs = "20px";
            if (font_size)fs = font_size;
            z_index = z_index || "120";
            var _m = num || $(this).attr("money");
            $("<div/>").appendTo($("body")).addClass("numeric").css({position:"absolute", top:_y, left:_x, color:(num.toString().indexOf("-") == 0) ? "#333" : "red", "fontFamily":"Georgia", "fontSize":fs, "zIndex":z_index}).html(_m)
                .animate({ top:_y1 }, {duration:1000, complete:function () {
                    $(this).remove();
                    if (callback) {
                        callback();
                    }
                }});
        });
    };
})(jQuery);

(function ($) {
    //加关注
    adf = function (obj, uid, flg) {
        mAjaxReplace(obj, "/ajax/addfriend.php", {action: 'addfollow', type: flg, touid: uid, '_need_cstk':true});
    }
    //取消关注
    def = function (obj, uid, flg) {
        mAjaxReplace(obj, "/ajax/addfriend.php", {action: 'delfriend', type: flg, touid: uid, '_need_cstk':true});
    }
    //留言
    m_lmsg = function (obj, para, position) {
        var _p = {
            url:"/ajax/ajax_send.php",
            content:"",
            _need_cstk:true
        }
        if (!position)position = "bottom";
        if (typeof(para) == "object")$.extend(_p, para);
        var _isprivate = (typeof(_p.word) != "undefined");
        var _cc = '';
        if (_isprivate && false) {
            _cc = '<textarea class="atsb_input">' + _p.word + '</textarea><div class="atsb_h35"><div class="flt1"><input type="checkbox" value=""/>&nbsp;&nbsp;悄悄话</div><div class="flt2"><input type="button" class="btn_orange" value="确定"/></div></div>';
        }
        else {
            _cc = '<textarea class="atsb_input"></textarea><input type="button" class="btn_orange" value="确定"/>';
        }

        $(obj).mTip("<div class='atsb_tit'>留言</div>", _cc, position).data("mtip").find("div.eject").css("width", 270).find("input.btn_orange").click(function () {
            var _content = $.trim($(obj).data("mtip").find("textarea").val());
            var _privatestate = $(obj).data("mtip").find(":checked").length;
            if (_privatestate && true) {
                _p.type = "msg";
            }
            if (_content.length > 0) {
                $.extend(_p, {content:_content});
                $.post(_p.url, _p, function (d) {
                    if (d.ret == 1) {
                        $(obj).mTipHide();
                        mTinyAlert("操作成功！");
                    }
                    else {
                        majaxerr(d);
                    }

                }, 'json');
            }
            else {
                mAlert("你还是写俩字吧");
            }
        }).end().find(":checkbox").click(function () {
                var _v = $(obj).data("mtip").find("textarea").val().replace(_p.word, "");
                if (!$(this).is(":checked")) {

                    $(obj).data("mtip").find("textarea").val(_p.word + _v);
                }
                else {
                    $(obj).data("mtip").find("textarea").val(_v);
                }
            });
        setTimeout(function () {
            $(obj).data("mtip").find("textarea").trigger("focus")[0].value += "";
        }, 20);
    }
    //消息
    m_smsg = function (obj, para) {
        var _p = {
            url:"/ajax/ajax_send.php",
            _need_cstk:true
        }
        if (typeof(para) == "object")$.extend(_p, para);
        $(obj).mTip("<div class='atsb_tit'>发送消息</div>", '<textarea class="atsb_input"></textarea><div class="atsb_h35"><input type="button" class="btn_orange" value="确定"/></div>', "bottom").data("mtip").find("div.eject").css("width", 270).find("input.btn_orange").click(function () {
            var _content = $.trim($(this).parent().prev().val());
            if (_content.length > 0) {
                $.extend(_p, {content:_content});
                $.post(_p.url, _p, function (d) {
                    if (d.ret == 1) {
                        $(obj).mTipHide();
                        mTinyAlert("操作成功！");
                    }
                    else {
                        majaxerr(d);
                    }

                }, 'json');

            }
            else {
                mAlert("空消息是不能发送的");
            }
        });
    }
})(jQuery);
//ajax错误处理
function majaxerr(d, callback) {
    if (d.ret == "-1") {
        window.location.href = "http://passport.mafengwo.cn";
    }
    else {
        mAlert("<div class=''>" + (d.msg || jQuery.asset.Err) + "</div>", "", function () {
            if (typeof(callback) == "function") {
                callback();
            }
        });
    }
}


//jquery动画
jQuery.easing['jswing'] = jQuery.easing['swing'];

jQuery.extend(jQuery.easing,
    {
        def:'easeOutQuad',
        swing:function (x, t, b, c, d) {
            //alert(jQuery.easing.default);
            return jQuery.easing[jQuery.easing.def](x, t, b, c, d);
        },
        easeInQuad:function (x, t, b, c, d) {
            return c * (t /= d) * t + b;
        },
        easeOutQuad:function (x, t, b, c, d) {
            return -c * (t /= d) * (t - 2) + b;
        },
        easeInOutQuad:function (x, t, b, c, d) {
            if ((t /= d / 2) < 1) return c / 2 * t * t + b;
            return -c / 2 * ((--t) * (t - 2) - 1) + b;
        },
        easeInCubic:function (x, t, b, c, d) {
            return c * (t /= d) * t * t + b;
        },
        easeOutCubic:function (x, t, b, c, d) {
            return c * ((t = t / d - 1) * t * t + 1) + b;
        },
        easeInOutCubic:function (x, t, b, c, d) {
            if ((t /= d / 2) < 1) return c / 2 * t * t * t + b;
            return c / 2 * ((t -= 2) * t * t + 2) + b;
        },
        easeInQuart:function (x, t, b, c, d) {
            return c * (t /= d) * t * t * t + b;
        },
        easeOutQuart:function (x, t, b, c, d) {
            return -c * ((t = t / d - 1) * t * t * t - 1) + b;
        },
        easeInOutQuart:function (x, t, b, c, d) {
            if ((t /= d / 2) < 1) return c / 2 * t * t * t * t + b;
            return -c / 2 * ((t -= 2) * t * t * t - 2) + b;
        },
        easeInQuint:function (x, t, b, c, d) {
            return c * (t /= d) * t * t * t * t + b;
        },
        easeOutQuint:function (x, t, b, c, d) {
            return c * ((t = t / d - 1) * t * t * t * t + 1) + b;
        },
        easeInOutQuint:function (x, t, b, c, d) {
            if ((t /= d / 2) < 1) return c / 2 * t * t * t * t * t + b;
            return c / 2 * ((t -= 2) * t * t * t * t + 2) + b;
        },
        easeInSine:function (x, t, b, c, d) {
            return -c * Math.cos(t / d * (Math.PI / 2)) + c + b;
        },
        easeOutSine:function (x, t, b, c, d) {
            return c * Math.sin(t / d * (Math.PI / 2)) + b;
        },
        easeInOutSine:function (x, t, b, c, d) {
            return -c / 2 * (Math.cos(Math.PI * t / d) - 1) + b;
        },
        easeInExpo:function (x, t, b, c, d) {
            return (t == 0) ? b : c * Math.pow(2, 10 * (t / d - 1)) + b;
        },
        easeOutExpo:function (x, t, b, c, d) {
            return (t == d) ? b + c : c * (-Math.pow(2, -10 * t / d) + 1) + b;
        },
        easeInOutExpo:function (x, t, b, c, d) {
            if (t == 0) return b;
            if (t == d) return b + c;
            if ((t /= d / 2) < 1) return c / 2 * Math.pow(2, 10 * (t - 1)) + b;
            return c / 2 * (-Math.pow(2, -10 * --t) + 2) + b;
        },
        easeInCirc:function (x, t, b, c, d) {
            return -c * (Math.sqrt(1 - (t /= d) * t) - 1) + b;
        },
        easeOutCirc:function (x, t, b, c, d) {
            return c * Math.sqrt(1 - (t = t / d - 1) * t) + b;
        },
        easeInOutCirc:function (x, t, b, c, d) {
            if ((t /= d / 2) < 1) return -c / 2 * (Math.sqrt(1 - t * t) - 1) + b;
            return c / 2 * (Math.sqrt(1 - (t -= 2) * t) + 1) + b;
        },
        easeInElastic:function (x, t, b, c, d) {
            var s = 1.70158;
            var p = 0;
            var a = c;
            if (t == 0) return b;
            if ((t /= d) == 1) return b + c;
            if (!p) p = d * .3;
            if (a < Math.abs(c)) {
                a = c;
                var s = p / 4;
            }
            else var s = p / (2 * Math.PI) * Math.asin(c / a);
            return -(a * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p)) + b;
        },
        easeOutElastic:function (x, t, b, c, d) {
            var s = 1.70158;
            var p = 0;
            var a = c;
            if (t == 0) return b;
            if ((t /= d) == 1) return b + c;
            if (!p) p = d * .3;
            if (a < Math.abs(c)) {
                a = c;
                var s = p / 4;
            }
            else var s = p / (2 * Math.PI) * Math.asin(c / a);
            return a * Math.pow(2, -10 * t) * Math.sin((t * d - s) * (2 * Math.PI) / p) + c + b;
        },
        easeInOutElastic:function (x, t, b, c, d) {
            var s = 1.70158;
            var p = 0;
            var a = c;
            if (t == 0) return b;
            if ((t /= d / 2) == 2) return b + c;
            if (!p) p = d * (.3 * 1.5);
            if (a < Math.abs(c)) {
                a = c;
                var s = p / 4;
            }
            else var s = p / (2 * Math.PI) * Math.asin(c / a);
            if (t < 1) return -.5 * (a * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p)) + b;
            return a * Math.pow(2, -10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p) * .5 + c + b;
        },
        easeInBack:function (x, t, b, c, d, s) {
            if (s == undefined) s = 1.70158;
            return c * (t /= d) * t * ((s + 1) * t - s) + b;
        },
        easeOutBack:function (x, t, b, c, d, s) {
            if (s == undefined) s = 1.70158;
            return c * ((t = t / d - 1) * t * ((s + 1) * t + s) + 1) + b;
        },
        easeInOutBack:function (x, t, b, c, d, s) {
            if (s == undefined) s = 1.70158;
            if ((t /= d / 2) < 1) return c / 2 * (t * t * (((s *= (1.525)) + 1) * t - s)) + b;
            return c / 2 * ((t -= 2) * t * (((s *= (1.525)) + 1) * t + s) + 2) + b;
        },
        easeInBounce:function (x, t, b, c, d) {
            return c - jQuery.easing.easeOutBounce(x, d - t, 0, c, d) + b;
        },
        easeOutBounce:function (x, t, b, c, d) {
            if ((t /= d) < (1 / 2.75)) {
                return c * (7.5625 * t * t) + b;
            } else if (t < (2 / 2.75)) {
                return c * (7.5625 * (t -= (1.5 / 2.75)) * t + .75) + b;
            } else if (t < (2.5 / 2.75)) {
                return c * (7.5625 * (t -= (2.25 / 2.75)) * t + .9375) + b;
            } else {
                return c * (7.5625 * (t -= (2.625 / 2.75)) * t + .984375) + b;
            }
        },
        easeInOutBounce:function (x, t, b, c, d) {
            if (t < d / 2) return jQuery.easing.easeInBounce(x, t * 2, 0, c, d) * .5 + b;
            return jQuery.easing.easeOutBounce(x, t * 2 - d, 0, c, d) * .5 + c * .5 + b;
        }
    });

//ajax获取提示
function mGetTip(para) {
    var _p = {url:"/recnew/ajax_addfds.php"};
    jQuery.extend(_p, para);
    jQuery.post(_p.url, _p, function (d) {
        if (d.ret == 1) {
            mTinyAlert(d.msg);
            if (_p.reload) {
                setTimeout(function () {
                    top.location.reload();
                }, 1000);
            }
        }
        else {
            majaxerr(d);
        }
    }, "json");
}

//马蜂窝广告
(function ($) {
    mGG = function (cnt, w) {
        w += 4;
        $("<div class='mfwGG'><div class='mfwGGContent'>" + cnt + "</div><a alt='关闭' href='javascript:void(0)' class='mfwGGCloseBtn'>关闭</a></div>").appendTo($('body')).css({"width":w + "px", "marginLeft":"-" + w / 2 + "px"}).find(".mfwGGCloseBtn").click(function () {
            $(this).parent().fadeOut(400, function () {
                $(this).remove();
                $.alerts._overlay('hide');
            })
        });
        $.alerts._overlay('show');
    };

    Ding = function (iid, num, thisid, obj) {
        $(obj).blur();
        if(!$(obj).data('inited')) {
            if($(obj).closest('.float-bar').size() > 0) {
                $("#float_topvote" + thisid).UpNum('+1', function() {
                    $("#float_topvote" + thisid).html(num + 1);
                });
            }
            $("#topvote" + thisid).UpNum('+1', function() {
                $("#topvote" + thisid).html(num + 1);
            });
            $.post('/group/ajax_infovote.php', {iid: iid}, function(d) {
                if('sina' == d.data.login || d.data.is_sina > 0) {
                    if('function' == typeof(ginfo_ding_activities)) {
                        ginfo_ding_activities(iid, 'sina', obj);
                    }
                }
            }, 'json');
        }
        $(obj).data('inited', true);
    }

    PH = function (select) {
        return;
        jQuery(select).hover(function () {

                //if(jQuery(this).data("atip")){jQuery(this).data("atip").stop().remove();}
                jQuery(this).attr({title:''});
                var _of = jQuery(this).offset();
                var _json = eval("(" + jQuery(this).attr("tip") + ")");
                var _sextxt = "神秘人士";
                if (_json.city != "")_json.city += "的";
                if (_json.sex == 1) {
                    _sextxt = "帅哥";
                }
                if (_json.sex == 0) {
                    _sextxt = "美女";
                }
                var _atip = jQuery("<div class='mfwPH'><div class='mfwPHContent'><img align='middle' width='48' border='0' height='48' src='" + _json.logo + "'/></div><div class='mfwPHContentTxt'>" + _json.city + _sextxt + "</div></div>").appendTo(jQuery('body'));
                _atip.css({
                    position:'absolute',
                    zIndex:'50000',
                    top:(_of.top - _atip.outerHeight()) + 'px',
                    left:(_of.left + jQuery(this).outerWidth()) + 'px'
                }).fadeIn(400);
                jQuery(this).data("atip", _atip);
                return;
                _atip.css({
                    position:'absolute',
                    display:'none',
                    zIndex:'50000',
                    top:(jQuery(this).offset().top - _atip.outerHeight()) + 'px',
                    left:(jQuery(this).offset().left + _atip.outerWidth()) + 'px'
                })
                    .stop().fadeIn(400);

                jQuery(this).data("atip", _atip);
            },
            function () {
                jQuery(this).data("atip").remove();
            });
    }
})(jQuery);

//分页控件
(function ($) {
    var _configall = {
        "default":{
            template:{
                container:'<div align="right" class="paginator"></div>',
                loop:'<a class="ti" href="{url}" style="margin:2px;">{page}</a>',
                firstpage:'<a class="ti" href="{url}"><< First</a>',
                lastpage:'<a class="ti" href="{url}">Next >></a>',
                dot:"<a class=\"ti\" href=\"javascript:void(0)\">…</a>"
            },
            /**
             * 配置和初始化翻页控件
             * @param t {Object} 模板
             * @param j {jQuery} 翻页控件的容器对象
             * @param opt {Object} 翻页控件配置参数
             */
            handle:function (t, j, opt) {
                opt.recordcount = parseInt(opt.recordcount);
                opt.pagesize = parseInt(opt.pagesize);
                opt.nowpage = parseInt(opt.nowpage);
                var _pnum = Math.floor(opt.recordcount / opt.pagesize) + (opt.recordcount % opt.pagesize ? 1 : 0);
                if (_pnum < 2)return;
                opt.nowpage = opt.nowpage > _pnum ? _pnum : opt.nowpage;
                var _c = $(t.container);
                var _fp = $(t.firstpage.replace(/{url}/, buildUrl(opt.url, opt.pageparameter, 1)));
                var _lp = $(t.lastpage.replace(/{url}/, buildUrl(opt.url, opt.pageparameter, opt.nowpage == _pnum ? opt.nowpage : opt.nowpage + 1)));
                if (opt.nowpage > 1) {
                    _c.append(_fp);
                }
                var _start = 1, _end = _pnum, _ismore = false, _lmore = true, _rmore = true;
                if (_pnum > 10) {
                    _end = opt.nowpage + 4;
                    _start = opt.nowpage - 4;
                    if (opt.nowpage + 4 >= _pnum) {
                        _end = _pnum;
                        _start = _end - 8;
                        _rmore = false;
                    }
                    if (opt.nowpage - 4 <= 1) {
                        _start = 1;
                        _end = _start + 8;
                        _lmore = false;
                    }
                    _ismore = true;

                }
                for (var i = _start, loopindex = 1; i <= _end; i++, loopindex++) {
                    var _loop;
                    if (_ismore) {
                        _loop = $(t.loop.replace(/{url}/g, buildUrl(opt.url, opt.pageparameter, i)).replace(/{page}/g, i));
                        if ($.inArray(loopindex, [1, 2]) > -1) {
                            _loop = $(t.loop.replace(/{url}/g, buildUrl(opt.url, opt.pageparameter, loopindex)).replace(/{page}/g, loopindex));
                        }
                        if ($.inArray(loopindex, [8, 9]) > -1) {
                            _loop = $(t.loop.replace(/{url}/g, buildUrl(opt.url, opt.pageparameter, _pnum + loopindex - 9)).replace(/{page}/g, _pnum + loopindex - 9));
                        }

                        if (loopindex == 3 && _lmore) {
                            _c.append($(t.dot));
                        }
                        if (loopindex == 8 && _rmore) {
                            _c.append($(t.dot));
                        }
                    }
                    else {
                        _loop = $(t.loop.replace(/{url}/g, buildUrl(opt.url, opt.pageparameter, i)).replace(/{page}/g, i));
                    }
                    if (i == opt.nowpage) {
                        _loop.css({"background-color":"#946400", "border":"1px solid #8B4505", "color":"#FFFFFF"}).attr("href", "javascript:void(0)");
                    }
                    _c.append(_loop);
                }
                if (opt.nowpage < _pnum) {
                    _c.append(_lp);
                }
                j.html("");
                $(_c).appendTo(j);
            }
        },
        "tiny":{
            template:{
                container:'<div align="right" class="paginator"></div>',
                firstpage:'<a class="ti" href="{url}">&lt;&lt;</a>',
                lastpage:'<a class="ti" href="{url}">&gt;&gt;</a>',
                loop:'<a class="ti" href="{url}" style="margin:2px;">{page}</a>'
            },
            /**
             * 配置和初始化翻页控件
             * @param t {Object} 模板
             * @param j {jQuery} 翻页控件的容器对象
             * @param opt {Object} 翻页控件配置参数
             */
            handle:function (t, j, opt) {
                opt.recordcount = parseInt(opt.recordcount);
                opt.pagesize = parseInt(opt.pagesize);
                opt.nowpage = parseInt(opt.nowpage);
                var _pnum = Math.floor(opt.recordcount / opt.pagesize) + (opt.recordcount % opt.pagesize ? 1 : 0);
                if (_pnum < 2)return;
                opt.nowpage = opt.nowpage > _pnum ? _pnum : opt.nowpage;
                var _c = $(t.container);
                var _fp = $(t.firstpage.replace(/{url}/, buildUrl(opt.url, opt.pageparameter, 1)));
                var _lp = $(t.lastpage.replace(/{url}/, buildUrl(opt.url, opt.pageparameter, opt.nowpage == _pnum ? opt.nowpage : opt.nowpage + 1)));
                if (opt.nowpage > 1) {
                    _c.append(_fp);
                }

                var _start = 1, _end = _pnum, showmore = false;
                if (_pnum > 5) {
                    showmore = true;
                    _end = opt.nowpage + 2;
                    _start = opt.nowpage - 2;
                    if (opt.nowpage + 2 >= _pnum) {
                        _end = _pnum;
                        _start = _end - 4;
                        showmore = false;
                    }
                    if (opt.nowpage - 2 <= 1) {
                        _start = 1;
                        _end = _start + 4;
                    }
                }
                for (var i = _start; i <= _end; i++) {
                    _loop = $(t.loop.replace(/{url}/g, buildUrl(opt.url, opt.pageparameter, i)).replace(/{page}/g, i));
                    if (i == opt.nowpage) {
                        _loop.css({"background-color":"#946400", "border":"1px solid #8B4505", "color":"#FFFFFF"}).attr("href", "javascript:void(0)");
                    }
                    _c.append(_loop);
                }

                if (showmore) {
                    var morep = opt.nowpage + 5;
                    if (morep > _pnum)morep = _pnum;
                    _c.append('<a class="ti" style="margin:2px;" href="' + buildUrl(opt.url, opt.pageparameter, morep) + '">...</a>');
                }

                if (opt.nowpage < _pnum) {
                    _c.append(_lp);
                }
                j.html("");
                $(_c).appendTo(j);
            }
        },
        "index":{
            template:{
                container:'<div align="right" class="paginator"></div>',
                firstpage:'<a class="ti" href="{url}">&lt;&lt;prev</a>',
                lastpage:'<a class="ti" href="{url}">next&gt;&gt;</a>',
                loop:'<a class="ti" href="{url}" style="margin:2px;">{page}</a>'
            },
            /**
             * 配置和初始化翻页控件
             * @param t {Object} 模板
             * @param j {jQuery} 翻页控件的容器对象
             * @param opt {Object} 翻页控件配置参数
             */
            handle:function (t, j, opt) {
                opt.recordcount = parseInt(opt.recordcount);
                opt.pagesize = parseInt(opt.pagesize);
                opt.nowpage = parseInt(opt.nowpage);
                var _pnum = Math.floor(opt.recordcount / opt.pagesize) + (opt.recordcount % opt.pagesize ? 1 : 0);
                if (_pnum < 2)return;
                opt.nowpage = opt.nowpage > _pnum ? _pnum : opt.nowpage;
                var _c = $(t.container);
                var _fp = $(t.firstpage.replace(/{url}/, buildUrl(opt.url, opt.pageparameter, opt.nowpage - 1)));
                var _lp = $(t.lastpage.replace(/{url}/, buildUrl(opt.url, opt.pageparameter, opt.nowpage == _pnum ? opt.nowpage : opt.nowpage + 1)));
                if (opt.nowpage > 1) {
                    _c.append(_fp);
                }

                var _start = 1, _end = _pnum, showmore = false;
                if (_pnum > 9) {
                    showmore = true;
                    _end = opt.nowpage + 4;
                    _start = opt.nowpage - 4;
                    if (opt.nowpage + 4 >= _pnum) {
                        _end = _pnum;
                        _start = _end - 8;
                        showmore = false;
                    }
                    if (opt.nowpage - 4 <= 1) {
                        _start = 1;
                        _end = _start + 8;
                    }
                }
                for (var i = _start; i <= _end; i++) {
                    _loop = $(t.loop.replace(/{url}/g, buildUrl(opt.url, opt.pageparameter, i)).replace(/{page}/g, i));
                    if (i == opt.nowpage) {
                        _loop.css({"background-color":"#946400", "border":"1px solid #8B4505", "color":"#FFFFFF"}).attr("href", "javascript:void(0)");
                    }
                    _c.append(_loop);
                }

                if (showmore) {
                    var morep = opt.nowpage + 9;
                    if (morep > _pnum)morep = _pnum;
                    _c.append('<a class="ti" style="margin:2px;" href="' + buildUrl(opt.url, opt.pageparameter, morep) + '">...</a>');
                }

                if (opt.nowpage < _pnum) {
                    _c.append(_lp);
                }
                j.html("");
                $(_c).appendTo(j);
            }
        }
    };

    /**
     * 构造翻页时请求的url
     * @param url {String} 翻页时需请求的url
     * @param pageparameter {String} 页码参数名称
     * @param page {Number} 页码
     * @return 翻页时请求的url，包含页码参数
     * @type String
     */
    function buildUrl(url, pageparameter, page) {
        var reg = new RegExp("([?&])" + pageparameter + "=\\d*", "g");
        url = url.replace(reg, "$1");
        return (url + (url.indexOf("?") > -1 ? "&" : "?") + pageparameter + "=" + page).replace(/&+/g, "&").replace(/\?&/g, "?");
    }

    /**
     * 翻页控件
     * @param opt {Object} 配置参数：
     * {
     *      pagesize:{Number} 每页显示记录条数(默认10),
     *      nowpage:{Number} 当前页码(默认1),
     *      recordcount:{Number} 总记录数,
     *      url:{String} 链接(默认当前请求url) ,
     *      pageparameter:{String} 页数的参数名(默认"page"),
     *      config:{String} 要读取的配置（扩展用，默认"default"）
     * }
     * @type jQuery
     * @example
     * 分享信息翻页显示
     * $("#pager_num1").Pager({recordcount: 91,pagesize: 25,nowpage: 1,url: "/mblog/share/all",pageparameter:"p"});
     * @author WangHao 分页控件V1.0 2009-7-21
     */
    $.fn.Pager = function (opt) {
        var _defaultopt = {
            pagesize:10,
            nowpage:1,
            recordcount:100,
            url:window.location.href.toString(),
            pageparameter:"page",
            config:"default"
        };
        var _opt = $.extend(_defaultopt, opt || {});
        return this.each(function () {
            var _config = _configall[_opt.config] || _configall["default"];
            _config.handle(_config.template, $(this), _opt);
        });
    };
})(jQuery);

(function ($) {
    MAJAXBUSY = false;
    var cfg_word = {"23":"快长大吧！",
        "20":"虎年能吃能赚！",
        "26":"其实。。那个。。",
        "27":"赚钱千日供此浪漫一时！",
        "28":"赶快给换上！",
        "29":"这只是开始！",
        "30":"洗洗更健康！",
        "31":"总入不敷出也不行！",
        "32":"要有房！要有车！",
        "33":"放下武器，舍身成佛！"}
    mCsend = function (def) {
        if (MAJAXBUSY)return;
        MAJAXBUSY = true;
        $.post("/goods/ajax.php", {act:"htmlsentgift", typeid:19}, function (d) {
            MAJAXBUSY = false;
            var obj = mAlert(d.html, "赠送礼物",function () {
                if (MAJAXBUSY)return;
                if (typeof(def) == "undefined" && obj.find("input.input_viled").length == 0) {
                    return "请选择粉丝";
                }
                if (obj.find("li.on").length == 0) {
                    return "请选择礼物";
                }
                var _toid = "";
                if (def) {
                    _toid = def;
                }
                else {
                    _toid = $("#ipt_fans").data("val");
                }
                var _gid = obj.find("li.on").attr("gid");
                var _txt = obj.find("textarea").val();
                var _anony = obj.find(":checked").length;
                MAJAXBUSY = true;
                $.post("/goods/ajax.php", {act:"sendgift", "touid":_toid, "gid":_gid, msg:_txt, anony:_anony}, function (d) {
                    MAJAXBUSY = false;
                    if (d.ret == 1) {
                        mTinyAlert(d.msg);
                        if (window.location.href.toString().indexOf("http://www.mafengwo.cn/u/") == 0) {
                            setTimeout(function () {
                                window.location.reload();
                            }, 1500);
                        }
                    }
                    else {
                        majaxerr(d);
                    }
                }, "json");
                return true;

            }).css({width:"500px", marginLeft:"-250px", position:"absolute", top:"17%"});

            obj.find("li").click(function () {
                obj.find("li.on").removeClass("on");
                $(this).addClass("on");
                var gid = $(this).attr("gid");
                if (obj.find("textarea").hasClass("gray")) {
                    if (cfg_word[gid]) {
                        obj.find("textarea").unbind("focus");
                        obj.find("textarea").unbind("blur");
                        obj.find("textarea").val(cfg_word[gid]).inputDefault({text:cfg_word[gid]});
                    }
                    ;
                }
            });
            obj.find("textarea").inputDefault({text:"哥送的不是礼物，是寂寞！"});
            if (def) {
                $("#ipt_fans").parent().parent().hide();
            }
            else {
                $("#ipt_fans").suggest("/ajax/ajax_suggest.php?type=fans");
            }
        }, "json");
    };
    mGetGift = function (ugid) {
        if (MAJAXBUSY)return;
        MAJAXBUSY = true;
        jQuery.post("/goods/ajax.php", {act:"getgift", "ugid":ugid}, function (d) {
            MAJAXBUSY = false;
            if (d.ret == 1) {
                if (d.msg == "key555") {
                    mAlert("恭喜，从" + d.html + "里掏出了铜钥匙！");
                } else if (d.msg == "key888") {
                    mAlert("恭喜，从" + d.html + "里掏出了金钥匙！");
                } else {
                    mAlert("恭喜，从" + d.html + "里掏出" + d.msg + "金币！");
                }

            }
            else {
                majaxerr(d);
            }
        }, "json");
    };
    mGapple = function () {
        if (MAJAXBUSY)return;
        MAJAXBUSY = true;
        jQuery.post("/goods/ajax.php", {act:"apple"}, function (d) {
            MAJAXBUSY = false;
            if (d.ret == 1) {
                mAlert("恭喜您成功领取平安果和18888金币，在此马蜂窝全体圣斗士祝您平安夜快乐，圣诞快乐！", "领取成功", function () {
                    window.location.reload();
                });
                jQuery("#popup_close").hide();
            }
            else {
                majaxerr(d);
            }
        }, "json");
    };
})(jQuery);
//圣诞树
jQuery(function () {
    jQuery("#pnl_xmastree").unbind("click");
    jQuery("#pnl_xmastree").click(function () {
        if (jQuery("#pnl_xmastree").data("click")) {
            ;
        }
        else {
            jQuery("#pnl_xmastree").data("click", true);
            var _ugid = jQuery(this).attr("tid");
            jQuery.post("/goods/ajax.php", {act:"yao", "ugid":_ugid}, function (d) {
                if (d.ret == 1) {
                    if (typeof(xnfeed) == "function") {
                        xnfeed();
                    }
                    ;
                    mAlert("恭喜，你摇出了" + d.msg + "金币！");
                } else if (d.ret == 3) {
                    mConfirm("只有粉丝才能摇TA家的树，现在就成为TA的粉丝吧？", function (r) {
                        if (r)
                            jQuery.post("/ajax/addfriend.php", {action:"addfollow", type:"attfri", touid:d.msg, '_need_cstk':true}, function (data) {
                                if (data.ret == 1) {
                                    mTinyAlert("操作成功！");
                                }
                                else {
                                    majaxerr(data);
                                }
                            }, "json");
                    }, "成为TA的粉丝");

                }
                else {
                    majaxerr(d);
                }
                jQuery("#pnl_xmastree").data("click", false);
            }, "json");
        }

    });
});
//文章滚动插件
Scroll = function (option) {
    this.oNote = jQuery("#" + option.elid) || null;
    this.height = option.lineHeight || 15;
    this.count = option.displayCount || 1;
    this.delay = option.delay || 5;
    this.delay = (this.delay || 1) * 1000;
    this.interval = new Array();
    this.scrollNum = option.scrollNum || this.count;
    this.scrollHeight = this.height * this.scrollNum;
    this.oHeight = this.height * this.count;
    this.ctrl = option.ctrl || null;
    this.running = false;
    this.init();
};
Scroll.prototype = {
    start:function (isdown) {
        var self = this;
        if (this.oNote.attr("scrollHeight") - this.oHeight <= this.oNote.attr("scrollTop")) {
            this.oNote.attr("scrollTop", this.oNote.attr("scrollHeight") / 2 - this.oHeight);
        }
        this.clear_interval(1);
        this.interval[1] = setInterval(function () {
            self.scroll_note(isdown);
        }, 5);
    },
    scroll_note:function (isdown) {
        if (isdown) {
            this.oNote[0].scrollTop++;
        }
        else {
            this.oNote[0].scrollTop--;
        }
        this.running = true;
        if (this.oNote[0].scrollTop % this.scrollHeight == 0) {
            this.clear_interval(1);
            this.running = false;

        }
    },
    set_interval:function () {
        var self = this;
        this.interval[0] = setInterval(function () {
            self.start(true);
        }, this.delay);
    },
    clear_interval:function (i) {
        clearInterval(this.interval[i]);
    },
    init:function () {
        var self = this;
        var html = this.oNote.html();
        this.oNote.html(html + html);
        this.oNote.css("height", this.oHeight);
        this.oNote.css("overflow", "hidden");
        this.oNote.css("padding", "0px");
        this.oNote.find("li").css("margin", "0px");
        this.oNote.attr("scrollTop", "0px");
        if (this.oNote.attr("scrollHeight") > this.oHeight) {
            this.oNote.mouseover(function () {
                self.clear_interval(0);
            });
            this.oNote.mouseout(function () {
                self.set_interval();
            });
            if (this.ctrl) {
                this.ctrl[0].mouseover(function () {
                    self.clear_interval(0);
                });
                this.ctrl[0].mouseout(function () {
                    self.set_interval();
                });
                this.ctrl[1].mouseover(function () {
                    self.clear_interval(0);
                });
                this.ctrl[1].mouseout(function () {
                    self.set_interval();
                });

                this.ctrl[0].click(function () {
                    self.start(false);
                });
                this.ctrl[1].click(function () {
                    self.start(true);
                });
            }
            this.set_interval();
        }
        else {
            if (this.ctrl) {
                this.ctrl[0].hide();
                this.ctrl[1].hide();
            }
        }
    }
};

//消息滚动
jQuery(function () {
    if (!jQuery("#pnl_notice").is(':visible')) {
        jQuery("#pnl_notice").show();
        new Scroll({elid:"pnl_notice", lineHeight:25, scrollNum:1});
    }
});
//图片记载
(function ($) {
    $.fn.LoadImage = function (settings) {
        settings = $.extend({
            loadpic:"",
            w:530, h:350
        }, settings);
        return this.each(function () {
            $.fn.LoadImage.Showimg($(this), settings);
        });
    };
    $.fn.LoadImage.Showimg = function ($this, settings) {
        var src = $this.attr("src");
        var img = new Image();
        img.src = src;
        $this.attr("src", "");
        var loading = $("<div><img width=\"" + settings.w + "\" height=\"" + settings.h + "\" src=\"" + settings.loadpic + "\" /><img src=\"http://file.mafengwo.cn/images/plugins/loading_blue.gif\" /></div>").appendTo($("body")).css({position:"absolute", top:$this.offset().top, left:$this.offset().left});
        $this.hide();
        if (!img.complete) {
            jQuery(img).bind('error load onreadystatechange', function () {
                loading.remove();
                $this.attr("src", src);
                $this.show();
            });
        } else {
            loading.remove();
            $this.attr("src", src);
            $this.show();
        }
    }
})(jQuery);

//poke
var mfw_poke = function (uid) {
    var obj = mAlert('<label style="cursor:pointer" for="pokeitem_1"><input id="pokeitem_1" type="radio" checked="checked" value="对你说“很高兴认识你”" name="acttype"><img src="http://images.mafengwo.net/images/home/poke/i1.gif">很高兴认识你</label><label style="cursor:pointer" for="pokeitem_2"><input value="向你打招呼" id="pokeitem_2" type="radio" name="acttype"><img src="http://images.mafengwo.net/images/home/poke/i2.gif">打招呼</label><label style="cursor:pointer" for="pokeitem_3"><input  value="同你握了下手" id="pokeitem_3" type="radio" name="acttype"><img src="http://images.mafengwo.net/images/home/poke/i3.gif">握手</label><label style="cursor:pointer" for="pokeitem_4"><input value="聊聊" id="pokeitem_4" type="radio" name="acttype"><img src="/images/home/icon_7.gif">聊聊</label><div id="pnl_pokechat" class="hide"><br>说点什么：<br><textarea style="width:200px;height:50px"></textarea></div>', "打个招呼", function () {
        var msg = jQuery.trim(obj.find(":checked").val());
        //alert(msg);
        if (msg == "聊聊") {
            var _content = jQuery.trim(jQuery("#pnl_pokechat textarea").val());
            if (_content.length > 0)
                jQuery.post("/ajax/ajax_send.php", {touid:uid, type:"msg", content:_content, _need_cstk:true}, function (d) {
                    if (d.ret == 1) {
                        mTinyAlert(d.msg);
                    } else {
                        majaxerr(d);
                    }
                }, "json");
            else
                return "说点什么吧！";
        }
        else {
            jQuery.post("/ajax/ajax_poke.php", {touid:uid, msg:msg, act:"poke"}, function (d) {
                if (d.ret == 1) {
                    mTinyAlert(d.msg);
                } else {
                    majaxerr(d);
                }
            }, "json");
        }
    }, -1);
    obj.find(":radio").click(function () {
        if (jQuery(this).attr("id") == "pokeitem_4")
            jQuery("#pnl_pokechat").removeClass("hide");
        else
            jQuery("#pnl_pokechat").addClass("hide");
    });
    jQuery(".pop-ctn").addClass("pop-con").removeClass("pop-ctn");
}
//pop
mPop = function (content, title, ctrl, overlay) {
    mPop.GUID++;
    this.content = content;
    this.title = title || "提示";
    this.ctrl = ctrl || {"确定":""};
    this.overlay = overlay || false;
    this.id = "mPop" + mPop.GUID;
    this.obj = jQuery(mPop.prototype.tpl).appendTo("body").attr("id", this.id);
    this.init();
    return this;
}
mPop.prototype.tpl = '<div class="p_w"><div class="p_c"><h3><span class="_t"></span></h3><div class="ct"><p class="_p"></p></div><a href="javascript:void(0)" class="c _c" title="关闭">关</a><div class="b _b"></div></div><div class="bg"></div></div>';
mPop.prototype.init = function () {
    var s = this;
    this.updateT(this.title);
    this.updateP(this.content);
    this.updateB(this.ctrl);
    this.obj.find("._c").click(function () {
        s.hide();
    });
    if (this.overlay)$.alerts._overlay('show');
    mPop.list[this.id] = this.obj;
};
mPop.prototype.close = function () {
    this.obj.remove();
    mPop.list[this.id] = null;
    if (this.overlay)$.alerts._overlay('hide');
};
mPop.prototype.hide = function () {
    this.obj.hide();
    if (this.overlay)$.alerts._overlay('hide');
};
mPop.prototype.updateP = function (p) {
    this.obj.find("._p").html(p);
};
mPop.prototype.updateT = function (t) {
    this.obj.find("._t").html(t);
};
mPop.prototype.updateB = function (b) {
    this.obj.find("._b").html("");
    for (var k in b) {
        var btn = jQuery('<button type="button">' + k + '</button>').appendTo(this.obj.find("._b"));
        if (typeof(b[k]) == "function") {
            btn.click(function () {
                b[k](btn);
            });
        } else {
            btn.click(this.hide);
        }
    }
};
mPop.closeAll = function () {
    for (var k in mPop.list) {
        mPop.list[k].remove();
        mPop.list[k] = null;
    }
}
mPop.prototype.hideC = function () {
    this.obj.find("._c").remove()
};
mPop.GUID = 0;
mPop.list = {};

(function ($) {
    var opt;

    $.fn.seekIterate = function (i) {
        var $els = this;
        $els.eq(i).seekExecute();
        setTimeout(function () {
            if (i < $els.length - 1) {
                $els.seekIterate(i + 1);
            }
        }, opt.multiple.interval);
    }

    $.fn.seekExecute = function () {
        this.each(function (i) {
            var $el = jQuery(this);
            var $startFrom = opt.startFrom;
            var $hi = $("<div id='divHilight" + i + "' />");

            $hi.css({   width:$startFrom[0] == window ? $startFrom.width() - 10 : $startFrom.outerWidth(),
                height:$startFrom[0] == window ? $startFrom.height() - 10 : $startFrom.outerHeight(),
                "background-color":opt.css.backgroundColor,
                "border-color":opt.css.borderColor,
                "border-style":opt.css.borderStyle,
                "border-width":opt.css.borderWidth,
                position:"absolute",
                top:$startFrom[0] == window ? 0 : $startFrom.offset().top,
                bottom:0,
                right:0,
                left:$startFrom[0] == window ? 0 : $startFrom.offset().left,
                padding:"0px" })
                .appendTo("body")
                .animate({  top:$el.offset().top - $hi.css("border-top-width").replace("px", ""),
                    left:$el.offset().left - $hi.css("border-left-width").replace("px", ""),
                    width:$el.outerWidth(),
                    height:$el.outerHeight() },
                opt.animation.speed,
                opt.animation.easeFunction,
                function () {

                    $hi.animate({ opacity:"0"}, 200)
                        .animate({ opacity:'1' }, 200)
                        .animate({ opacity:'0' }, 200)
                        .animate({ opacity:'1' }, 200)
                        .animate({ opacity:"0" }, 200, function () {
                            $hi.remove();
                        });

                });
        });
    }

    $.fn.seek = function (options) {
        opt = $.extend({}, $.fn.seek.defaults, options);
        if (options && options.css) {
            opt.css = $.extend({}, $.fn.seek.defaults.css, options.css);
        }
        if (options && options.animation) {
            opt.animation = $.extend({}, $.fn.seek.defaults.animation, options.animation);
        }
        if (options && options.multiple) {
            opt.multiple = $.extend({}, $.fn.seek.defaults.multiple, options.multiple);
        }

        var $els = this;

        if (opt.multiple.simultaneous) {
            $els.not(opt.startFrom).seekExecute();
        }
        else {
            $els.not(opt.startFrom).seekIterate(0);
        }
    }

    $.fn.seek.defaults = {
        css:{  backgroundColor:"Transparent",
            borderColor:"#ff4444",
            borderStyle:"solid",
            borderWidth:"1px",
            position:"absolute",
            top:0,
            bottom:0,
            right:0,
            left:0 },
        startFrom:$(window),
        animation:{ easeFunction:"swing",
            speed:500 },
        multiple:{ simultaneous:true,
            interval:800 }
    };
})(jQuery);


function copyToClipboard(txt) {
    if (window.clipboardData) {
        window.clipboardData.clearData();
        window.clipboardData.setData("Text", txt);
    } else if (navigator.userAgent.indexOf("Opera") != -1) {
        window.location = txt;
    } else if (window.netscape) {
        try {
            netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
        } catch (e) {
            mAlert("被浏览器拒绝！\n请在浏览器地址栏输入'about:config'并回车\n然后将'signed.applets.codebase_principal_support'设置为'true'");
        }
        var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
        if (!clip)
            return;
        var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
        if (!trans)
            return;
        trans.addDataFlavor('text/unicode');
        var str = new Object();
        var len = new Object();
        var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
        var copytext = txt;
        str.data = copytext;
        trans.setTransferData("text/unicode", str, copytext.length * 2);
        var clipid = Components.interfaces.nsIClipboard;
        if (!clip)
            return false;
        clip.setData(trans, null, clipid.kGlobalClipboard);
        mAlert("复制成功")
    }
}
var newMessageRemind = {
    _step:0,
    _actived:true,
    _title:document.title,
    _timer:null,
    //显示新消息提示
    show:function (title) {
        var title = title || "通知";
        var temps = newMessageRemind._title.replace("【　　　】", "").replace("【新" + title + "】", "");
        newMessageRemind._timer = setTimeout(function () {
            newMessageRemind.show(title);
            //这里写Cookie操作
            newMessageRemind._step++;
            if (newMessageRemind._step == 3) {
                newMessageRemind._step = 1
            }
            ;
            if (newMessageRemind._step == 1) {
                document.title = "【　　　】" + temps
            }
            ;
            if (newMessageRemind._step == 2) {
                document.title = "【新" + title + "】" + temps
            }
            ;
        }, 800);
        return [newMessageRemind._timer, newMessageRemind._title];
    },
    //取消新消息提示
    clear:function () {
        clearTimeout(newMessageRemind._timer);
        document.title = newMessageRemind._title;
        //这里写Cookie操作
    }

};

jQuery.cookie = function (key, value, options) {

    // key and at least value given, set cookie...
    if (arguments.length > 1 && String(value) !== "[object Object]") {
        options = jQuery.extend({}, options);

        if (value === null || value === undefined) {
            options.expires = -1;
        }

        if (typeof options.expires === 'number') {
            var days = options.expires, t = options.expires = new Date();
            t.setDate(t.getDate() + days);
        }

        value = String(value);

        return (document.cookie = [
            encodeURIComponent(key), '=',
            options.raw ? value : encodeURIComponent(value),
            options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
            options.path ? '; path=' + options.path : '',
            options.domain ? '; domain=' + options.domain : '',
            options.secure ? '; secure' : ''
        ].join(''));
    }

    // key and possibly options given, get cookie...
    options = value || {};
    var result, decode = options.raw ? function (s) {
        return s;
    } : decodeURIComponent;
    return (result = new RegExp('(?:^|; )' + encodeURIComponent(key) + '=([^;]*)').exec(document.cookie)) ? decode(result[1]) : null;
};

function jb(title) {
    var obj = mAlert('<textarea id="pnl_jubao" style="width:370px;height:60px;"></textarea>', "填写举报原因", function () {
        var _content = jQuery.trim(jQuery("#pnl_jubao").val());
        if('' == _content) {
            return '请填写举报原因！';
        } else {
            var content = title + ' 举报原因：' + _content;
            jQuery.post("/ajax/ajax_msg.php", {a:"jubao", c:content}, function (d) {
                if (d.ret == 1) {
                    mTinyAlert("举报成功");
                } else {
                    mTinyAlert("举报失败");
                }
            }, "json");
        }
    });
}

function mf(settings) {
    var settings = $.extend(mf.settings, settings);
    var pnl = $("<div class='" + settings.baseCLS + "'>" + settings.content + "</div>")
        .appendTo($('body'))
        .css({"width":settings.width + "px", "marginLeft":"-" + settings.width / 2 + "px", "left":"50%", zIndex:1000});
    pnl.find("." + settings.closeCLS)
        .click(function () {
            settings.onClose ? settings.onClose.call(pnl) : pnl.remove();
            $.alerts._overlay('hide');
        });
    $.alerts._overlay('show');
    mf.last.pnl = pnl;
    mf.last.settings = settings;
    return pnl;
}
;
mf.settings = {
    content:'About mf:a simple float panel!<a class="close">close</a><br>\
            content:"your content",<br/>\
            width:your panel`s width,default is 200<br/>\
            zIndex:your panel`s zIndex,default is 1000<br/>\
            baseCLS:your panel classame,default is "mf"<br/>\
            closeCLS:the close action base on, default is "close"<br/><br/>\
            close API is: mf.close();<br/>\
            Css Demo:<br/>.fm{position:fixed;top:17%;}<br/>\
            * html .fm{position: absolute;top: expression((document.documentElement.scrollTop || document.body.scrollTop) + Math.round(17 * (document.documentElement.offsetHeight || document.body.clientHeight) / 100) + "px");}\
            ',
    width:400,
    zIndex:1000,
    baseCLS:"mf",
    closeCLS:"close",
    onClose:false
}
mf.close = function () {
    if (mf.last) {
        mf.last.settings.onClose ? mf.last.settings.onClose.call(mf.last.pnl) : mf.last.pnl && mf.last.pnl.remove();
    }
    $.alerts._overlay('hide');
}
mf.last = {};
function show_pop_html(obj, marginleft_px, index) {
    $.alerts._overlay('hide');
    obj.css("top", '10%');
    obj.css("left", '50%');
    obj.css("marginLeft", "-" + marginleft_px + "px");
    obj.css("marginTop", ($(window).scrollTop() + 50) + "px");
    obj.css("position", 'absolute');
    if (index)
        obj.css("zIndex", index);
    else
        obj.css("zIndex", '1001');
    $.alerts._overlay('show');
    obj.removeClass('hide');
}
function close_pop_html(obj) {
    $.alerts._overlay('hide');
    obj.addClass('hide');
}

function active_weng() {

    if (!$.cookie("SHOW_ACTIVE_WENG", {path:'/'})) {

        var html = '<div class="wengComing_close"><a id="btn_wengnew_close" title="关闭" href="javascript:;">关闭</a></div>\
                        <div class="wengComing">\
                            <a target="_blank" href="http://www.mafengwo.cn/i/914893.html">嗡嗡来了</a>\
                        </div>'
        $('body').append(html);
        $.alerts.overlayOpacity = .9;
        $.alerts._overlay('show');
        $("#btn_wengnew_close").click(function () {
            $(this).parent().next().remove().end().remove();
            $.alerts._overlay('hide');
            $.cookie("SHOW_ACTIVE_WENG", true, { expires:1, path:'/', domain:'mafengwo.cn'});
        });
    }

}

function add_op_log(type, key, subkey, params, ip, uid, uuid, rtime) {
    $.post('/ajax/ajax_logs.php', {
        action: 'add_op_logs',
        type: type,
        key: key,
        subkey: subkey,
        ip: ip,
        uid: uid,
        uuid: uuid,
        rtime: rtime,
        params: params
    }, null, 'json');
}

function parse_url(url) {
    var patten = /^((\w+):\/\/)?((\w+):?(\w+)?@)?([^\/\?:]+):?(\d+)?(\/?[^\?#]+)?\??([^#]+)?#?(\w*)/,
        result = patten.exec(url),
        keys = ['url', 'fragment', 'protocol', false, 'username', 'password', 'host', 'port', 'pathname', 'querystring'],
        obj = new Object();

    for(var i = 0; i < keys.length; i++) {
        if(!keys[i]) {
            continue;
        }
        obj[keys[i]] = result[i] ? result[i] : '';
    }
    return obj;
}

(function($){
    $.fn.hoverDelay = function(options){
        var defaults = {
            hoverDuring: 350,
            outDuring: 150,
            hoverEvent: function(){
                $.noop();
            },
            outEvent: function(){
                $.noop();
            }
        };
        var sets = $.extend(defaults,options || {});
        var hoverTimer, outTimer, that = this;
        return $(this).each(function(){
            $(this).hover(function(){
                clearTimeout(outTimer);
                hoverTimer = setTimeout(function(){sets.hoverEvent.apply(that)}, sets.hoverDuring);
            },function(){
                clearTimeout(hoverTimer);
                outTimer = setTimeout(function(){sets.outEvent.apply(that)}, sets.outDuring);
            });
        });
    }
})(jQuery);

(function($) {
    $.mfwplugins = {
        emotions: [
            {title: '大笑', file: '/images/i/face/1.gif'},
            {title: '微笑', file: '/images/i/face/2.gif'},
            {title: '亲亲', file: '/images/i/face/3.gif'},
            {title: '抱抱', file: '/images/i/face/4.gif'},
            {title: '色色', file: '/images/i/face/5.gif'},
            {title: '好失望哟', file: '/images/i/face/6.gif'},
            {title: '好困哦', file: '/images/i/face/7.gif'},
            {title: '害羞', file: '/images/i/face/8.gif'},
            {title: '酷呆了', file: '/images/i/face/9.gif'},
            {title: '晕倒', file: '/images/i/face/10.gif'},
            {title: '眨眼', file: '/images/i/face/11.gif'},
            {title: '鬼脸', file: '/images/i/face/12.gif'},
            {title: '小声点', file: '/images/i/face/13.gif'},
            {title: '吃惊', file: '/images/i/face/14.gif'},
            {title: '翻白眼', file: '/images/i/face/15.gif'},
            {title: '干杯', file: '/images/i/face/16.gif'},
            {title: '困惑', file: '/images/i/face/17.gif'},
            {title: '啥？', file: '/images/i/face/18.gif'},
            {title: '睡觉', file: '/images/i/face/19.gif'},
            {title: '再见了', file: '/images/i/face/20.gif'},
            {title: '眼泪哗哗地', file: '/images/i/face/21.gif'},
            {title: '你好讨厌', file: '/images/i/face/22.gif'},
            {title: '我吐', file: '/images/i/face/23.gif'},
            {title: '怒骂', file: '/images/i/face/24.gif'},
            {title: '闭嘴', file: '/images/i/face/25.gif'},
            {title: '打你', file: '/images/i/face/26.gif'},
            {title: '真的生气了', file: '/images/i/face/27.gif'},
            {title: '超级棒', file: '/images/i/face/28.gif'},
            {title: '不咋地', file: '/images/i/face/29.gif'},
            {title: '魅力四射', file: '/images/i/face/30.gif'},
            {title: '心都碎了', file: '/images/i/face/31.gif'},
            {title: '爱', file: '/images/i/face/32.gif'},
            {title: '吻', file: '/images/i/face/33.gif'},
            {title: '玫瑰凋谢了', file: '/images/i/face/34.gif'},
            {title: '玫瑰盛开了', file: '/images/i/face/35.gif'},
            {title: '生日蛋糕', file: '/images/i/face/36.gif'},
            {title: '礼物', file: '/images/i/face/37.gif'},
            {title: '苹果', file: '/images/i/face/38.gif'},
            {title: '西瓜', file: '/images/i/face/39.gif'},
            {title: '咖啡', file: '/images/i/face/40.gif'},
            {title: '足球', file: '/images/i/face/41.gif'},
            {title: '握手', file: '/images/i/face/42.gif'},
            {title: '星星', file: '/images/i/face/43.gif'},
            {title: '精灵', file: '/images/i/face/44.gif'},
            {title: '小丑', file: '/images/i/face/45.gif'},
            {title: '大怒', file: '/images/i/face/46.gif'},
            {title: '生病了', file: '/images/i/face/47.gif'},
            {title: '小可爱', file: '/images/i/face/48.gif'},
            {title: '小心非典', file: '/images/i/face/49.gif'},
            {title: '嘴馋了', file: '/images/i/face/50.gif'},
            {title: '警察', file: '/images/i/face/51.gif'},
            {title: '抓狂了', file: '/images/i/face/52.gif'},
            {title: '不爽', file: '/images/i/face/53.gif'},
            {title: '汗', file: '/images/i/face/54.gif'},
            {title: '思考中', file: '/images/i/face/55.gif'},
            {title: '见钱眼开', file: '/images/i/face/56.gif'},
            {title: '呲牙咧嘴', file: '/images/i/face/57.gif'},
            {title: '晕头转向', file: '/images/i/face/58.gif'},
            {title: '好好爱你哦', file: '/images/i/face/59.gif'},
            {title: '猪头', file: '/images/i/face/60.gif'},
            {title: '便便', file: '/images/i/face/61.gif'},
            {title: '月亮', file: '/images/i/face/62.gif'},
            {title: '音乐', file: '/images/i/face/63.gif'},
            {title: '饭', file: '/images/i/face/64.gif'},
            {title: '真衰', file: '/images/i/face/65.gif'},
            {title: '偷笑', file: '/images/i/face/66.gif'},
            {title: '下雨', file: '/images/i/face/67.gif'},
            {title: '猫猫', file: '/images/i/face/68.gif'},
            {title: '狗狗', file: '/images/i/face/69.gif'},
            {title: '骷髅', file: '/images/i/face/70.gif'},
            {title: '书呆子', file: '/images/i/face/71.gif'},
            {title: '太阳', file: '/images/i/face/72.gif'},
            {title: '邮件', file: '/images/i/face/73.gif'},
            {title: '帅帅男孩', file: '/images/i/face/74.gif'},
            {title: '妩媚女孩', file: '/images/i/face/75.gif'},
            {title: '药丸', file: '/images/i/face/76.gif'},
            {title: '鄙视', file: '/images/i/face/77.gif'},
            {title: '烧香', file: '/images/i/face/78.gif'}
        ],
        callusers: {},
        buildGotop: function() {
            if($('.m-gotopbtn').size() > 0) {
                return false;
            }
            $('<div class="m-gotopbtn"><a href="javascript:void(0);" hidefocus="true" title="飞回顶部" rel="nofollow"></a></div>')
                .find('a').bind('click', function() {
                    $('html,body').animate({
                        scrollTop: 0
                    }, 500);
                }).end().appendTo($('body'));
            $(window).bind('scroll', function() {
                if($(document).scrollTop() > 500) {
                    if($('.m-gotopbtn a').position().top == 100) {
                        $('.m-gotopbtn a').animate({top: -95}, 300);
                    }
                } else {
                    if($('.m-gotopbtn a').position().top == -95) {
                        $('.m-gotopbtn a').animate({top: 100}, 300);
                    }
                }
            });
        },
        /*dropZ: function() {
            for(var i = 0; i < 16; i ++) {
                var key = Math.floor(Math.random() * 8 + 1), //取1-8随机数
                    itemZ = $('<div class="zz_icon' + key + '"></div>').css({
                        'z-index': 9999,
                        'top': -400 + Math.random() * 300,
                        'left': Math.random() * ($(window).width() - 74)
                    }).appendTo($('body'));
                itemZ.animate({
                    top: $(window).height() - 74,
                    translate3d: '0,10px,0'
                }, 2300 * Math.random() + $(window).height() * 1.5, '', function() {
                    $(this).fadeOut(300, function() {
                        $(this).remove();
                    });
                });
            }
        },*/
        showClosing: function(startTime, endTime, callback, btnText) {
            if(startTime >= endTime) {
                return;
            }
            var start_date = new Date(startTime),
                end_date = new Date(endTime),
                start_day = start_date.getFullYear() + '.' + (start_date.getMonth() + 1) + '.' + start_date.getDate(),
                end_day = end_date.getFullYear() + '.' + (end_date.getMonth() + 1) + '.' + end_date.getDate(),
                start_time = start_date.getHours() + ':' + start_date.getMinutes(),
                end_time = end_date.getHours() + ':' + end_date.getMinutes(),
                start_text, end_text;
            start_text = start_day + ' ' + start_time;
            if(start_day == end_day) {
                end_text = end_time;
            } else {
                end_text = end_day + ' ' + end_time;
            }
            btnText = (undefined != btnText && null != btnText) ? btnText : '确定';
            if('function' == typeof callback) {
                callback = function() {
                    callback();
                };
            } else {
                btnText = '返回首页';
                callback = function() {
                    location.href = '/';
                };
            }
            mAlert('<div class="weihu">' + start_text + ' 至 ' + end_text + '</div>', '', callback, -1, true);
            $('#popup_ok').val(btnText);
        }
    };

    $.mfwfeed = {
        /**
         * 开放平台类型
         */
        keys: {
            weibo: 'wb',
            qzone: 'qz',
            qweibo: 'qt',
            renren: 'rr'
        },
        /**
         * 用户设置类型
         */
        types: {
            type_w: 'weng',
            type_ap: 'a_piblic',
            type_ar: 'a_reply',
            type_ac: 'activity',
            type_f: 'feed'
        },
        /**
         * @name 添加开放平台分享任务
         * @param key 开放平台类型
         * @param title 分享标题
         * @param content 分享内容
         * @param image 分享图片
         * @param url 分享链接
         * @param comment 分享原因
         * @param type 用户设置类型
         * @param triggerUrl 触发URL
         * @param callback 回调方法
         */
        addFeedTask: function(key, title, content, image, url, comment, type, triggerUrl, callback) {
            if('undefined' == typeof(triggerUrl) || null == typeof(triggerUrl) || '' == triggerUrl) {
                triggerUrl = location.href;
            }
            var feed_data = {
                key: key,
                title: title,
                content: content,
                image: image,
                url: url,
                comment: comment,
                type: type
            };
            $.post('/ajax/ajax_user_task.php', {
                act: 'add_task',
                type: 'sf',
                data: $.toJSON(feed_data),
                url: triggerUrl
            }, function(d) {
                if('function' == typeof callback) {
                    callback();
                }
            }, 'json');
        },
        manageFeedTask: function(triggerUrl, callback) {
            if('undefined' == typeof(triggerUrl) || null == typeof(triggerUrl) || '' == triggerUrl) {
                triggerUrl = location.href;
            }
            $.post('/ajax/ajax_user_task.php', {
                act: 'manage_task',
                type: 'sf',
                url: triggerUrl
            }, function(d) {
                if('function' == typeof callback) {
                    callback(d);
                } else {
                    if(d.no == 1) {
                        mAlert('分享成功');
                    } else {
                        mAlert('分享失败');
                    }
                }
            })
        }
    };
})(jQuery);
jQuery(function() {
    //$.mfwfeed.manageFeedTask();
});
