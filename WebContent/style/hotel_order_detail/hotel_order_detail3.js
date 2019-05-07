M.define("dialog/Layer",function(a){var g=0,f=550,d=(function(){return $.browser&&$.browser.msie&&parseInt($.browser.version,10)==7}()),c=(function(){return $.browser&&$.browser.msie&&parseInt($.browser.version,10)<7}());function b(){return g++}function e(h){this.opacity=0.8;this.background="#fff";this.impl="Dialog";this.fixed=true;M.mix(this,h);this.id="_j_layer_"+b();this.stacks=[];this.activeStackId=null;this.overflow=false;this.changeFixed=false;e.instances[this.id]=this;if(!e[this.impl]){e[this.impl]=[]}e[this.impl].push(this.id);this.init()}e.prototype={init:function(){this._createPanel()},_createPanel:function(){f++;var h={position:(!c&&this.fixed)?"fixed":"absolute",width:"100%",height:"100%",top:0,left:0},j=M.mix({},h,{"z-index":f,display:"none"}),k=M.mix({},h,{position:!c?"fixed":"absolute",background:this.background,opacity:this.opacity,"z-index":-1}),i=M.mix({},h,{"z-index":0},(!c&&this.fixed)?{"overflow-x":"hidden","overflow-y":"hidden"}:{overflow:"visible"});this._panel=$('<div id="'+this.id+'" class="layer _j_layer">                                <div class="layer_mask _j_mask"></div>                                <div class="layer_content _j_content"></div>                            </div>').css(j).appendTo("body");this._mask=this._panel.children("._j_mask").css(k);this._content=this._panel.children("._j_content").css(i)},setZIndex:function(h){f=h;this._panel.css("z-index",f)},getZIndex:function(){return +this._panel.css("z-index")},toFront:function(){this.setZIndex(f+1)},setFixed:function(h){h=!!h;if(this.fixed!=h){this.changeFixed=true;this.fixed=h;if(!c&&this.fixed){this._panel.css("position","fixed");this._content.css({position:"fixed","overflow-x":"hidden","overflow-y":"hidden"})}else{this._panel.css("position","absolute");this._content.css({position:"absolute","overflow-x":"","overflow-y":"",overflow:"visible"})}}else{this.changeFixed=false}},newStack:function(i){var h=$(i).appendTo(this._content);this.stacks.push(h);return this.stacks.length-1},getStack:function(h){return this.stacks[h]},getActiveStack:function(){return this.stacks[this.activeStackId]},setActiveStack:function(h){this.activeStackId=h},getPanel:function(){return this._panel},getMask:function(){return this._mask},getContent:function(){return this._content},show:function(j){var i=this;if(this.visible){typeof j==="function"&&j();return}e.activeId=this.id;this.visible=true;if(c){var h=document.documentElement&&document.documentElement.scrollHeight||document.body.scrollHeight;this._panel.css("height",h);this._mask.css("height",h)}this._panel.fadeIn(200,function(){typeof j==="function"&&j()})},hide:function(i){var h=this;if(!this.visible){typeof i==="function"&&i();return}this.visible=false;if(c){this._panel.css("height","");this._mask.css("height","")}this._panel.fadeOut(200,function(){typeof i==="function"&&i();h._recoverTopScroller()})},setOverFlow:function(h){this.overflow=h;if(h){if(!c&&this.fixed){this._hideTopScroller();this._content.css("overflow-y","auto")}}else{if(!c&&this.fixed){this._content.css("overflow-y","hidden")}}},_hideTopScroller:function(){if(d){$("html").css("overflow","hidden")}else{if(!c){$("body").css("overflow","hidden")}else{$("body").css("overflow-x","hidden");this._panel.height($(document).height()+20)}}},_recoverTopScroller:function(){if(d){$("html").css("overflow","")}else{if(!c){$("body").css("overflow","")}else{$("body").css("overflow-x","")}}},destroy:function(){this.hide($.proxy(function(){this._panel&&this._panel.remove();this._panel=null;if(M.indexOf(e[this.impl],this.id)!=-1){e[this.impl].splice(M.indexOf(e[this.impl],this.id),1)}delete e.instances[this.id]},this))},clear:function(){this._content.empty();this.stacks=[];this.activeStackId=null}};e.instances={};e.activeId=null;e.getInstance=function(h){return e.instances[h]};e.getActive=function(h){var i=e.getInstance(e.activeId);if(h&&i){i=i.impl===h?i:null}return i};e.getImplInstance=function(i){var h=e.getActive(i);if(!h&&M.is(e[i],"Array")&&e[i].length){h=e.getInstance(e[i][e[i].length-1])}return h};e.closeActive=function(){var h=e.getActive();if(h&&h.getActiveStack()){h.getActiveStack().trigger("close")}};$(document).keyup(function(h){if(h.keyCode==27){e.closeActive()}});$(document).unload(function(){M.forEach(e.instances,function(){e.destroy()})});return e});M.define("dialog/DialogBase",function(b){var e=b("dialog/Layer"),a=M.Event,d=(function(){return $.browser&&$.browser.msie&&parseInt($.browser.version,10)<7}());function c(f){this.newLayer=false;this.width="";this.height="";this.background="#000";this.panelBackground="#fff";this.bgOpacity=0.7;this.stackable=true;this.fixed=true;this.reposition=false;this.autoPosition=true;this.minTopOffset=20;this.layerZIndex=-1;this.impl="Dialog";M.mix(this,f);this.visible=false;this.destroyed=false;this.positioned=false;this.resizeTimer=0;this.init()}c.prototype={tpl:"<div />",init:function(){this._createDialog();this._bindEvents()},_createDialog:function(){this._panel=$(this.tpl).css({position:"absolute",opacity:0,display:"none",background:this.panelBackground,"z-index":0});this.setRect({width:this.width,height:this.height});this._layer=!this.newLayer&&e.getImplInstance(this.impl)||new e({impl:this.impl});if(this.layerZIndex>=0){this._layer.setZIndex(this.layerZIndex)}this._layer.setFixed(this.fixed);this._layer.getMask().css({background:this.background,opacity:this.bgOpacity});this._stackId=this._layer.newStack(this._panel);this.setPanelContent()},_bindEvents:function(){var f=this;$(window).resize($.proxy(this.resizePosition,this));M.Event(this).on("resize",$.proxy(this.resizePosition,this));this._panel.delegate("._j_close, a[data-dialog-button]","click",function(g){var h=$(g.currentTarget).attr("data-dialog-button");if(h=="hide"){f.hide()}else{f.close()}g.preventDefault()});this._panel.bind("close",function(g,h){f.close(h)})},resizePosition:function(){var f=this;clearTimeout(this.resizeTimer);if(f.visible&&f.autoPosition){this.resizeTimer=setTimeout(function(){f.setPosition()},100)}},addClass:function(f){this._panel.addClass(f)},removeClass:function(f){this._panel.removeClass(f)},setRect:function(f){if(f.width){this._panel.css("width",f.width);this.width=f.width}if(f.height){this._panel.css("height",f.height);this.height=f.height}},getPanel:function(){return this._panel},getLayer:function(){return this._layer},getMask:function(){return this._layer&&this._layer.getMask()},setPanelContent:function(){},_getPanelRect:function(){var f=this.getPanel(),g=f.outerHeight(),h=f.outerWidth();if(!f.is(":visible")){f.css({visibility:"hidden",display:"block"});var g=f.outerHeight(),h=f.outerWidth();f.css({visibility:"",display:""})}return{height:g,width:h}},_getNumric:function(f){f=parseInt(f,10);return isNaN(f)?0:f},setPosition:function(f){var g=this._getPanelRect(),h={width:$(window).width(),height:$(window).height()};var k=(h.width-(this._getNumric(this.width)>0?this._getNumric(this.width):g.width))/2,j=(h.height-(this._getNumric(this.height)>0?this._getNumric(this.height):g.height))*4/9;j=j<this.minTopOffset?this.minTopOffset:j;if(d||!this.fixed){var i=$(window).scrollTop();if(i>0){j+=i}}f={left:(f&&f.left)||k,top:(f&&f.top)||j};if(!d&&this.fixed){if(h.height-g.height<=f.top){this.getPanel().addClass("dialog_overflow");this._layer.setOverFlow(true)}else{this.getPanel().removeClass("dialog_overflow");this._layer.setOverFlow(false)}}var l=this.positioned?"animate":"css";$.fn[l].call(this.getPanel(),f,200);this.positioned=true;this.position=f},setFixed:function(f){this.fixed=!!f;this._layer.setFixed(this.fixed)},getPosition:function(){return this.position},show:function(f){if(this.visible){return}var h=this;a(this).fire("beforeshow");var g;if(this._layer.getActiveStack()){g=this._layer.getActiveStack();if(!this.reposition&&!f&&!this._layer.changeFixed){f=this._layer.getActiveStack().position()}}this._layer.show();this.getPanel().css({display:"","z-index":1});this.setPosition(f);g&&g.trigger("close",[true]);this.visible=true;this._layer.setActiveStack(this._stackId);this.getPanel().animate({opacity:1},{queue:false,duration:200,complete:function(){a(h).fire("aftershow")}})},close:function(){var f=this.stackable?"hide":"destroy";this[f].apply(this,Array.prototype.slice.call(arguments))},hide:function(g,f){if(typeof g=="function"){f=g;g=undefined}if(!this.visible){typeof f=="function"&&f();return}a(this).fire("beforeclose");a(this).fire("beforehide");this._layer.setActiveStack(null);this.visible=false;if(!g){this._layer.hide()}this.getPanel().animate({opacity:0},{queue:false,duration:200,complete:$.proxy(function(){this.getPanel().css({display:"none","z-index":0});a(this).fire("afterhide");a(this).fire("afterclose");typeof f=="function"&&f()},this)})},destroy:function(g,f){if(typeof g=="function"){f=g;g=undefined}if(this.destroyed){M.error("Dialog already destroyed!");typeof f=="function"&&f();return}a(this).fire("beforeclose");a(this).fire("beforedestroy");this.destroyed=true;this.hide(g,$.proxy(function(){if(this._panel.length){this._panel.undelegate();this._panel.unbind();this._panel.remove();this._panel=null}this._layer=null;a(this).fire("afterdestroy");a(this).fire("afterclose");typeof f=="function"&&f()},this))}};return c});M.define("dialog/Dialog",function(c){var d=c("dialog/DialogBase"),a='<div class="popup-box layer_dialog _j_dialog pop_no_margin">                    <div class="dialog_title" style="display:none"><div class="_j_title title"></div></div>                    <div class="dialog_body _j_content"></div>                    <a id="popup_close" class="close-btn _j_close"><i></i></a>                </div>';var b=M.extend(function(e){this.content="";this.title="";this.PANEL_CLASS="";this.MASK_CLASS="";b.$parent.call(this,e)},d);M.mix(b.prototype,{tpl:a,setPanelContent:function(){this._dialogTitle=this._panel.find("._j_title");this._dialogContent=this._panel.find("._j_content");this.setTitle(this.title);this.setContent(this.content);this.addClass(this.PANEL_CLASS);this.getMask().addClass(this.MASK_CLASS)},setTitle:function(e){if(e){this._dialogTitle.html(e).parent().css("display","")}else{this._dialogTitle.parent().css("display","none")}this.title=e},getTitle:function(){return this.title},setContent:function(e){this._dialogContent.empty().append(e)}});return b});M.define("dialog/confirm",function(c,e){var g=c("dialog/Dialog"),a='<div id="popup_container" class="popup-box new-popbox"><a class="close-btn _j_close _j_false"><i></i></a><div class="pop-ico" id="popup_icon"><i class="i2"></i></div><div class="pop-ctn"><p class="hd _j_content"></p><p class="bd _j_detail"></p></div><div class="pop-btns"><a role="button" tabindex="0" class="popbtn popbtn-cancel popbtn-half _j_close _j_false">&nbsp;取消&nbsp;</a><a role="button" tabindex="0" class="popbtn popbtn-submit popbtn-half _j_close _j_true">&nbsp;确定&nbsp;</a></div></div>',h=M.extend(function(k){var j={width:420,content:"请输入内容",background:"#000",bgOpacity:0.7,PANEL_CLASS:"pop_no_margin",reposition:true,impl:"Confirm",layerZIndex:10000};k=M.mix(j,k);h.$parent.call(this,k);this.bindEvents()},g),d=null,b=$.noop,i=$.noop,f=false;M.mix(h.prototype,{tpl:a,setConfirmTitle:function(j){this.setContent(j)},setConfirmContent:function(j){this.getPanel().find("._j_detail").text(j)},setAssureWords:function(j){this.getPanel().find(".popbtn-submit").text(j)},setCancelWords:function(j){this.getPanel().find(".popbtn-cancel").text(j)},bindEvents:function(){this.getPanel().on("click","._j_false",function(){f=false}).on("click","._j_true",function(){f=true}).on("keydown","._j_false",function(j){if(j.keyCode==13){$(this).trigger("click")}else{if(j.keyCode==39){$(this).next().focus()}}}).on("keydown","._j_true",function(j){if(j.keyCode==13){$(this).trigger("click")}else{if(j.keyCode==37){$(this).prev().focus()}}})}});e.pop=function(k,j,l){if(!d){d=new h();M.Event(d).on("afterhide",function(){if(f){b()}else{i()}});M.Event(d).on("aftershow",function(){d.getPanel().find("._j_true").focus()})}d.getLayer().toFront();if(M.isObject(k)){d.setConfirmTitle(k.title);d.setConfirmContent(k.content)}else{d.setConfirmTitle(k);d.setConfirmContent("")}if(M.isObject(k)){if(k.assureWords){d.setAssureWords(k.assureWords)}else{d.setAssureWords("确定")}if(k.cancelWords){d.setCancelWords(k.cancelWords)}else{d.setCancelWords("取消")}}else{d.setAssureWords("确定");d.setCancelWords("取消")}if(typeof j=="function"){b=j}else{b=$.noop}if(typeof l=="function"){i=l}else{i=$.noop}d.show();return d}});(function(b,a){if(b.M&&typeof b.M.define==="function"){b.M.define("/youyudf/js/hotel/order_zx",function(d,c,e){var f=a(d);e.exports=f})}})(this,function(a){var b={loaded:false,api_url:"/hotel_zx/hotel/pay_ajax.php",cur_order_id:"",v_code:"",email:"",isNewEmail:"",pop_cancel:$("#pop_cancel"),pop_msg:$("#pop_message"),pop_resend:$("#pop_resend"),overlay:$("#overlay"),list_resend_btn:$("#email_info"),new_email_info:$("#new_email_info"),change_info_form:$("#change_info_form"),init:function(){$("#change_info_form").verification({submitCallback:function(){},success:function(c){c.removeClass("inp-err");c.next(".ok-tip").css({display:"inline-block"}).end();c.closest("div").find(".ok-tip").css({display:"inline-block"}).end();c.closest("dd").find(".err-tip").hide();c.closest("dd").find(".empty-tip").hide()},failed:function(d,c){d.next(".ok-tip").css({display:"none"}).end();d.closest("div").find(".ok-tip").css({display:"none"}).end();d.addClass("inp-err");if($.trim($(d).val())==""){if(d.closest(".name-in").find(".empty-tip").length>0){d.closest(".name-in").find(".err-tip").hide();d.closest(".name-in").find(".empty-tip").show()}else{d.closest("dd").find(".err-tip").hide();d.closest("dd").find(".empty-tip").show()}}else{if(d.closest(".name-in").find(".err-tip").length>0){d.closest(".name-in").find(".empty-tip").hide();d.closest(".name-in").find(".err-tip").show()}else{d.closest("dd").find(".empty-tip").hide();d.closest("dd").find(".err-tip").show()}}}});$(".operate").on("click","[name=btnOrderCancel]",function(){var e=$(this),c=a("dialog/confirm"),d=$(this).data("cancelinfo");c.pop('真的要取消此订单么？<br/><span style="font-size: 12px;">'+d+"</span>",function(){b.cur_order_id=e.data("order_id");b.v_code=e.data("vcode");b.cancel(b.cur_order_id,b.v_code)})});$(".row").on("click",".btn_cancel",function(){b.cancelPopHandle($(this))}).on("click",".btn_resend",function(){b.resendHandle($(this))}).on("mouseenter",".show_policy",function(){b.showCancelInfo($(this))}).on("mouseleave",".show_policy",function(){b.hideCancelInfo($(this))});this.pop_cancel.on("click",".yes",function(){b.cancelHandle()}).on("click",".no",function(){b.noCancelHandle()});this.pop_msg.on("click",".cancel_submit",function(){b.hideMsgPop()}).on("click",".close",function(){b.hideMsgPop()});this.pop_cancel.find(".close").click(function(){b.noCancelHandle()});this.pop_resend.on("click",".yes",function(){var c=$("#resend_newemail").val()!=""?$("#resend_newemail").val():b.email;var d=$(this).parents().find("[name=save_new_email]").attr("checked")?1:0;b.resendOkHandle(c,b.cur_order_id,b.v_code,d)}).on("click",".no",function(){b.noResendHandle()}).on("click","[name=newemail]",function(){b.newEmailHandle($(this))});this.pop_resend.find(".close").click(function(){b.noResendHandle()});this.list_resend_btn.on("click","[name=change_email]",function(){$("#email_info").hide();$("#new_email_info").show()}).on("click","[name=resend_email]",function(){var c=$("#email_info").data("email"),e=$("#email_info").data("order_id"),d=$("#email_info").data("vcode");b.resendOkHandle(c,e,d)});this.change_info_form.on("click","[name=saveNewContact]",function(){var e=$("#change_info_form").find("#ipt_email").val(),d=$("#change_info_form").find("#ipt_contact").val(),c=$("#change_info_form").find("#ipt_phone").val(),g=$("#email_info").data("order_id"),f=$("#email_info").data("vcode");b.saveContactInfo(e,c,d,g,f)}).on("click","[name=cancelNewContact]",function(){});this.new_email_info.on("click","[name=save_email]",function(){var c=$("#new_email_info").find("input[name=new_email]").val(),e=$("#email_info").data("order_id"),d=$("#email_info").data("vcode");b.saveOrderEmail(c,e,d)}).on("click","[name=save_send_email]",function(){var c=$("#new_email_info").find("input[name=new_email]").val(),e=$("#email_info").data("order_id"),d=$("#email_info").data("vcode");b.resendOkHandle(c,e,d,1)})},resendHandle:function(c){this.overlay.show();b.cur_order_id=c.data("order_id");b.v_code=c.data("v_code");b.email=c.data("email");this.pop_resend.show().find("[name=resend_email]").text(b.email);this.pop_resend.show().find("[name=newemail]").val(b.email)},cancelPopHandle:function(c){this.overlay.show();this.pop_cancel.show().find(".cancel_info").html(c.siblings(".cancel_info").html());b.cur_order_id=c.data("order_id");b.v_code=c.data("v_code")},noCancelHandle:function(){this.overlay.hide();this.pop_cancel.hide()},noResendHandle:function(){this.overlay.hide();this.pop_cancel.hide()},noResendHandle:function(){this.overlay.hide();this.pop_resend.hide()},newEmailHandle:function(d){if(b.isNewEmail==1){b.isNewEmail=0;d.parents().find("em[name=resend_email]").html(b.email);d.parents().find("[name=newemail]").html("使用其他邮箱")}else{var c=$("<input/>").attr("id","resend_newemail").val("");d.parents().find("em[name=resend_email]").html("").append(c);c.focus();b.isNewEmail=1;d.parents().find("[name=newemail]").html("使用原邮箱")}},resendOkHandle:function(d,g,f,c){var e={sOrderId:g,sVCode:f};e.sEmail=d;if(c){e.iSaveNew=1}$.getJSON(this.api_url+"?sAction=resendEmail",e,function(h){$("#pop_resend").hide();if(h&&h.ret==0){$("#sendmsgcontainer").html(h.msg);$("#sendmsgcontainer").closest(".hb-sent").show();b.showSuccPop(h.msg)}else{$("#sendmsgcontainer").html(h.msg);$("#sendmsgcontainer").closest(".hb-sent").show();b.showMsgPop(h.msg)}})},saveOrderEmail:function(c,f,e){var d={sOrderId:f,sVCode:e,sEmail:c};$.getJSON(this.api_url+"?sAction=saveNewEmail",d,function(g){if(g&&g.ret==0){window.location.reload()}else{b.showMsgPop(g.msg)}})},saveContactInfo:function(e,c,d,h,g){var f={sOrderId:h,sVCode:g,sEmail:e,sPhone:c,sName:d};$.getJSON(this.api_url+"?sAction=saveNewContact",f,function(i){if(i&&i.ret==0){window.location.reload()}else{b.showMsgPop(i.msg)}})},cancelHandle:function(){this.pop_cancel.hide();this.cancel(b.cur_order_id,b.v_code)},showSuccPop:function(c){this.pop_msg.find(".yes").click(function(){window.location.reload()});b.showMsgPop(c)},showMsgPop:function(c){this.overlay.show();this.pop_msg.show().find(".cancel_tips").text(c)},hideMsgPop:function(){this.overlay.hide();this.pop_msg.hide()},cancel:function(d,c){$.getJSON(this.api_url+"?sAction=cancelRooms",{sOrderId:d,sVCode:c},function(e){if(e&&e.ret==0){$("#msgcontainer").html(e.msg);$("#msgcontainer").closest(".hb-sent").show();b.showSuccPop(e.msg)}else{$("#msgcontainer").html(e.msg);$("#msgcontainer").closest(".hb-sent").show();b.showMsgPop(e.msg)}})},showCancelInfo:function(c){c.find(".cancel_info").show()},hideCancelInfo:function(c){c.find(".cancel_info").hide()}};return b});M.closure(function(c){var b=c("dialog/confirm"),a=c("/youyudf/js/hotel/order_zx");a.init()});