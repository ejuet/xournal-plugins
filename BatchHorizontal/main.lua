-- Register all Toolbar actions and intialize all UI stuff
function initUi()
  ref = app.registerUi({["menu"] = "Batch Horizontal", ["callback"] = "exampleCallback", ["accelerator"] = "<Control>t"});
end

-- Callback if the menu item is executed
function exampleCallback()
  --- result = app.msgbox("Test123", {[1] = "Yes", [2] = "No"});
  --- print("result = " .. result)
  
	local docStructure = app.getDocumentStructure()
	local numPages = #docStructure["pages"]
	local page = docStructure["currentPage"]
	local width = docStructure["pages"][page]["pageWidth"]
	local height = docStructure["pages"][page]["pageHeight"]

  
	for i=1, numPages do
	  app.setCurrentPage(i)
	  app.setPageSize(height, width)
	end

	app.setCurrentPage(page)
	
	-- app.uiAction({["action"]="ACTION_TOOL_SELECT_RECT"})
	
	
    --- result = app.msgbox(app.getStrokes(), {[1] = "Yes", [2] = "No"});

end