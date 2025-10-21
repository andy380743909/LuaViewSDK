

print("摇一摇测试脚本");

window:callback({
	ShakeBegin =  function()
		window:backgroundColor(0xff00ff);
		print("window.shakeBegin");
	end,
	ShakeCanceled = function()
		window:backgroundColor(0xff);
		print("window.shakeCancelled");
	end,
	ShakeEnded = function()
		window:backgroundColor(0xffFFff);
		print("window.shakeEnded");
	end
})

label  = Label();
label:text ( "  摇一摇变色  " );
label:frame(0,0,320,60);
