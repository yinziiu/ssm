/**
 * 特价APP相关js.
 * @namespace
 * @author yanan3
 */
var SalesApp = {

	/**
	 * 网站根目录
	 * @default http://m.mafengwo.cn
	 */
	root : 'https://m.mafengwo.cn',

	/**
	 * 判断是否在特价App中
	 * @param {String|String[]} [want] 判断是不是指定的平台，可以传数组
	 * @return {Boolean|String} 如果是app返回平台
	 */
	isApp : function(want) {
		if(!("_isApp" in SalesApp.isApp)) {
			if(navigator.userAgent.indexOf('com.mafengwo.mfwios')>=0
                || navigator.userAgent.indexOf('com.mafengwo.MFWIOS')>=0) {
				SalesApp.isApp._isApp = 'ios';
			} else if (navigator.userAgent.indexOf('com.mfw.mfwapp')>=0) {
				SalesApp.isApp._isApp = 'android';
			} else if (navigator.userAgent.indexOf('cn.mafengwo.www')>=0
					||navigator.userAgent.indexOf('cn.mafengwo.tgminhouse')>=0) {
				SalesApp.isApp._isApp = 'guide_ios';
			} else if (navigator.userAgent.indexOf('com.mfw.roadbook')>=0) {
				SalesApp.isApp._isApp = 'guide_android';
			} else {
				SalesApp.isApp._isApp = false;
			}
		}
		if(arguments.length) {
			var checkList = [],
				i;
			if((typeof want) === 'string') {
				if(want){
					want = [want];
				}
			}
            if (want instanceof Array) {
                for (i = 0; i < want.length; i++) {
                	var w = want[i];
                    if (w == 'shop') {
                        checkList.push('ios', 'android');
                    } else if (w == 'guide') {
                        checkList.push('guide_ios', 'guide_android');
                    } else {
                        checkList.push(want);
                    }
                }
            }
			if(checkList.length) {
				for(i=0;i<checkList.length;i++) {
					if(checkList[i]==SalesApp.isApp._isApp) {
						return true;
					}
				}
			}
            return false;
		}
		return SalesApp.isApp._isApp;
	},

	/**
	 * 获取当前APP版本
	 * @return {Number} 版本号，格式为30304，即3.3.4
	 */
	appVersion : function() {
		var callee = SalesApp.appVersion;
		if(!('_v' in callee)) {
			callee._v = 0;
			var ver,vl;
			switch(SalesApp.isApp()) {
				case 'ios' :
				case 'guide_ios' :
				case 'guide_android' :
					ver = /mfwappver\/([\d\.]+)/.exec(navigator.userAgent);
					vl = ver.length;
					if(vl) {
						ver = ver[1].split('.');
						vl = ver.length;
						callee._v = ver[0]*10000;
						if(vl>1)
							callee._v += ver[1]*100;
						if(vl>2)
							callee._v += parseInt(ver[2],10);
					}
					break;
				case 'android':
					ver = /mfwappver\/(\d+)/.exec(navigator.userAgent);
					vl = ver.length;
					if(ver&&vl) {
						ver = ver[1];
						vl = ver.length;
						if(ver[0]>=3) {//v3以下不考虑，目前只是简单处理，假定版本号永远为3位
							callee._v = ver[0]*10000;
							if(vl>1)
								callee._v += ver[1]*100;
							if(vl>2)
								callee._v += parseInt(ver[2],10);
						}
					}
					break;
				default:
					break;
			}
		}
		return callee._v;
	},

    /**
	 * 支持写法：
	 * SalesApp.check('guide', 70700);//攻略7.7.0
	 * SalesApp.check('guide_ios', 70700);//攻略ios7.7.0
	 * SalesApp.check('shop', 30000);//商城3.0.0
	 * SalesApp.check('ios', 30000);//商城ios3.0.0
	 * SalesApp.check({'guide_ios':070400,'guide_android':070601,'shop':0});//攻略ios7.4.0、攻略android7.6.1、商城全版本
	 * SalesApp.check({'guide_ios':{version:070400,value:'aaa'},'guide_android':{version:070601,value='bbb'},'test');//攻略ios7.4.0返回aaa、攻略android7.6.1返回bbb，其它返回test，类似switch case的需求
     * @param {Object|String} config
     * @param {*} [defaultValue=false]
     * @returns {boolean|*}
     */
	check: function(config,defaultValue) {
        var configs = {};
        if(arguments.length>0) {
			if(arguments.length>1) {
				if(typeof config=='string') {
                    configs[config] = {
                        version: arguments[1]
                    };
                    defaultValue = false;
                }
            } else {
                configs = config;
                defaultValue = false;
            }
            for (var app in configs) {
                if (configs.hasOwnProperty(app)) {
                    var conf = configs[app];
                    if (SalesApp.isApp(app)) {
                        var version = 0;
                        if (typeof conf === 'number') {
                            version = conf;
                        } else if (typeof conf === 'string') {
                            version = conf | 0;
                        } else if (typeof conf === 'object') {
                            version = conf.version | 0;
                        }
                        if (version == 0 || SalesApp.appVersion() >= version) {
                            if('value' in conf) {
                            	if(typeof conf.value=='function') {
                            		return conf.value();
								} else {
                            		return conf.value;
								}
							} else {
                                return true;
                            }
                        }
                    }
                }
            }
            return defaultValue;
		} else {
        	return !!SalesApp.isApp();
		}
    },

	/**
	 * 判断是否在微信
	 */
	isWechat : function() {
		return navigator.userAgent.indexOf('MicroMessenger')>=0;
	},
	/**
	 * 判断是否在QQ中
	 * @returns {boolean}
	 */
	isQq : function() {
		return /QQ[^B]/.test(navigator.userAgent);
	},
	isIos : function() {
		return /iPhone\sOS/.test(navigator.userAgent);
	},
	isAndroid : function() {
		return /Android/i.test(navigator.userAgent);
	},
	//------------------ GOTO ----------------
	/**
	 * @ignore
	 */
	_goto : function(name, args) {
		var url = SalesApp['url'+name].apply(this,args);
		if(url) {
			//为了解决app部分页面只监听了用户点击的事件
			var a = document.createElement('A');
			a.href = url;
			document.body.appendChild(a);
			a.click();
			document.body.removeChild(a);
		}
	},
	/**
	 * 页面跳转：登录页
	 */
	gotoLogin : function() {
		SalesApp._goto('Login',arguments);
	},
	/**
	 * 页面跳转：特价产品
	 * @param {Number} sales_id 必填，产品ID
	 */
	gotoSales : function(sales_id) {
		SalesApp._goto('Sales',arguments);
	},
	/**
	 * 页面跳转：订单列表页
	 * @param {String} [tab] 选填，订单状态（可选值：''-不限；'payed'-已支付；'unpay'-未支付）
	 */
	gotoOrder : function(tab) {
		SalesApp._goto('Order',arguments);
	},
	/**
	 * 页面跳转：订单详情页
	 * @param {String} order_id 必填，订单号
	 */
	gotoOrderDetail : function(order_id) {
		SalesApp._goto('OrderDetail',arguments);
	},
	/**
	 * 页面跳转：收藏夹 (H5暂不支持)
	 */
	gotoFav : function() {
		SalesApp._goto('Fav',arguments);
	},
	/**
	 * 页面跳转：通知
	 * @param {String} tab 选填，通知类型（可选值：''-不限；'sys'-系统通知；'private'-私信；'article'-文章消息）
	 */
	gotoNotify : function(tab) {
		SalesApp._goto('Notify',arguments);
	},
	/**
	 * 页面跳转：优惠券列表（H5暂不支持）
	 * @param {String} tab 选填，优惠券状态（可选值：''-不限；'available'-可用；'used'-已用；'expired'-过期）
	 */
	gotoCoupon : function(tab) {
		SalesApp._goto('Coupon',arguments);
	},

	//------------------ URL ----------------
    /**
     * 获取链接：登录页url
     * @param {string} [url]
     * @return {String}
     */
    urlLoginForAndroid : function(url) {
        if(SalesApp.isApp()=='android'&& SalesApp.appVersion()>=30400) {
            return 'mfwapp://page/login';
        } else if (SalesApp.isApp()=='guide_android') {
            return 'travelguide://page/login';
        }
        return 'https://passport.mafengwo.cn/?return_url='+encodeURIComponent(url||location.href);
    },
	/**
	 * 获取链接：登录页url
	 * @param {string} [url]
	 * @return {String}
	 */
	urlLogin : function(url) {
		return SalesApp.check({
			'shop':{
				version:30400,
				value:'mfwapp://page/login'
			},
			'guide':{
				value:'travelguide://page/login'
			}
		},'https://passport.mafengwo.cn/?return_url='+encodeURIComponent(url||location.href));
	},
	/**
	 * 获取链接：特价产品
	 * @param {Number} sales_id 必填，sales_id
	 * @return {String}
	 */
	urlSales : function(sales_id) {
		return SalesApp.root+"/sales/"+sales_id+".html";
	},
	/**
	 * 获取链接：订单列表页
	 * @param {String} tab 选填，订单状态（可选值：''-不限；'payed'-已支付；'unpay'-未支付）
	 * @return {String}
	 */
	urlOrder : function(tab) {
		var tabMap = {
			"payed":3,
			"unpay":1
		};
		var app = SalesApp.isApp();
		var version = SalesApp.appVersion();
		if ((app == 'guide_ios' && version > 70101) || (app == 'guide_android' && version > 60101)) {
			return 'http://m.mafengwo.cn/nb/public/sharejump.php?type=31';
		} else if ((app == 'ios' || app == 'android') && version >= 30400) {
			return "mfwapp://page/order" + (tab ? ("/" + tab) : "");
		} else {
			return SalesApp.root + "/order_center/" + (tab ? ("?status=" + tabMap[tab]) : "")
		}
	},
	/**
	 * 获取链接：订单详情页
	 * @param {String} order_id
	 * @return {String}
	 */
	urlOrderDetail : function(order_id) {
        if(SalesApp.isApp()=='ios'&&SalesApp.appVersion()>=30400||
            SalesApp.isApp()=='android') {
			return "mfwapp://page/order/detail/id=" + order_id;
		} else if (SalesApp.isApp()=='guide_ios'&&SalesApp.appVersion()<=70403){
            //fyn 2016-04-23 ios 7.4.3及以下版本不支持https
            return "http://m.mafengwo.cn/nb/public/sharejump.php?type=1008&tradeid="+order_id;
        } else if(SalesApp.isApp()=='guide_ios'&&SalesApp.appVersion()>=70000||
            SalesApp.isApp()=='guide_android'&&SalesApp.appVersion()>=60000) {
            return "https://m.mafengwo.cn/nb/public/sharejump.php?type=1008&tradeid="+order_id;
        }else {
        	return SalesApp.root + "/sales/order/detail?id=" + order_id;
		}
	},
	urlOrderPay : function(order_id) {
		if(SalesApp.check('ios',30400)||SalesApp.check('android',40000) ){
			return "mfwapp://page/product/pay?id="+order_id;
		} else if (SalesApp.isApp()=='guide_ios'&&SalesApp.appVersion()<=70403){
			//fyn 2016-04-23 ios 7.4.3及以下版本不支持https
			return "http://m.mafengwo.cn/nb/public/sharejump.php?type=1004&tradeid="+order_id;
		} else if(SalesApp.check('guide_ios',70000)|| SalesApp.check('guide_android',60000)) {
			return "https://m.mafengwo.cn/nb/public/sharejump.php?type=1004&tradeid="+order_id;
		}
	},
	/**
	 * 获取链接：收藏夹 (H5暂不支持)
	 * @return {String}
	 */
	urlFav : function() {
		if(SalesApp.isApp()&&SalesApp.appVersion()>=30400) {
			return "mfwapp://page/fav/";
		} else {
			return "";
		}
	},
	/**
	 * 获取链接：通知
	 * @param {String} tab 选填，通知类型（可选值：''-不限；'sys'-系统通知；'private'-私信；'article'-文章消息）
	 * @return {String}
	 */
	urlNotify : function(tab) {
		var notifyMap = {
			"sys":"",
			"private":"private",
			"article":"article"
		};
		if(SalesApp.isApp()&&SalesApp.appVersion()>=30400) {
			return "mfwapp://page/mynotify"+(tab?("/"+tab):"");
		} else {
			return SalesApp.root+"/user/msg.php"+(tab?("?type="+notifyMap[tab]):"");
		}
	},
	/**
	 * 获取链接：优惠券列表 (H5暂不支持)
	 * @param {String} [tab] 选填，优惠券状态（可选值：''-不限；'available'-可用；'used'-已用；'expired'-过期）
	 * @return {String}
	 */
	urlCoupon : function(tab) {
		return SalesApp.check({
			'shop':{
				'version':30304,
				'value':"mfwapp://page/coupon"+(tab?("/"+tab):"")
			},
			'guide':{
				'value':'http://m.mafengwo.cn/nb/public/sharejump.php?type=34'
			}
		}, SalesApp.root+"/sales/coupon.php");
	},

	/**
	 * 分享
	 * @param {String} title 必填，分享标题
	 * @param {String} [content] 可选，
	 * @param {String} [pic] 可选，图片
 	 * @param {String} [url] 可选，分享链接
	 */
	share : function(title,content,pic,url) {
		if(!title) {
			return;
		}
		if(!content) {
			content = title;
		}
		if(!url) {
			url = location.href;
		}
		var link;
		if(SalesApp.isApp()&&SalesApp.appVersion()>=30304) {
			link = "mfwapp://share?url="+encodeURIComponent(url);
		} else {
			link = "http://www.mafengwo.cn/connect_share.php?title="+encodeURIComponent(title);
			link += "&content="+encodeURIComponent(content);
			if(pic) {
				link += "&pic="+encodeURIComponent(pic);
			}
			link += "&url="+encodeURIComponent(url)+"&key=wb";
		}
		location.href = link;
	},

	/**
	 * APP分享成功事件 (暂不支持)
	 * @param {Function} handler 处理分享的函数
	 */
	onShare : function(handler) {
		document.addEventListener("mfwshare", function(e) {
			handler.call(this,e,e.mfwShareChannel);
		}, false);
	},

	/**
	 * 微信首次显示页面的遮罩层
	 * @param {String} type 遮罩类型，目前只支持'fav'
	 * @param {String} [key] 唯一标示，区分不同的活动
	 * @param {Boolean} [forceShow] 强制显示，忽略标示
	 */
	wechatMask : function(type,key,forceShow, showInAllAgent) {
		if(SalesApp.isWechat() || showInAllAgent) {
			type = type || "fav";
			key = '_wxmsk_'+(key || type);
			if(!localStorage[key]||forceShow) {
				var mask = document.getElementsByClassName('wx-mask')[0],
					know;
				if(!mask) {
					mask = document.createElement('div');
					know = document.createElement('span');
					know.className = 'know';
					mask.appendChild(know);
					document.body.appendChild(mask);
				} else {
					know = mask.getElementsByClassName('know')[0];
				}
				mask.className = 'wx-mask wx-mask-'+type;
				mask.style.display = 'block';
				know.addEventListener('click',function() {
					if(!forceShow)
						localStorage[key] = 1;
					mask.style.display = 'none';
				},false);
			}
		}
	},

	/**
	 * 给A标签绑定点击后弹出QQ的事件
	 * @param {HTMLElement|jQuery} el 绑定事件的元素
	 * @param {String} [qq] QQ号
	 * @param {String} [key] 非必填项，当地游营销号需要用
	 */
	bindConactQQ : function(el, qq, key) {
		if(arguments.length == 1) {
			for(var i=0;i<el.length;i++) {
				SalesApp.bindConactQQ(el[i],el[i].getAttribute('data-account'), el[i].getAttribute('data-qq'));
			}
		}
		try{
			if(!qq) {
				return;
			}
			if(el && !(el instanceof HTMLElement)){
				if(!el.length) {
					return;
				}
				el = el.get(0);
			}
			if(el) {
				var app = SalesApp.isApp(),
					ver = SalesApp.appVersion();
				if( app == 'android' || (app=='guide_android' && ver >= 60000)) {
					el.setAttribute('href','mqqwpa://im/chat?chat_type=wpa&uin='+qq);
				} else if (app == 'ios' || (app=='guide_ios' && ver >= 70000)) {
					el.setAttribute('href','mqq://im/chat?chat_type=wpa&uin=' + qq + '&version=1&src_type=web');
				} else {
					if(key) {
						var o = document.createElement('SCRIPT');
						o.src = 'http://wpa.b.qq.com/cgi/wpa.php';//+'?key='+key;
						o.charset = 'utf-8';
						o.onload = function () {
							document.body.removeChild(o);
							BizQQWPA.addCustom({
								aty: '0',
								a: '0',
								nameAccount: qq,
								selector: '',
								node: el
							});
						};
						document.body.appendChild(o);
					} else {
						el.setAttribute('href','http://wpa.qq.com/msgrd?v=3&uin='+qq+'&site=qq&menu=yes');
					}
				}
			}
		} catch (e) {

		}
	}

};

if(window.M && window.M.define){

	M.define('/mobile/js/salesapp', function (require, exports, module) {
		module.exports = SalesApp;
	});

}