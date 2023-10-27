-- Register all Toolbar actions and intialize all UI stuff
function initUi()

  ref = app.registerUi({["menu"] = "Batch Toggle Grid", ["callback"] = "exampleCallback", ["accelerator"] = "<Control>b"});

  print("Example plugin registered\n");
end

local toggleState = false

-- Callback if the menu item is executed
function exampleCallback()
  --- result = app.msgbox("Test123", {[1] = "Yes", [2] = "No"});
  --- print("result = " .. result)
  
	local docStructure = app.getDocumentStructure()
	local numPages = #docStructure["pages"]
	local page = docStructure["currentPage"]
	
	local background = "a"
	
	if toggleState == true then
		background = "graph";
	  else
		background = "plain";
	  end
	  
	toggleState = not toggleState

  
	for i=1, numPages do
	  app.setCurrentPage(i)
	  app.changeCurrentPageBackground(background);
	end

	app.setCurrentPage(page)
	
    --- result = app.msgbox(app.getStrokes(), {[1] = "Yes", [2] = "No"});

end