	/**
	 * 规格多选
	 * script dom容器
	 * jsonlist 规格json字符串
	 */
	function checksize(script, jsonlist){
		// 获取SKU列表
		sku_ids = $.parseJSON(jsonlist);
		// 检查SKU组合
		$.cart.checkSkus(script, sku_ids);
		// 绑定规格事件
		$.cart.checkSpecs(script, sku_ids, script.find("li"), function(sku) {
			// 是否为默认规格
			var is_default = $(this).data("is-default");
			if (is_default) {
				// 如果是默认规格则标识将切换SKU的图片相册
				change_sku_images = true;
			}
			// SKU存在
			getSkuInfo(sku.sku_id, function(sku) {
				setSkuInfo(sku);
				$("title").html(sku.sku_name);
			});
		}, function() {
			//alert("before error.");
			//throw SyntaxError();
			//alert("after error.");
			// 是否为默认规格
			var is_default = $(this).data("is-default");
			if (is_default) {
			// 如果是默认规格则标识将切换SKU的图片相册
				change_sku_images = true;
			}
			// SKU不存在
			//$(".add-cart").addClass("disabled");
			//$(".buy-goods").addClass("disabled");
			$(".SZY-GOODS-NUMBER").html("库存不足");
			$("title").html($(".SZY-GOODS-NAME-BASE").text());
		});
	}

	function getSkuId() {
		var spec_ids = [];

		$(".choose").find(".attr").each(function() {
			var spec_id = $(this).find(".selected").data("spec-id");
			spec_ids.push(spec_id);
		});

		var sku_id = $.cart.getSkuId(spec_ids, sku_ids);

		if (sku_id == null) {
			return false;
		}

		return sku_id;
	}

	function changeLocation(region_code) {
		if (region_code == undefined || region_code == null || region_code.length == 0) {
			return;
		}

		var sku_id = getSkuId();

		return $.get("/goods_change-location", {
			"sku_id": sku_id,
			"region_code": region_code
		}, function(result) {
			if (result.code == 0) {
				local_region_code = region_code;
				sku_freights[region_code] = result.data;

				if (result.data.is_last == 0) {
					return;
				}

				$(".freight-info").html(result.data.freight_info);
				$(".freight-free-info").find(".content").html("");

				if ($.isArray(result.data.free_list) && result.data.free_list.length > 0) {

					for (var i = 0; i < result.data.free_list.length; i++) {
						$(".freight-free-info").find(".content").append("<p>" + result.data.free_list[i] + "</p>");
					}

					// 显示包邮条件
					$(".freight-free-info").show();
				} else {
					// 隐藏包邮条件
					$(".freight-free-info").hide();
				}

				if ($(document).data("SZY-SKU-" + sku_id)) {
					var sku = $(document).data("SZY-SKU-" + sku_id);
					setSkuInfo(sku);
				} else {

					// 库存
					if (result.data.goods_number > 0) {
						if ("1" == 1) {
							$(".SZY-GOODS-NUMBER").html("库存" + result.data.goods_number + "件");
						} else {
							$(".SZY-GOODS-NUMBER").html("");
						}
					} else {
						$(".SZY-GOODS-NUMBER").html("库存不足");
					}
					// 购买
					if (result.data.goods_number == 0) {
						//$(".add-cart").addClass("disabled");
						//$(".buy-goods").addClass("disabled");
					} else {
						$(".buy-goods").removeClass("disabled");
						$(".add-cart").removeClass("disabled");
					}
				}
			}
		}, "json");
	}

	function getSkuInfo(sku_id, callback) {
		if ($(document).data("SZY-SKU-" + sku_id)) {
			var sku = $(document).data("SZY-SKU-" + sku_id);
			// 回调
			if ($.isFunction(callback)) {
				callback.call({}, sku);
			}
		} else {
			$.get('/goods/sku', {
				sku_id: sku_id,
				is_lib_goods: ""
			}, function(result) {
				if (result.code == 0) {
					var sku = result.data;
					$(document).data("SZY-SKU-" + sku_id, sku);
					// 回调
					if ($.isFunction(callback)) {
						callback.call({}, sku);
					}
				} else {
					$.msg(result.message, {
						time: 5000
					});
				}
			}, "json");
		}
	}

	// 设置SKU信息
	function setSkuInfo(sku) {
		var is_lib_goods = "";
		if (is_lib_goods == true) {
			return false;
		}
		
		if (sku == undefined || sku == null || sku == false) {
			//$(".add-cart").addClass("disabled");
			//$(".buy-goods").addClass("disabled");
			$(".SZY-GOODS-NUMBER").html("库存不足");
			return;
		}

		// 点击默认规格才会切换相册
		if (change_sku_images == true) {
			// 相册
			$(".goodsgallery").goodsgallery({
				images: sku.sku_images,
				video: ""
			});
			change_sku_images = false;
		}

		var goods_number = sku.goods_number;

		if (goods_number > 0) {
			if (sku_freights[local_region_code]) {
				if (sku_freights[local_region_code].limit_sale == 1) {
					// 区域限售商品
				}
			} else {
				changeLocation(local_region_code).always(function(result) {
					if (result.code == 0 && result.data.limit_sale == 1) {
						setSkuInfo(sku);
					}
				});
				return;
			}
		}

		// 商品名称
		$(".SZY-GOODS-NAME").html(sku.sku_name);
		// 售价
		$(".SZY-GOODS-PRICE").html(sku.goods_price_format);
		// 市场价
		$(".SZY-MARKET-PRICE").html(sku.market_price_format);

		if (parseFloat(sku.market_price) == 0) {
			$(".SZY-MARKET-PRICE").parents(".show-price").hide();
		} else {
			$(".SZY-MARKET-PRICE").parents(".show-price").show();
		}
		// 预售定金显示
		if (parseFloat(sku.earnest_money) > 0 && $('.SZY-EARNST-MONEY').length > 0) {
			$('.SZY-EARNST-MONEY').html(sku.earnest_money_format);
			$('.SZY-TAIL-MONEY').html(sku.tail_money_format);
		}

		// 库存
		if (goods_number > 0) {
			if ("1" == 1) {
				$(".SZY-GOODS-NUMBER").html("库存" + goods_number + "件");
			} else {
				$(".SZY-GOODS-NUMBER").html("");
			}
		} else {
			$(".SZY-GOODS-NUMBER").html("库存不足");
		}

		if (goods_number == 0) {
			//$(".add-cart").addClass("disabled");
			//$(".buy-goods").addClass("disabled");
		} else {
			$(".buy-goods").removeClass("disabled");
			$(".add-cart").removeClass("disabled");
		}

		$(".amount-input").data("amount-min", 1);
		$(".amount-input").data("amount-max", goods_number);

		if (goods_number > 0 && $(".amount-input").val() == 0) {
			$(".amount-input").val(1);
		} else if (goods_number == 0 && $(".amount-input").val() != 0) {
			$(".amount-input").val(0);
		}

		var goods_number_input = parseInt($(".amount-input").val());

		if (goods_number_input > goods_number) {
			$(".amount-input").val(goods_number);
		}

		// 判断促销模块是否显示
		var show_activity = false;

		// 

		// 会员价格
		if (sku.rank_prices != undefined && sku.rank_prices != null) {
			$(".SZY-RANK-LIST").find("p").remove();
			var html = "";
			for (var i = 0; i < sku.rank_prices.length; i++) {
				var item = sku.rank_prices[i];
				html += "<p>" + item.rank_name + ":" + item.rank_price_format + "</p>";
			}
			$(".SZY-RANK-LIST").append(html);
			$(".SZY-RANK-PRICES").show();
			// 展示促销
			show_activity = true;
		} else {
			$(".SZY-RANK-PRICES").hide();
		}

		if (sku.order_act_id) {
			show_activity = true;
		}
		if (sku.member_price_message) {
			$(".SZY-RANK-PRICES").show();
			$(".SZY-RANK-MESSAGE").html(sku.member_price_message);
			// 展示促销
			show_activity = true;
		} else {
			$(".SZY-RANK-PRICES").hide();
		}

		// 处理赠品
		if (sku.gift_list && sku.gift_list.length > 0) {

			$(".SZY-GIFT-LIST").show();
			$(".SZY-GIFT-LABEL").nextAll().remove();

			for (var i = 0; i < sku.gift_list.length; i++) {
				var gift = sku.gift_list[i];
				var template = $("#SZY_GIFT_TEMPLATE").html();
				var element = $($.parseHTML(template));
				$(element).find("img").attr("src", gift.goods_image_thumb);
				$(element).find("a").attr("href", "/" + gift.gift_sku_id + ".html");
				$(element).find("a").attr("title", "/" + gift.sku_name);
				$(element).find(".gift-number").html("×" + gift.gift_number);
				$(".SZY-GIFT-LABEL").after(element);
			}

			// 展示促销
			show_activity = true;
		} else {
			$(".SZY-GIFT-LIST").hide();
			$(".SZY-GIFT-LABEL").nextAll().remove();
		}

		if (show_activity) {
			$(".SZY-ACTIVITY").show();
		} else {
			$(".SZY-ACTIVITY").hide();
		}
	}