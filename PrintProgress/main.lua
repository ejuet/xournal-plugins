-- Register all Toolbar actions and intialize all UI stuff
function initUi()
  print("Hello from Example: Plugin initUi called\n");

  ref = app.registerUi({["menu"] = "Print Progress", ["callback"] = "printProgress", ["accelerator"] = "<Control>l"});
  print("Menu reference:");
  
  
  
end


local filename = ".xppbm"

-- Callback if the menu item is executed
function printProgress()
  --- print("result = " .. result)
  
	local docStructure = app.getDocumentStructure()
	
	local numPages = #docStructure["pages"]
	local page = docStructure["currentPage"]
	
	result = app.msgbox("Page " .. tostring(page) .. "/" .. tostring(numPages) .. ", " .. tostring((page/numPages)*100) .."%", {[1] = "Ok"});
	
end
